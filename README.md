# mcandre/docker-rdkafka-valgrind: memory leak hunting of rdkafka, in Docker

# EXAMPLES

```console

$ docker run -it mcandre/docker-rdkafka-valgrind /bin/rdkafka-example
$

$ docker run -it mcandre/docker-rdkafka-valgrind valgrind /bin/rdkafka-example
==1== Memcheck, a memory error detector
==1== Copyright (C) 2002-2013, and GNU GPL'd, by Julian Seward et al.
==1== Using Valgrind-3.10.0 and LibVEX; rerun with -h for copyright info
==1== Command: /bin/rdkafka-example
==1== 
==1== Syscall param set_robust_list(head) points to uninitialised byte(s)
==1==    at 0x4803BF: __pthread_initialize_minimal (nptl-init.c:358)
==1==    by 0x48577D: (below main) (in /bin/rdkafka-example)
==1==  Address 0x4001bb0 is not stack'd, malloc'd or (recently) free'd
==1== 
==1== Conditional jump or move depends on uninitialised value(s)
==1==    at 0x4D8676: __register_atfork (in /bin/rdkafka-example)
==1==    by 0x4D8798: __libc_pthread_init (in /bin/rdkafka-example)
==1==    by 0x480596: __pthread_initialize_minimal (nptl-init.c:456)
==1==    by 0x48577D: (below main) (in /bin/rdkafka-example)
==1== 
==1== Conditional jump or move depends on uninitialised value(s)
==1==    at 0x4D8726: __linkin_atfork (in /bin/rdkafka-example)
==1==    by 0x498363: ptmalloc_init.part.7 (in /bin/rdkafka-example)
==1==    by 0x4986AD: malloc_hook_ini (in /bin/rdkafka-example)
==1==    by 0x513F02: _dl_get_origin (in /bin/rdkafka-example)
==1==    by 0x4E1B9E: _dl_non_dynamic_init (in /bin/rdkafka-example)
==1==    by 0x4E2D17: __libc_init_first (in /bin/rdkafka-example)
==1==    by 0x4857C5: (below main) (in /bin/rdkafka-example)
==1== 
==1== Conditional jump or move depends on uninitialised value(s)
==1==    at 0x4946D9: _int_free (in /bin/rdkafka-example)
==1==    by 0x50DFCC: fillin_rpath (in /bin/rdkafka-example)
==1==    by 0x50E5D2: _dl_init_paths (in /bin/rdkafka-example)
==1==    by 0x4E2074: _dl_non_dynamic_init (in /bin/rdkafka-example)
==1==    by 0x4E2D17: __libc_init_first (in /bin/rdkafka-example)
==1==    by 0x4857C5: (below main) (in /bin/rdkafka-example)
==1== 
==1== Conditional jump or move depends on uninitialised value(s)
==1==    at 0x49473F: _int_free (in /bin/rdkafka-example)
==1==    by 0x50DFCC: fillin_rpath (in /bin/rdkafka-example)
==1==    by 0x50E5D2: _dl_init_paths (in /bin/rdkafka-example)
==1==    by 0x4E2074: _dl_non_dynamic_init (in /bin/rdkafka-example)
==1==    by 0x4E2D17: __libc_init_first (in /bin/rdkafka-example)
==1==    by 0x4857C5: (below main) (in /bin/rdkafka-example)
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
==1== 
==1== Conditional jump or move depends on uninitialised value(s)
==1==    at 0x4946D9: _int_free (in /bin/rdkafka-example)
==1==    by 0x403C1E: rd_free (rd.h:99)
==1==    by 0x403C1E: rd_kafkap_str_destroy (rdkafka_proto.h:206)
==1==    by 0x403C1E: rd_kafka_anyconf_clear (rdkafka_conf.c:1258)
==1==    by 0x403C1E: rd_kafka_anyconf_destroy (rdkafka_conf.c:1303)
==1==    by 0x403CD0: rd_kafka_conf_destroy (rdkafka_conf.c:1309)
==1==    by 0x40309A: main (in /bin/rdkafka-example)
==1== 
==1== Conditional jump or move depends on uninitialised value(s)
==1==    at 0x49473F: _int_free (in /bin/rdkafka-example)
==1==    by 0x403C1E: rd_free (rd.h:99)
==1==    by 0x403C1E: rd_kafkap_str_destroy (rdkafka_proto.h:206)
==1==    by 0x403C1E: rd_kafka_anyconf_clear (rdkafka_conf.c:1258)
==1==    by 0x403C1E: rd_kafka_anyconf_destroy (rdkafka_conf.c:1303)
==1==    by 0x403CD0: rd_kafka_conf_destroy (rdkafka_conf.c:1309)
==1==    by 0x40309A: main (in /bin/rdkafka-example)
==1== 
==1== 
==1== HEAP SUMMARY:
==1==     in use at exit: 0 bytes in 0 blocks
==1==   total heap usage: 0 allocs, 0 frees, 0 bytes allocated
==1== 
==1== All heap blocks were freed -- no leaks are possible
==1== 
==1== For counts of detected and suppressed errors, rerun with: -v
==1== Use --track-origins=yes to see where uninitialised values come from
==1== ERROR SUMMARY: 14 errors from 8 contexts (suppressed: 0 from 0)
```

# REQUIREMENTS

* [Docker](https://www.docker.com)
* [gcc](https://gcc.gnu.org)

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
