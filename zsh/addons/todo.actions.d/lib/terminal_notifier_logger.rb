class TerminalNotifierLogger
  def notify_start task
    # TerminalNotifier.notify('Pomodoro started', title: 'Pomotxt', sound: 'Glass')
    system("notify-send -c 'info' 'Pomodoro started' 'Pomotxt' -i dialog-information")
  end

  def notify_completed task
    # TerminalNotifier.notify('Pomodoro completed!', title: 'Pomotxt', sound: 'Glass')
    system("notify-send -c 'info' 'Pomodoro completed' 'Pomotxt' -i dialog-information")
  end
end
