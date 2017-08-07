from multiprocessing import Process

import os

def run_proc(name):
    print('子进程运行中，Name = %s, pid = %d....' % (name,os.getpid()))


if __name__ == '__main__':
    print('父进程 %d'% os.getpid())
    p = Process(target=run_proc,args=('test'))
    print('子进程执行')
    p.start()
    p.join()
    print('子进程结束')



