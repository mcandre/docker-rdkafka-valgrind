# mcandre/docker-rdkafka-valgrind: memory leak hunting of rdkafka, in Docker

# EXAMPLES

```console

$ docker run -it mcandre/docker-rdkafka-valgrind /bin/rdkafka-example
$

$ docker run -it mcandre/docker-rdkafka-valgrind valgrind /bin/rdkafka-example
==1== Memcheck, a memory error detector
==1== Copyright (C) 2002-2015, and GNU GPL'd, by Julian Seward et al.
==1== Using Valgrind-3.12.0 and LibVEX; rerun with -h for copyright info
==1== Command: /bin/rdkafka-example
==1== 
==1== Invalid read of size 8
==1==    at 0x1847D6: ??? (memcpy.s:18)
==1==    by 0x186F35: __copy_tls (__init_tls.c:60)
==1==    by 0x18707B: __init_tls (__init_tls.c:127)
==1==    by 0x177AB9: __init_libc (__libc_start_main.c:38)
==1==    by 0x177BD3: (below main) (__libc_start_main.c:70)
==1==  Address 0x2a4370 is not stack'd, malloc'd or (recently) free'd
==1== 
==1== 
==1== Process terminating with default action of signal 11 (SIGSEGV)
==1==  Access not within mapped region at address 0x2A4370
==1==    at 0x1847D6: ??? (memcpy.s:18)
==1==    by 0x186F35: __copy_tls (__init_tls.c:60)
==1==    by 0x18707B: __init_tls (__init_tls.c:127)
==1==    by 0x177AB9: __init_libc (__libc_start_main.c:38)
==1==    by 0x177BD3: (below main) (__libc_start_main.c:70)
==1==  If you believe this happened as a result of a stack
==1==  overflow in your program's main thread (unlikely but
==1==  possible), you can try to increase the size of the
==1==  main thread stack using the --main-stacksize= flag.
==1==  The main thread stack size used in this run was 8388608.
==1== 
==1== HEAP SUMMARY:
==1==     in use at exit: 0 bytes in 0 blocks
==1==   total heap usage: 0 allocs, 0 frees, 0 bytes allocated
==1== 
==1== All heap blocks were freed -- no leaks are possible
==1== 
==1== For counts of detected and suppressed errors, rerun with: -v
==1== ERROR SUMMARY: 1 errors from 1 contexts (suppressed: 0 from 0)

valgrind: the 'impossible' happened:
   main(): signal was supposed to be fatal

   host stacktrace:
   ==1==    at 0x38079878: show_sched_status_wrk (m_libcassert.c:343)

   sched status:
     running_tid=1


Note: see also the FAQ in the source distribution.
It contains workarounds to several common problems.
In particular, if Valgrind aborted or crashed after
identifying problems in your program, there's a good chance
that fixing those problems will prevent Valgrind aborting or
crashing, especially if it happened in m_mallocfree.c.

If that doesn't help, please report this bug to: www.valgrind.org

In the bug report, send all the above text, the valgrind
version, and what OS and version you are using.  Thanks.
```

# REQUIREMENTS

* [Docker](https://www.docker.com)
* [gcc](https://gcc.gnu.org)
* [libc6-dev](https://www.gnu.org/software/libc/), [musl-dev](http://www.musl-libc.org), etc.

## Optional

* [make](https://www.gnu.org/software/make/)

# COMPILE FOR HOST OS TARGET

```console
$ make clean && make
```

# CROSS-COMPILE FOR LINUX TARGET

```console
$ crosscompile/build.sh
$ crosscompile/compile.sh

$ file bin/rdkafka-example 
bin/rdkafka-example: ELF 64-bit LSB shared object, x86-64, version 1 (SYSV), dynamically linked, not stripped

$ ./build.sh
```

# PUBLISH

```console
$ docker push mcandre/docker-rdkafka-example-build-bot
$ docker push mcandre/docker-rdkafka-valgrind
```
