#!/usr/bin/python

try:
    from Tkinter import *
except:
    from tkinter import *
import argparse
import os

root = Tk()
msg = {
    'shutdown' : "Would you like to shut down?",
    'reboot' : "Would you like to reboot?",
    'suspend' : "Would you like to suspend?",
}
cmd = {
    'shutdown' : "poweroff",
    'reboot' : "reboot",
    'suspend' : "systemctl suspend",
}
key = ''
timer_time = 15 # seconds
fg_color = "#1B4965"
border_color = "#6D8B9D"
bg_color = "#F0F0F0"

def ok_clicked():
    cancel_clicked()
    os.system(cmd[key])

def cancel_clicked():
    root.destroy()
    root.quit()

def timer_tick():
    global timer_time
    if timer_time >= 1:
        buttonYes['text'] = 'Yes (' + str(timer_time) + ')'
    else:
        buttonYes['text'] = 'Yes'
    root.after(1000, timer_tick)
    if timer_time == 0:
        ok_clicked()
    timer_time -= 1

if __name__ == "__main__":
    root.title(msg)
    root.geometry('300x100')

    parser = argparse.ArgumentParser(description='Script for creating power dialogues')
    group = parser.add_mutually_exclusive_group(required=True)
    group.add_argument("--shutdown", action='store_true', help="Shut Down the PC")
    group.add_argument("--reboot", action='store_true', help="Reboot the PC")
    group.add_argument("--suspend", action='store_true', help="Suspend the PC")
    args = parser.parse_args()
    if args.shutdown:
        key = 'shutdown'
    if args.reboot:
        key = 'reboot'
    if args.suspend:
        key = 'suspend'

    label = Label(root, text=msg[key], bg=bg_color, fg=fg_color, highlightbackground=border_color, highlightcolor=border_color, highlightthickness=1).grid(row = 0, column = 0, columnspan = 2, sticky='nsew') #pack(side = 'left', fill = 'both')
    buttonYes = Button(root, text="Yes", bg=bg_color, fg=fg_color, highlightbackground=border_color, highlightcolor=border_color, highlightthickness=1, command=ok_clicked)
    buttonYes.grid(row=1, column=0, sticky='nsew')
    buttonNo = Button(root, text="No", bg=bg_color, fg=fg_color, highlightbackground=border_color, highlightcolor=border_color, highlightthickness=1, command=cancel_clicked).grid(row=1, column=1, sticky='nsew')

    root.rowconfigure(0, weight=2)
    root.rowconfigure(1, weight=1)
    root.columnconfigure(0, weight=1)
    root.columnconfigure(1, weight=1)
    timer_tick()
    root.mainloop()
