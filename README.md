# mcandre/docker-rdkafka-valgrind: memory leak hunting of rdkafka, in Docker

# EXAMPLES

```console

$ docker run mcandre/docker-rdkafka-valgrind /bin/rdkafka-example
$

$ docker run mcandre/docker-rdkafka-valgrind
==1== Memcheck, a memory error detector
==1== Copyright (C) 2002-2013, and GNU GPL'd, by Julian Seward et al.
==1== Using Valgrind-3.10.0 and LibVEX; rerun with -h for copyright info
==1== Command: /bin/rdkafka-example
==1== 
==1== Invalid read of size 8
==1==    at 0x497AA1: free (in /bin/rdkafka-example)
==1==    by 0x424B5E: rd_free (rd.h:99)
==1==    by 0x424B5E: rd_kafkap_str_destroy (rdkafka_proto.h:206)
==1==    by 0x424B5E: rd_kafka_anyconf_clear (rdkafka_conf.c:1258)
==1==    by 0x424B5E: rd_kafka_anyconf_destroy (rdkafka_conf.c:1303)
==1==    by 0x424C10: rd_kafka_conf_destroy (rdkafka_conf.c:1309)
==1==    by 0x4030CA: main (in /bin/rdkafka-example)
==1==  Address 0x179 is not stack'd, malloc'd or (recently) free'd
==1== 
{
   <insert_a_suppression_name_here>
   Memcheck:Addr8
   fun:free
   fun:rd_free
   fun:rd_kafkap_str_destroy
   fun:rd_kafka_anyconf_clear
   fun:rd_kafka_anyconf_destroy
   fun:rd_kafka_conf_destroy
   fun:main
}
==1== 
==1== Process terminating with default action of signal 11 (SIGSEGV)
==1==  Access not within mapped region at address 0x179
==1==    at 0x497AA1: free (in /bin/rdkafka-example)
==1==    by 0x424B5E: rd_free (rd.h:99)
==1==    by 0x424B5E: rd_kafkap_str_destroy (rdkafka_proto.h:206)
==1==    by 0x424B5E: rd_kafka_anyconf_clear (rdkafka_conf.c:1258)
==1==    by 0x424B5E: rd_kafka_anyconf_destroy (rdkafka_conf.c:1303)
==1==    by 0x424C10: rd_kafka_conf_destroy (rdkafka_conf.c:1309)
==1==    by 0x4030CA: main (in /bin/rdkafka-example)
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
==1== ERROR SUMMARY: 1 errors from 1 contexts (suppressed: 28 from 20)

valgrind: the 'impossible' happened:
   main(): signal was supposed to be fatal

host stacktrace:
==1==    at 0x380A48EF: show_sched_status_wrk (m_libcassert.c:319)

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

--1:0:gdbsrv   VG_(gdbserver) called to terminate again 1
```

# REQUIREMENTS

* [Docker](https://www.docker.com)
* [g++](https://gcc.gnu.org)

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
bin/rdkafka-example: ELF 64-bit LSB executable, x86-64, version 1 (GNU/Linux), statically linked, for GNU/Linux 2.6.32, BuildID[sha1]=f3e38481e4c42fa0126fb192a331b14aa949dd69, not stripped

$ ./build.sh
```

# PUBLISH

```console
$ docker push mcandre/docker-rdkafka-example-build-bot
$ docker push mcandre/docker-rdkafka-valgrind
```
