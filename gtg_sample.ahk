#NoEnv
#SingleInstance force
#Persistent
SetWorkingDir %A_ScriptDir%

SetTitleMatchMode,2

#WinActivateForce

sleepms = 250

; 使い方
; - 「指定条件を満たしていたら、指定アクションを実行する」という条件式を書き並べる

Loop{
  t := A_Hour*100 + A_Min

  ; ==== ここから編集 ====

  ; タイトルに "Firefox" かつ "sta" を含む場合に警告する.
  ; → Firefox で筆者(stakiran)絡みのページを開いた時に発動する.
  if(has_title("Firefox") and has_title("sta")){
    warn()
  }

  ; 17:00 ～ 18:00 の間にメモ帳を使うと警告する.
  ; → 例としては微妙だが, 17-18 時でメモ帳使用時に警告するサンプル.
  if(1700<=t and t<=1800 and has_title("メモ帳")){
    warn()
  }

  ; ==== ここまで編集 ====

  Sleep %sleepms%
}

; ----------------
; 使えるアクション
; ----------------

; 個人的には揺らして非アクティブにしたら十分かなと思う.
; いちいち shake() blur() と書くのはだるいので関数化した.
warn(){
  shake()
  blur()
}

; 今のアクティブウィンドウを非アクティブにする.
; (内部的にはデスクトップをアクティブにしている)
blur(){
  WinActivate, ahk_class Progman
  return
}

; 今のアクティブウィンドウを揺らす.
shake(){
  WinGetPos, original_xpos, original_ypos

  cnt := 0
  move_count := 10
  move_range := 20
  Loop{
    if(cnt > move_count){
      break
    }
    Random, x_diff, 0, %move_range%
    Random, y_diff, 0, %move_range%
    WinMove, original_xpos+x_diff, original_ypos+y_diff
    cnt := cnt + 1
  }

  WinMove, original_xpos, original_ypos
  return
}

; 指定メッセージをダイアログで表示する.
; 注意点:
; - ダイアログはプライマリモニタの中央に出る
; - 条件に一致する間は何度も出てしまうので, 呼び出し方は考えること.
message(msg){
  MsgBox %msg%
  return
}

; 今のアクティブウィンドウを最小化する
; → 利用不可能.
;    最小化済ウィンドウをさらに WinMinimize するとウィンドウが限りなく小さくなる in Win7
;minimize(){
;  WinMinimize
;  return
;}

; --------------
; 使える条件判断
; --------------

; 部分一致可能. 大文字小文字は区別する.
has_title(param){
  ret := false
  IfWinActive, %param%
  {
    ret := true
  }
  return ret
}

; SetTitleMatchMode は効かない.
; hidemaru.exe など大文字小文字問わずに完全一致.
has_exe(param){
  ret := false
  IfWinActive, ahk_exe %param%
  {
    ret := true
  }
  return ret
}

; SetTitleMatchMode は効かない.
; Hidemaru32Class など大文字小文字込みで完全一致.
has_class(param){
  ret := false
  IfWinActive, ahk_class %param%
  {
    ret := true
  }
  return ret
}
