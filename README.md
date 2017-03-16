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
==1== Conditional jump or move depends on uninitialised value(s)
==1==    at 0x49530F: _int_malloc (in /bin/rdkafka-example)
==1==    by 0x49749C: malloc (in /bin/rdkafka-example)
==1==    by 0x49C0A9: strdup (in /bin/rdkafka-example)
==1==    by 0x40325F: rd_strdup (rd.h:104)
==1==    by 0x40325F: rd_kafka_anyconf_set_prop0.isra.2 (rdkafka_conf.c:821)
==1==    by 0x40347C: rd_kafka_defaultconf_set (rdkafka_conf.c:1158)
==1==    by 0x403AE4: rd_kafka_conf_new (rdkafka_conf.c:1168)
==1==    by 0x40308A: main (in /bin/rdkafka-example)
==1==  Uninitialised value was created
==1==    at 0x509B5C: brk (in /bin/rdkafka-example)
==1==    by 0x4D5F64: sbrk (in /bin/rdkafka-example)
==1==    by 0x485AE3: __libc_setup_tls (in /bin/rdkafka-example)
==1==    by 0x480346: __pthread_initialize_minimal (nptl-init.c:285)
==1==    by 0x48577D: (below main) (in /bin/rdkafka-example)
==1== 
{
   <insert_a_suppression_name_here>
   Memcheck:Cond
   fun:_int_malloc
   fun:malloc
   fun:strdup
   fun:rd_strdup
   fun:rd_kafka_anyconf_set_prop0.isra.2
   fun:rd_kafka_defaultconf_set
   fun:rd_kafka_conf_new
   fun:main
}
==1== Conditional jump or move depends on uninitialised value(s)
==1==    at 0x4946D9: _int_free (in /bin/rdkafka-example)
==1==    by 0x403C1E: rd_free (rd.h:99)
==1==    by 0x403C1E: rd_kafkap_str_destroy (rdkafka_proto.h:206)
==1==    by 0x403C1E: rd_kafka_anyconf_clear (rdkafka_conf.c:1258)
==1==    by 0x403C1E: rd_kafka_anyconf_destroy (rdkafka_conf.c:1303)
==1==    by 0x403CD0: rd_kafka_conf_destroy (rdkafka_conf.c:1309)
==1==    by 0x40309A: main (in /bin/rdkafka-example)
==1==  Uninitialised value was created
==1==    at 0x509B5C: brk (in /bin/rdkafka-example)
==1==    by 0x4D5F64: sbrk (in /bin/rdkafka-example)
==1==    by 0x485AE3: __libc_setup_tls (in /bin/rdkafka-example)
==1==    by 0x480346: __pthread_initialize_minimal (nptl-init.c:285)
==1==    by 0x48577D: (below main) (in /bin/rdkafka-example)
==1== 
{
   <insert_a_suppression_name_here>
   Memcheck:Cond
   fun:_int_free
   fun:rd_free
   fun:rd_kafkap_str_destroy
   fun:rd_kafka_anyconf_clear
   fun:rd_kafka_anyconf_destroy
   fun:rd_kafka_conf_destroy
   fun:main
}
==1== Conditional jump or move depends on uninitialised value(s)
==1==    at 0x49473F: _int_free (in /bin/rdkafka-example)
==1==    by 0x403C1E: rd_free (rd.h:99)
==1==    by 0x403C1E: rd_kafkap_str_destroy (rdkafka_proto.h:206)
==1==    by 0x403C1E: rd_kafka_anyconf_clear (rdkafka_conf.c:1258)
==1==    by 0x403C1E: rd_kafka_anyconf_destroy (rdkafka_conf.c:1303)
==1==    by 0x403CD0: rd_kafka_conf_destroy (rdkafka_conf.c:1309)
==1==    by 0x40309A: main (in /bin/rdkafka-example)
==1==  Uninitialised value was created
==1==    at 0x509B5C: brk (in /bin/rdkafka-example)
==1==    by 0x4D5F64: sbrk (in /bin/rdkafka-example)
==1==    by 0x485AE3: __libc_setup_tls (in /bin/rdkafka-example)
==1==    by 0x480346: __pthread_initialize_minimal (nptl-init.c:285)
==1==    by 0x48577D: (below main) (in /bin/rdkafka-example)
==1== 
{
   <insert_a_suppression_name_here>
   Memcheck:Cond
   fun:_int_free
   fun:rd_free
   fun:rd_kafkap_str_destroy
   fun:rd_kafka_anyconf_clear
   fun:rd_kafka_anyconf_destroy
   fun:rd_kafka_conf_destroy
   fun:main
}
==1== 
==1== HEAP SUMMARY:
==1==     in use at exit: 0 bytes in 0 blocks
==1==   total heap usage: 0 allocs, 0 frees, 0 bytes allocated
==1== 
==1== All heap blocks were freed -- no leaks are possible
==1== 
==1== For counts of detected and suppressed errors, rerun with: -v
==1== ERROR SUMMARY: 9 errors from 3 contexts (suppressed: 5 from 5)
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
bin/rdkafka-example: ELF 64-bit LSB executable, x86-64, version 1 (GNU/Linux), statically linked, for GNU/Linux 2.6.32, BuildID[sha1]=186bd83b5846d9deda325c6481689fb2fbf722b1, not stripped

$ ./build.sh
```

# PUBLISH

```console
$ docker push mcandre/docker-rdkafka-example-build-bot
$ docker push mcandre/docker-rdkafka-valgrind
```
