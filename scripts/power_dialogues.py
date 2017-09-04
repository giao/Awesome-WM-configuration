#!/usr/bin/python

try:
    from Tkinter import *
except:
    from tkinter import *
from time import sleep

root = Tk()
msg = "Would you like to shut down?"
timer_time = 15 # seconds

def ok_clicked():
    print("Clicked")

def cancel_clicked():
    root.destroy()
    root.quit()

def timer_tick(buttonYes):
    sleep(1)
    global timer_time
    timer_time -= 1
    #buttonYes['text'] = 'Yes (' + str(timer_time) + ')'
    print('Yes (' + str(timer_time) + ')')

if __name__ == "__main__":
    root.title(msg)
    root.geometry('300x100')

    label = Label(root, text=msg).grid(row = 0, column = 0, columnspan = 2, sticky='nsew') #pack(side = 'left', fill = 'both')
    buttonYes = Button(root, text="Yes", command=ok_clicked).grid(row=1, column=0, sticky='nsew')
    buttonNo = Button(root, text="No", command=cancel_clicked).grid(row=1, column=1, sticky='nsew')

    root.rowconfigure(0, weight=2)
    root.rowconfigure(1, weight=1)
    root.columnconfigure(0, weight=1)
    root.columnconfigure(1, weight=1)
    timer_tick(buttonYes)
    root.mainloop()
