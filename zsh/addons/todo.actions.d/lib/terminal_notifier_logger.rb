class TerminalNotifierLogger
  def notify_start task
    # TerminalNotifier.notify('Pomodoro started', title: 'Pomotxt', sound: 'Glass')
    system("notify-send -c 'info' 'Pomodoro started' '#{task}' -i dialog-information")
  end

  def notify_completed task
    # TerminalNotifier.notify('Pomodoro completed!', title: 'Pomotxt', sound: 'Glass')
    system("notify-send -c 'info' 'Pomodoro completed' '#{task}' -i dialog-information")
  end
end
