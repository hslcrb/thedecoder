
./build/disasm:     file format elf64-x86-64


Disassembly of section .init:

0000000000002000 <_init>:
    2000:	f3 0f 1e fa          	endbr64
    2004:	48 83 ec 08          	sub    rsp,0x8
    2008:	48 8b 05 e1 3f 00 00 	mov    rax,QWORD PTR [rip+0x3fe1]        # 5ff0 <__gmon_start__@Base>
    200f:	48 85 c0             	test   rax,rax
    2012:	74 02                	je     2016 <_init+0x16>
    2014:	ff d0                	call   rax
    2016:	48 83 c4 08          	add    rsp,0x8
    201a:	c3                   	ret

Disassembly of section .plt:

0000000000002020 <.plt>:
    2020:	ff 35 6a 3e 00 00    	push   QWORD PTR [rip+0x3e6a]        # 5e90 <_GLOBAL_OFFSET_TABLE_+0x8>
    2026:	ff 25 6c 3e 00 00    	jmp    QWORD PTR [rip+0x3e6c]        # 5e98 <_GLOBAL_OFFSET_TABLE_+0x10>
    202c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
    2030:	f3 0f 1e fa          	endbr64
    2034:	68 00 00 00 00       	push   0x0
    2039:	e9 e2 ff ff ff       	jmp    2020 <_init+0x20>
    203e:	66 90                	xchg   ax,ax
    2040:	f3 0f 1e fa          	endbr64
    2044:	68 01 00 00 00       	push   0x1
    2049:	e9 d2 ff ff ff       	jmp    2020 <_init+0x20>
    204e:	66 90                	xchg   ax,ax
    2050:	f3 0f 1e fa          	endbr64
    2054:	68 02 00 00 00       	push   0x2
    2059:	e9 c2 ff ff ff       	jmp    2020 <_init+0x20>
    205e:	66 90                	xchg   ax,ax
    2060:	f3 0f 1e fa          	endbr64
    2064:	68 03 00 00 00       	push   0x3
    2069:	e9 b2 ff ff ff       	jmp    2020 <_init+0x20>
    206e:	66 90                	xchg   ax,ax
    2070:	f3 0f 1e fa          	endbr64
    2074:	68 04 00 00 00       	push   0x4
    2079:	e9 a2 ff ff ff       	jmp    2020 <_init+0x20>
    207e:	66 90                	xchg   ax,ax
    2080:	f3 0f 1e fa          	endbr64
    2084:	68 05 00 00 00       	push   0x5
    2089:	e9 92 ff ff ff       	jmp    2020 <_init+0x20>
    208e:	66 90                	xchg   ax,ax
    2090:	f3 0f 1e fa          	endbr64
    2094:	68 06 00 00 00       	push   0x6
    2099:	e9 82 ff ff ff       	jmp    2020 <_init+0x20>
    209e:	66 90                	xchg   ax,ax
    20a0:	f3 0f 1e fa          	endbr64
    20a4:	68 07 00 00 00       	push   0x7
    20a9:	e9 72 ff ff ff       	jmp    2020 <_init+0x20>
    20ae:	66 90                	xchg   ax,ax
    20b0:	f3 0f 1e fa          	endbr64
    20b4:	68 08 00 00 00       	push   0x8
    20b9:	e9 62 ff ff ff       	jmp    2020 <_init+0x20>
    20be:	66 90                	xchg   ax,ax
    20c0:	f3 0f 1e fa          	endbr64
    20c4:	68 09 00 00 00       	push   0x9
    20c9:	e9 52 ff ff ff       	jmp    2020 <_init+0x20>
    20ce:	66 90                	xchg   ax,ax
    20d0:	f3 0f 1e fa          	endbr64
    20d4:	68 0a 00 00 00       	push   0xa
    20d9:	e9 42 ff ff ff       	jmp    2020 <_init+0x20>
    20de:	66 90                	xchg   ax,ax
    20e0:	f3 0f 1e fa          	endbr64
    20e4:	68 0b 00 00 00       	push   0xb
    20e9:	e9 32 ff ff ff       	jmp    2020 <_init+0x20>
    20ee:	66 90                	xchg   ax,ax
    20f0:	f3 0f 1e fa          	endbr64
    20f4:	68 0c 00 00 00       	push   0xc
    20f9:	e9 22 ff ff ff       	jmp    2020 <_init+0x20>
    20fe:	66 90                	xchg   ax,ax
    2100:	f3 0f 1e fa          	endbr64
    2104:	68 0d 00 00 00       	push   0xd
    2109:	e9 12 ff ff ff       	jmp    2020 <_init+0x20>
    210e:	66 90                	xchg   ax,ax
    2110:	f3 0f 1e fa          	endbr64
    2114:	68 0e 00 00 00       	push   0xe
    2119:	e9 02 ff ff ff       	jmp    2020 <_init+0x20>
    211e:	66 90                	xchg   ax,ax
    2120:	f3 0f 1e fa          	endbr64
    2124:	68 0f 00 00 00       	push   0xf
    2129:	e9 f2 fe ff ff       	jmp    2020 <_init+0x20>
    212e:	66 90                	xchg   ax,ax
    2130:	f3 0f 1e fa          	endbr64
    2134:	68 10 00 00 00       	push   0x10
    2139:	e9 e2 fe ff ff       	jmp    2020 <_init+0x20>
    213e:	66 90                	xchg   ax,ax
    2140:	f3 0f 1e fa          	endbr64
    2144:	68 11 00 00 00       	push   0x11
    2149:	e9 d2 fe ff ff       	jmp    2020 <_init+0x20>
    214e:	66 90                	xchg   ax,ax
    2150:	f3 0f 1e fa          	endbr64
    2154:	68 12 00 00 00       	push   0x12
    2159:	e9 c2 fe ff ff       	jmp    2020 <_init+0x20>
    215e:	66 90                	xchg   ax,ax
    2160:	f3 0f 1e fa          	endbr64
    2164:	68 13 00 00 00       	push   0x13
    2169:	e9 b2 fe ff ff       	jmp    2020 <_init+0x20>
    216e:	66 90                	xchg   ax,ax
    2170:	f3 0f 1e fa          	endbr64
    2174:	68 14 00 00 00       	push   0x14
    2179:	e9 a2 fe ff ff       	jmp    2020 <_init+0x20>
    217e:	66 90                	xchg   ax,ax
    2180:	f3 0f 1e fa          	endbr64
    2184:	68 15 00 00 00       	push   0x15
    2189:	e9 92 fe ff ff       	jmp    2020 <_init+0x20>
    218e:	66 90                	xchg   ax,ax
    2190:	f3 0f 1e fa          	endbr64
    2194:	68 16 00 00 00       	push   0x16
    2199:	e9 82 fe ff ff       	jmp    2020 <_init+0x20>
    219e:	66 90                	xchg   ax,ax
    21a0:	f3 0f 1e fa          	endbr64
    21a4:	68 17 00 00 00       	push   0x17
    21a9:	e9 72 fe ff ff       	jmp    2020 <_init+0x20>
    21ae:	66 90                	xchg   ax,ax
    21b0:	f3 0f 1e fa          	endbr64
    21b4:	68 18 00 00 00       	push   0x18
    21b9:	e9 62 fe ff ff       	jmp    2020 <_init+0x20>
    21be:	66 90                	xchg   ax,ax
    21c0:	f3 0f 1e fa          	endbr64
    21c4:	68 19 00 00 00       	push   0x19
    21c9:	e9 52 fe ff ff       	jmp    2020 <_init+0x20>
    21ce:	66 90                	xchg   ax,ax
    21d0:	f3 0f 1e fa          	endbr64
    21d4:	68 1a 00 00 00       	push   0x1a
    21d9:	e9 42 fe ff ff       	jmp    2020 <_init+0x20>
    21de:	66 90                	xchg   ax,ax
    21e0:	f3 0f 1e fa          	endbr64
    21e4:	68 1b 00 00 00       	push   0x1b
    21e9:	e9 32 fe ff ff       	jmp    2020 <_init+0x20>
    21ee:	66 90                	xchg   ax,ax
    21f0:	f3 0f 1e fa          	endbr64
    21f4:	68 1c 00 00 00       	push   0x1c
    21f9:	e9 22 fe ff ff       	jmp    2020 <_init+0x20>
    21fe:	66 90                	xchg   ax,ax
    2200:	f3 0f 1e fa          	endbr64
    2204:	68 1d 00 00 00       	push   0x1d
    2209:	e9 12 fe ff ff       	jmp    2020 <_init+0x20>
    220e:	66 90                	xchg   ax,ax
    2210:	f3 0f 1e fa          	endbr64
    2214:	68 1e 00 00 00       	push   0x1e
    2219:	e9 02 fe ff ff       	jmp    2020 <_init+0x20>
    221e:	66 90                	xchg   ax,ax
    2220:	f3 0f 1e fa          	endbr64
    2224:	68 1f 00 00 00       	push   0x1f
    2229:	e9 f2 fd ff ff       	jmp    2020 <_init+0x20>
    222e:	66 90                	xchg   ax,ax
    2230:	f3 0f 1e fa          	endbr64
    2234:	68 20 00 00 00       	push   0x20
    2239:	e9 e2 fd ff ff       	jmp    2020 <_init+0x20>
    223e:	66 90                	xchg   ax,ax
    2240:	f3 0f 1e fa          	endbr64
    2244:	68 21 00 00 00       	push   0x21
    2249:	e9 d2 fd ff ff       	jmp    2020 <_init+0x20>
    224e:	66 90                	xchg   ax,ax
    2250:	f3 0f 1e fa          	endbr64
    2254:	68 22 00 00 00       	push   0x22
    2259:	e9 c2 fd ff ff       	jmp    2020 <_init+0x20>
    225e:	66 90                	xchg   ax,ax
    2260:	f3 0f 1e fa          	endbr64
    2264:	68 23 00 00 00       	push   0x23
    2269:	e9 b2 fd ff ff       	jmp    2020 <_init+0x20>
    226e:	66 90                	xchg   ax,ax
    2270:	f3 0f 1e fa          	endbr64
    2274:	68 24 00 00 00       	push   0x24
    2279:	e9 a2 fd ff ff       	jmp    2020 <_init+0x20>
    227e:	66 90                	xchg   ax,ax
    2280:	f3 0f 1e fa          	endbr64
    2284:	68 25 00 00 00       	push   0x25
    2289:	e9 92 fd ff ff       	jmp    2020 <_init+0x20>
    228e:	66 90                	xchg   ax,ax
    2290:	f3 0f 1e fa          	endbr64
    2294:	68 26 00 00 00       	push   0x26
    2299:	e9 82 fd ff ff       	jmp    2020 <_init+0x20>
    229e:	66 90                	xchg   ax,ax

Disassembly of section .plt.got:

00000000000022a0 <__cxa_finalize@plt>:
    22a0:	f3 0f 1e fa          	endbr64
    22a4:	ff 25 2e 3d 00 00    	jmp    QWORD PTR [rip+0x3d2e]        # 5fd8 <__cxa_finalize@GLIBC_2.2.5>
    22aa:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

Disassembly of section .plt.sec:

00000000000022b0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6appendEPKcm@plt>:
    22b0:	f3 0f 1e fa          	endbr64
    22b4:	ff 25 e6 3b 00 00    	jmp    QWORD PTR [rip+0x3be6]        # 5ea0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6appendEPKcm@GLIBCXX_3.4.21>
    22ba:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

00000000000022c0 <popen@plt>:
    22c0:	f3 0f 1e fa          	endbr64
    22c4:	ff 25 de 3b 00 00    	jmp    QWORD PTR [rip+0x3bde]        # 5ea8 <popen@GLIBC_2.2.5>
    22ca:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

00000000000022d0 <_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE13get_allocatorEv@plt>:
    22d0:	f3 0f 1e fa          	endbr64
    22d4:	ff 25 d6 3b 00 00    	jmp    QWORD PTR [rip+0x3bd6]        # 5eb0 <_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE13get_allocatorEv@GLIBCXX_3.4.21>
    22da:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

00000000000022e0 <_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE5c_strEv@plt>:
    22e0:	f3 0f 1e fa          	endbr64
    22e4:	ff 25 ce 3b 00 00    	jmp    QWORD PTR [rip+0x3bce]        # 5eb8 <_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE5c_strEv@GLIBCXX_3.4.21>
    22ea:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

00000000000022f0 <strlen@plt>:
    22f0:	f3 0f 1e fa          	endbr64
    22f4:	ff 25 c6 3b 00 00    	jmp    QWORD PTR [rip+0x3bc6]        # 5ec0 <strlen@GLIBC_2.2.5>
    22fa:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

0000000000002300 <memcmp@plt>:
    2300:	f3 0f 1e fa          	endbr64
    2304:	ff 25 be 3b 00 00    	jmp    QWORD PTR [rip+0x3bbe]        # 5ec8 <memcmp@GLIBC_2.2.5>
    230a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

0000000000002310 <_ZNKSt9basic_iosIcSt11char_traitsIcEEntEv@plt>:
    2310:	f3 0f 1e fa          	endbr64
    2314:	ff 25 b6 3b 00 00    	jmp    QWORD PTR [rip+0x3bb6]        # 5ed0 <_ZNKSt9basic_iosIcSt11char_traitsIcEEntEv@GLIBCXX_3.4>
    231a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

0000000000002320 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1EOS4_@plt>:
    2320:	f3 0f 1e fa          	endbr64
    2324:	ff 25 ae 3b 00 00    	jmp    QWORD PTR [rip+0x3bae]        # 5ed8 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1EOS4_@GLIBCXX_3.4.21>
    232a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

0000000000002330 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@plt>:
    2330:	f3 0f 1e fa          	endbr64
    2334:	ff 25 a6 3b 00 00    	jmp    QWORD PTR [rip+0x3ba6]        # 5ee0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@GLIBCXX_3.4.21>
    233a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

0000000000002340 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE13_M_set_lengthEm@plt>:
    2340:	f3 0f 1e fa          	endbr64
    2344:	ff 25 9e 3b 00 00    	jmp    QWORD PTR [rip+0x3b9e]        # 5ee8 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE13_M_set_lengthEm@GLIBCXX_3.4.21>
    234a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

0000000000002350 <_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE4sizeEv@plt>:
    2350:	f3 0f 1e fa          	endbr64
    2354:	ff 25 96 3b 00 00    	jmp    QWORD PTR [rip+0x3b96]        # 5ef0 <_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE4sizeEv@GLIBCXX_3.4.21>
    235a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

0000000000002360 <_ZSt19__throw_logic_errorPKc@plt>:
    2360:	f3 0f 1e fa          	endbr64
    2364:	ff 25 8e 3b 00 00    	jmp    QWORD PTR [rip+0x3b8e]        # 5ef8 <_ZSt19__throw_logic_errorPKc@GLIBCXX_3.4>
    236a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

0000000000002370 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE13_M_local_dataEv@plt>:
    2370:	f3 0f 1e fa          	endbr64
    2374:	ff 25 86 3b 00 00    	jmp    QWORD PTR [rip+0x3b86]        # 5f00 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE13_M_local_dataEv@GLIBCXX_3.4.21>
    237a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

0000000000002380 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7_M_dataEPc@plt>:
    2380:	f3 0f 1e fa          	endbr64
    2384:	ff 25 7e 3b 00 00    	jmp    QWORD PTR [rip+0x3b7e]        # 5f08 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7_M_dataEPc@GLIBCXX_3.4.21>
    238a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

0000000000002390 <_ZStlsIcSt11char_traitsIcESaIcEERSt13basic_ostreamIT_T0_ES7_RKNSt7__cxx1112basic_stringIS4_S5_T1_EE@plt>:
    2390:	f3 0f 1e fa          	endbr64
    2394:	ff 25 76 3b 00 00    	jmp    QWORD PTR [rip+0x3b76]        # 5f10 <_ZStlsIcSt11char_traitsIcESaIcEERSt13basic_ostreamIT_T0_ES7_RKNSt7__cxx1112basic_stringIS4_S5_T1_EE@GLIBCXX_3.4.21>
    239a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

00000000000023a0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEpLEPKc@plt>:
    23a0:	f3 0f 1e fa          	endbr64
    23a4:	ff 25 6e 3b 00 00    	jmp    QWORD PTR [rip+0x3b6e]        # 5f18 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEpLEPKc@GLIBCXX_3.4.21>
    23aa:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

00000000000023b0 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>:
    23b0:	f3 0f 1e fa          	endbr64
    23b4:	ff 25 66 3b 00 00    	jmp    QWORD PTR [rip+0x3b66]        # 5f20 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@GLIBCXX_3.4>
    23ba:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

00000000000023c0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderC1EPcRKS3_@plt>:
    23c0:	f3 0f 1e fa          	endbr64
    23c4:	ff 25 5e 3b 00 00    	jmp    QWORD PTR [rip+0x3b5e]        # 5f28 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderC1EPcRKS3_@GLIBCXX_3.4.21>
    23ca:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

00000000000023d0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6appendEmc@plt>:
    23d0:	f3 0f 1e fa          	endbr64
    23d4:	ff 25 56 3b 00 00    	jmp    QWORD PTR [rip+0x3b56]        # 5f30 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6appendEmc@GLIBCXX_3.4.21>
    23da:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

00000000000023e0 <_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7_M_dataEv@plt>:
    23e0:	f3 0f 1e fa          	endbr64
    23e4:	ff 25 4e 3b 00 00    	jmp    QWORD PTR [rip+0x3b4e]        # 5f38 <_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7_M_dataEv@GLIBCXX_3.4.21>
    23ea:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

00000000000023f0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE13_S_copy_charsEPcPKcS7_@plt>:
    23f0:	f3 0f 1e fa          	endbr64
    23f4:	ff 25 46 3b 00 00    	jmp    QWORD PTR [rip+0x3b46]        # 5f40 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE13_S_copy_charsEPcPKcS7_@GLIBCXX_3.4.21>
    23fa:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

0000000000002400 <__stack_chk_fail@plt>:
    2400:	f3 0f 1e fa          	endbr64
    2404:	ff 25 3e 3b 00 00    	jmp    QWORD PTR [rip+0x3b3e]        # 5f48 <__stack_chk_fail@GLIBC_2.4>
    240a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

0000000000002410 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEaSEOS4_@plt>:
    2410:	f3 0f 1e fa          	endbr64
    2414:	ff 25 36 3b 00 00    	jmp    QWORD PTR [rip+0x3b36]        # 5f50 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEaSEOS4_@GLIBCXX_3.4.21>
    241a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

0000000000002420 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>:
    2420:	f3 0f 1e fa          	endbr64
    2424:	ff 25 2e 3b 00 00    	jmp    QWORD PTR [rip+0x3b2e]        # 5f58 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@GLIBCXX_3.4.21>
    242a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

0000000000002430 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEpLERKS4_@plt>:
    2430:	f3 0f 1e fa          	endbr64
    2434:	ff 25 26 3b 00 00    	jmp    QWORD PTR [rip+0x3b26]        # 5f60 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEpLERKS4_@GLIBCXX_3.4.21>
    243a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

0000000000002440 <_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE4dataEv@plt>:
    2440:	f3 0f 1e fa          	endbr64
    2444:	ff 25 1e 3b 00 00    	jmp    QWORD PTR [rip+0x3b1e]        # 5f68 <_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE4dataEv@GLIBCXX_3.4.21>
    244a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

0000000000002450 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEaSEPKc@plt>:
    2450:	f3 0f 1e fa          	endbr64
    2454:	ff 25 16 3b 00 00    	jmp    QWORD PTR [rip+0x3b16]        # 5f70 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEaSEPKc@GLIBCXX_3.4.21>
    245a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

0000000000002460 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1Ev@plt>:
    2460:	f3 0f 1e fa          	endbr64
    2464:	ff 25 0e 3b 00 00    	jmp    QWORD PTR [rip+0x3b0e]        # 5f78 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1Ev@GLIBCXX_3.4.21>
    246a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

0000000000002470 <pclose@plt>:
    2470:	f3 0f 1e fa          	endbr64
    2474:	ff 25 06 3b 00 00    	jmp    QWORD PTR [rip+0x3b06]        # 5f80 <pclose@GLIBC_2.2.5>
    247a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

0000000000002480 <_ZNSt14basic_ofstreamIcSt11char_traitsIcEED1Ev@plt>:
    2480:	f3 0f 1e fa          	endbr64
    2484:	ff 25 fe 3a 00 00    	jmp    QWORD PTR [rip+0x3afe]        # 5f88 <_ZNSt14basic_ofstreamIcSt11char_traitsIcEED1Ev@GLIBCXX_3.4>
    248a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

0000000000002490 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7reserveEm@plt>:
    2490:	f3 0f 1e fa          	endbr64
    2494:	ff 25 f6 3a 00 00    	jmp    QWORD PTR [rip+0x3af6]        # 5f90 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7reserveEm@GLIBCXX_3.4.21>
    249a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

00000000000024a0 <fgets@plt>:
    24a0:	f3 0f 1e fa          	endbr64
    24a4:	ff 25 ee 3a 00 00    	jmp    QWORD PTR [rip+0x3aee]        # 5f98 <fgets@GLIBC_2.2.5>
    24aa:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

00000000000024b0 <_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE5emptyEv@plt>:
    24b0:	f3 0f 1e fa          	endbr64
    24b4:	ff 25 e6 3a 00 00    	jmp    QWORD PTR [rip+0x3ae6]        # 5fa0 <_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE5emptyEv@GLIBCXX_3.4.21>
    24ba:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

00000000000024c0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1ERKS3_@plt>:
    24c0:	f3 0f 1e fa          	endbr64
    24c4:	ff 25 de 3a 00 00    	jmp    QWORD PTR [rip+0x3ade]        # 5fa8 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1ERKS3_@GLIBCXX_3.4.21>
    24ca:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

00000000000024d0 <_ZNSolsEi@plt>:
    24d0:	f3 0f 1e fa          	endbr64
    24d4:	ff 25 d6 3a 00 00    	jmp    QWORD PTR [rip+0x3ad6]        # 5fb0 <_ZNSolsEi@GLIBCXX_3.4>
    24da:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

00000000000024e0 <_Unwind_Resume@plt>:
    24e0:	f3 0f 1e fa          	endbr64
    24e4:	ff 25 ce 3a 00 00    	jmp    QWORD PTR [rip+0x3ace]        # 5fb8 <_Unwind_Resume@GCC_3.0>
    24ea:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

00000000000024f0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm@plt>:
    24f0:	f3 0f 1e fa          	endbr64
    24f4:	ff 25 c6 3a 00 00    	jmp    QWORD PTR [rip+0x3ac6]        # 5fc0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm@GLIBCXX_3.4.21>
    24fa:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

0000000000002500 <_ZNSt14basic_ofstreamIcSt11char_traitsIcEEC1ERKNSt7__cxx1112basic_stringIcS1_SaIcEEESt13_Ios_Openmode@plt>:
    2500:	f3 0f 1e fa          	endbr64
    2504:	ff 25 be 3a 00 00    	jmp    QWORD PTR [rip+0x3abe]        # 5fc8 <_ZNSt14basic_ofstreamIcSt11char_traitsIcEEC1ERKNSt7__cxx1112basic_stringIcS1_SaIcEEESt13_Ios_Openmode@GLIBCXX_3.4.21>
    250a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

0000000000002510 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE11_M_capacityEm@plt>:
    2510:	f3 0f 1e fa          	endbr64
    2514:	ff 25 b6 3a 00 00    	jmp    QWORD PTR [rip+0x3ab6]        # 5fd0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE11_M_capacityEm@GLIBCXX_3.4.21>
    251a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

Disassembly of section .text:

0000000000002520 <_start>:
    2520:	f3 0f 1e fa          	endbr64
    2524:	31 ed                	xor    ebp,ebp
    2526:	49 89 d1             	mov    r9,rdx
    2529:	5e                   	pop    rsi
    252a:	48 89 e2             	mov    rdx,rsp
    252d:	48 83 e4 f0          	and    rsp,0xfffffffffffffff0
    2531:	50                   	push   rax
    2532:	54                   	push   rsp
    2533:	45 31 c0             	xor    r8d,r8d
    2536:	31 c9                	xor    ecx,ecx
    2538:	48 8d 3d ca 00 00 00 	lea    rdi,[rip+0xca]        # 2609 <main>
    253f:	ff 15 9b 3a 00 00    	call   QWORD PTR [rip+0x3a9b]        # 5fe0 <__libc_start_main@GLIBC_2.34>
    2545:	f4                   	hlt
    2546:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    254d:	00 00 00 

0000000000002550 <deregister_tm_clones>:
    2550:	48 8d 3d c1 3a 00 00 	lea    rdi,[rip+0x3ac1]        # 6018 <__TMC_END__>
    2557:	48 8d 05 ba 3a 00 00 	lea    rax,[rip+0x3aba]        # 6018 <__TMC_END__>
    255e:	48 39 f8             	cmp    rax,rdi
    2561:	74 15                	je     2578 <deregister_tm_clones+0x28>
    2563:	48 8b 05 7e 3a 00 00 	mov    rax,QWORD PTR [rip+0x3a7e]        # 5fe8 <_ITM_deregisterTMCloneTable@Base>
    256a:	48 85 c0             	test   rax,rax
    256d:	74 09                	je     2578 <deregister_tm_clones+0x28>
    256f:	ff e0                	jmp    rax
    2571:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    2578:	c3                   	ret
    2579:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

0000000000002580 <register_tm_clones>:
    2580:	48 8d 3d 91 3a 00 00 	lea    rdi,[rip+0x3a91]        # 6018 <__TMC_END__>
    2587:	48 8d 35 8a 3a 00 00 	lea    rsi,[rip+0x3a8a]        # 6018 <__TMC_END__>
    258e:	48 29 fe             	sub    rsi,rdi
    2591:	48 89 f0             	mov    rax,rsi
    2594:	48 c1 ee 3f          	shr    rsi,0x3f
    2598:	48 c1 f8 03          	sar    rax,0x3
    259c:	48 01 c6             	add    rsi,rax
    259f:	48 d1 fe             	sar    rsi,1
    25a2:	74 14                	je     25b8 <register_tm_clones+0x38>
    25a4:	48 8b 05 4d 3a 00 00 	mov    rax,QWORD PTR [rip+0x3a4d]        # 5ff8 <_ITM_registerTMCloneTable@Base>
    25ab:	48 85 c0             	test   rax,rax
    25ae:	74 08                	je     25b8 <register_tm_clones+0x38>
    25b0:	ff e0                	jmp    rax
    25b2:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    25b8:	c3                   	ret
    25b9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

00000000000025c0 <__do_global_dtors_aux>:
    25c0:	f3 0f 1e fa          	endbr64
    25c4:	80 3d a5 3c 00 00 00 	cmp    BYTE PTR [rip+0x3ca5],0x0        # 6270 <completed.0>
    25cb:	75 2b                	jne    25f8 <__do_global_dtors_aux+0x38>
    25cd:	55                   	push   rbp
    25ce:	48 83 3d 02 3a 00 00 	cmp    QWORD PTR [rip+0x3a02],0x0        # 5fd8 <__cxa_finalize@GLIBC_2.2.5>
    25d5:	00 
    25d6:	48 89 e5             	mov    rbp,rsp
    25d9:	74 0c                	je     25e7 <__do_global_dtors_aux+0x27>
    25db:	48 8b 3d 26 3a 00 00 	mov    rdi,QWORD PTR [rip+0x3a26]        # 6008 <__dso_handle>
    25e2:	e8 b9 fc ff ff       	call   22a0 <__cxa_finalize@plt>
    25e7:	e8 64 ff ff ff       	call   2550 <deregister_tm_clones>
    25ec:	c6 05 7d 3c 00 00 01 	mov    BYTE PTR [rip+0x3c7d],0x1        # 6270 <completed.0>
    25f3:	5d                   	pop    rbp
    25f4:	c3                   	ret
    25f5:	0f 1f 00             	nop    DWORD PTR [rax]
    25f8:	c3                   	ret
    25f9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

0000000000002600 <frame_dummy>:
    2600:	f3 0f 1e fa          	endbr64
    2604:	e9 77 ff ff ff       	jmp    2580 <register_tm_clones>

0000000000002609 <main>:
    2609:	f3 0f 1e fa          	endbr64
    260d:	55                   	push   rbp
    260e:	48 89 e5             	mov    rbp,rsp
    2611:	41 54                	push   r12
    2613:	53                   	push   rbx
    2614:	48 81 ec 00 10 00 00 	sub    rsp,0x1000
    261b:	48 83 0c 24 00       	or     QWORD PTR [rsp],0x0
    2620:	48 81 ec d0 02 00 00 	sub    rsp,0x2d0
    2627:	89 bd 2c ed ff ff    	mov    DWORD PTR [rbp-0x12d4],edi
    262d:	48 89 b5 20 ed ff ff 	mov    QWORD PTR [rbp-0x12e0],rsi
    2634:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
    263b:	00 00 
    263d:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    2641:	31 c0                	xor    eax,eax
    2643:	83 bd 2c ed ff ff 01 	cmp    DWORD PTR [rbp-0x12d4],0x1
    264a:	7f 23                	jg     266f <main+0x66>
    264c:	48 8d 05 b5 19 00 00 	lea    rax,[rip+0x19b5]        # 4008 <_IO_stdin_used+0x8>
    2653:	48 89 c6             	mov    rsi,rax
    2656:	48 8d 05 03 3b 00 00 	lea    rax,[rip+0x3b03]        # 6160 <_ZSt4cerr@GLIBCXX_3.4>
    265d:	48 89 c7             	mov    rdi,rax
    2660:	e8 4b fd ff ff       	call   23b0 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
    2665:	bb 01 00 00 00       	mov    ebx,0x1
    266a:	e9 d1 05 00 00       	jmp    2c40 <main+0x637>
    266f:	48 8d 85 60 ed ff ff 	lea    rax,[rbp-0x12a0]
    2676:	48 89 c7             	mov    rdi,rax
    2679:	e8 e2 fd ff ff       	call   2460 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1Ev@plt>
    267e:	48 8d 85 80 ed ff ff 	lea    rax,[rbp-0x1280]
    2685:	48 89 c7             	mov    rdi,rax
    2688:	e8 d3 fd ff ff       	call   2460 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1Ev@plt>
    268d:	c6 85 3f ed ff ff 00 	mov    BYTE PTR [rbp-0x12c1],0x0
    2694:	48 8b 85 20 ed ff ff 	mov    rax,QWORD PTR [rbp-0x12e0]
    269b:	48 83 c0 08          	add    rax,0x8
    269f:	48 8b 10             	mov    rdx,QWORD PTR [rax]
    26a2:	48 8d 85 60 ed ff ff 	lea    rax,[rbp-0x12a0]
    26a9:	48 89 d6             	mov    rsi,rdx
    26ac:	48 89 c7             	mov    rdi,rax
    26af:	e8 9c fd ff ff       	call   2450 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEaSEPKc@plt>
    26b4:	c7 85 40 ed ff ff 02 	mov    DWORD PTR [rbp-0x12c0],0x2
    26bb:	00 00 00 
    26be:	e9 26 02 00 00       	jmp    28e9 <main+0x2e0>
    26c3:	48 8d 85 3e ed ff ff 	lea    rax,[rbp-0x12c2]
    26ca:	48 89 85 50 ed ff ff 	mov    QWORD PTR [rbp-0x12b0],rax
    26d1:	90                   	nop
    26d2:	90                   	nop
    26d3:	8b 85 40 ed ff ff    	mov    eax,DWORD PTR [rbp-0x12c0]
    26d9:	48 98                	cdqe
    26db:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
    26e2:	00 
    26e3:	48 8b 85 20 ed ff ff 	mov    rax,QWORD PTR [rbp-0x12e0]
    26ea:	48 01 d0             	add    rax,rdx
    26ed:	48 8b 08             	mov    rcx,QWORD PTR [rax]
    26f0:	48 8d 95 3e ed ff ff 	lea    rdx,[rbp-0x12c2]
    26f7:	48 8d 85 e0 ed ff ff 	lea    rax,[rbp-0x1220]
    26fe:	48 89 ce             	mov    rsi,rcx
    2701:	48 89 c7             	mov    rdi,rax
    2704:	e8 33 08 00 00       	call   2f3c <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1IS3_EEPKcRKS3_>
    2709:	48 8d 85 3e ed ff ff 	lea    rax,[rbp-0x12c2]
    2710:	48 89 c7             	mov    rdi,rax
    2713:	e8 98 0b 00 00       	call   32b0 <_ZNSt15__new_allocatorIcED1Ev>
    2718:	90                   	nop
    2719:	48 8d 85 e0 ed ff ff 	lea    rax,[rbp-0x1220]
    2720:	48 8d 15 13 19 00 00 	lea    rdx,[rip+0x1913]        # 403a <_IO_stdin_used+0x3a>
    2727:	48 89 d6             	mov    rsi,rdx
    272a:	48 89 c7             	mov    rdi,rax
    272d:	e8 c4 08 00 00       	call   2ff6 <_ZSteqIcSt11char_traitsIcESaIcEEbRKNSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_>
    2732:	84 c0                	test   al,al
    2734:	74 18                	je     274e <main+0x145>
    2736:	8b 85 40 ed ff ff    	mov    eax,DWORD PTR [rbp-0x12c0]
    273c:	83 c0 01             	add    eax,0x1
    273f:	39 85 2c ed ff ff    	cmp    DWORD PTR [rbp-0x12d4],eax
    2745:	7e 07                	jle    274e <main+0x145>
    2747:	b8 01 00 00 00       	mov    eax,0x1
    274c:	eb 05                	jmp    2753 <main+0x14a>
    274e:	b8 00 00 00 00       	mov    eax,0x0
    2753:	84 c0                	test   al,al
    2755:	74 38                	je     278f <main+0x186>
    2757:	48 8b 85 20 ed ff ff 	mov    rax,QWORD PTR [rbp-0x12e0]
    275e:	83 85 40 ed ff ff 01 	add    DWORD PTR [rbp-0x12c0],0x1
    2765:	8b 95 40 ed ff ff    	mov    edx,DWORD PTR [rbp-0x12c0]
    276b:	48 63 d2             	movsxd rdx,edx
    276e:	48 c1 e2 03          	shl    rdx,0x3
    2772:	48 01 d0             	add    rax,rdx
    2775:	48 8b 10             	mov    rdx,QWORD PTR [rax]
    2778:	48 8d 85 80 ed ff ff 	lea    rax,[rbp-0x1280]
    277f:	48 89 d6             	mov    rsi,rdx
    2782:	48 89 c7             	mov    rdi,rax
    2785:	e8 c6 fc ff ff       	call   2450 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEaSEPKc@plt>
    278a:	e9 34 01 00 00       	jmp    28c3 <main+0x2ba>
    278f:	48 8d 85 e0 ed ff ff 	lea    rax,[rbp-0x1220]
    2796:	48 8d 15 a0 18 00 00 	lea    rdx,[rip+0x18a0]        # 403d <_IO_stdin_used+0x3d>
    279d:	48 89 d6             	mov    rsi,rdx
    27a0:	48 89 c7             	mov    rdi,rax
    27a3:	e8 4e 08 00 00       	call   2ff6 <_ZSteqIcSt11char_traitsIcESaIcEEbRKNSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_>
    27a8:	84 c0                	test   al,al
    27aa:	74 0c                	je     27b8 <main+0x1af>
    27ac:	c6 85 3f ed ff ff 01 	mov    BYTE PTR [rbp-0x12c1],0x1
    27b3:	e9 0b 01 00 00       	jmp    28c3 <main+0x2ba>
    27b8:	48 8d 85 e0 ed ff ff 	lea    rax,[rbp-0x1220]
    27bf:	48 8d 15 7f 18 00 00 	lea    rdx,[rip+0x187f]        # 4045 <_IO_stdin_used+0x45>
    27c6:	48 89 d6             	mov    rsi,rdx
    27c9:	48 89 c7             	mov    rdi,rax
    27cc:	e8 25 08 00 00       	call   2ff6 <_ZSteqIcSt11char_traitsIcESaIcEEbRKNSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_>
    27d1:	84 c0                	test   al,al
    27d3:	75 1d                	jne    27f2 <main+0x1e9>
    27d5:	48 8d 85 e0 ed ff ff 	lea    rax,[rbp-0x1220]
    27dc:	48 8d 15 65 18 00 00 	lea    rdx,[rip+0x1865]        # 4048 <_IO_stdin_used+0x48>
    27e3:	48 89 d6             	mov    rsi,rdx
    27e6:	48 89 c7             	mov    rdi,rax
    27e9:	e8 08 08 00 00       	call   2ff6 <_ZSteqIcSt11char_traitsIcESaIcEEbRKNSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_>
    27ee:	84 c0                	test   al,al
    27f0:	74 07                	je     27f9 <main+0x1f0>
    27f2:	b8 01 00 00 00       	mov    eax,0x1
    27f7:	eb 05                	jmp    27fe <main+0x1f5>
    27f9:	b8 00 00 00 00       	mov    eax,0x0
    27fe:	84 c0                	test   al,al
    2800:	74 71                	je     2873 <main+0x26a>
    2802:	48 8d 05 ff 17 00 00 	lea    rax,[rip+0x17ff]        # 4008 <_IO_stdin_used+0x8>
    2809:	48 89 c6             	mov    rsi,rax
    280c:	48 8d 05 2d 38 00 00 	lea    rax,[rip+0x382d]        # 6040 <_ZSt4cout@GLIBCXX_3.4>
    2813:	48 89 c7             	mov    rdi,rax
    2816:	e8 95 fb ff ff       	call   23b0 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
    281b:	48 8d 05 2d 18 00 00 	lea    rax,[rip+0x182d]        # 404f <_IO_stdin_used+0x4f>
    2822:	48 89 c6             	mov    rsi,rax
    2825:	48 8d 05 14 38 00 00 	lea    rax,[rip+0x3814]        # 6040 <_ZSt4cout@GLIBCXX_3.4>
    282c:	48 89 c7             	mov    rdi,rax
    282f:	e8 7c fb ff ff       	call   23b0 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
    2834:	48 8d 05 25 18 00 00 	lea    rax,[rip+0x1825]        # 4060 <_IO_stdin_used+0x60>
    283b:	48 89 c6             	mov    rsi,rax
    283e:	48 8d 05 fb 37 00 00 	lea    rax,[rip+0x37fb]        # 6040 <_ZSt4cout@GLIBCXX_3.4>
    2845:	48 89 c7             	mov    rdi,rax
    2848:	e8 63 fb ff ff       	call   23b0 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
    284d:	48 8d 05 44 18 00 00 	lea    rax,[rip+0x1844]        # 4098 <_IO_stdin_used+0x98>
    2854:	48 89 c6             	mov    rsi,rax
    2857:	48 8d 05 e2 37 00 00 	lea    rax,[rip+0x37e2]        # 6040 <_ZSt4cout@GLIBCXX_3.4>
    285e:	48 89 c7             	mov    rdi,rax
    2861:	e8 4a fb ff ff       	call   23b0 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
    2866:	bb 00 00 00 00       	mov    ebx,0x0
    286b:	41 bc 00 00 00 00    	mov    r12d,0x0
    2871:	eb 56                	jmp    28c9 <main+0x2c0>
    2873:	48 8d 05 4d 18 00 00 	lea    rax,[rip+0x184d]        # 40c7 <_IO_stdin_used+0xc7>
    287a:	48 89 c6             	mov    rsi,rax
    287d:	48 8d 05 dc 38 00 00 	lea    rax,[rip+0x38dc]        # 6160 <_ZSt4cerr@GLIBCXX_3.4>
    2884:	48 89 c7             	mov    rdi,rax
    2887:	e8 24 fb ff ff       	call   23b0 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
    288c:	48 89 c2             	mov    rdx,rax
    288f:	48 8d 85 e0 ed ff ff 	lea    rax,[rbp-0x1220]
    2896:	48 89 c6             	mov    rsi,rax
    2899:	48 89 d7             	mov    rdi,rdx
    289c:	e8 ef fa ff ff       	call   2390 <_ZStlsIcSt11char_traitsIcESaIcEERSt13basic_ostreamIT_T0_ES7_RKNSt7__cxx1112basic_stringIS4_S5_T1_EE@plt>
    28a1:	48 89 c2             	mov    rdx,rax
    28a4:	48 8d 05 2d 18 00 00 	lea    rax,[rip+0x182d]        # 40d8 <_IO_stdin_used+0xd8>
    28ab:	48 89 c6             	mov    rsi,rax
    28ae:	48 89 d7             	mov    rdi,rdx
    28b1:	e8 fa fa ff ff       	call   23b0 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
    28b6:	bb 01 00 00 00       	mov    ebx,0x1
    28bb:	41 bc 00 00 00 00    	mov    r12d,0x0
    28c1:	eb 06                	jmp    28c9 <main+0x2c0>
    28c3:	41 bc 01 00 00 00    	mov    r12d,0x1
    28c9:	48 8d 85 e0 ed ff ff 	lea    rax,[rbp-0x1220]
    28d0:	48 89 c7             	mov    rdi,rax
    28d3:	e8 58 fa ff ff       	call   2330 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@plt>
    28d8:	41 83 fc 01          	cmp    r12d,0x1
    28dc:	0f 85 40 03 00 00    	jne    2c22 <main+0x619>
    28e2:	83 85 40 ed ff ff 01 	add    DWORD PTR [rbp-0x12c0],0x1
    28e9:	8b 85 40 ed ff ff    	mov    eax,DWORD PTR [rbp-0x12c0]
    28ef:	3b 85 2c ed ff ff    	cmp    eax,DWORD PTR [rbp-0x12d4]
    28f5:	0f 8c c8 fd ff ff    	jl     26c3 <main+0xba>
    28fb:	48 8d 85 80 ed ff ff 	lea    rax,[rbp-0x1280]
    2902:	48 89 c7             	mov    rdi,rax
    2905:	e8 a6 fb ff ff       	call   24b0 <_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE5emptyEv@plt>
    290a:	84 c0                	test   al,al
    290c:	74 48                	je     2956 <main+0x34d>
    290e:	48 8d 85 e0 ed ff ff 	lea    rax,[rbp-0x1220]
    2915:	48 8d 8d 60 ed ff ff 	lea    rcx,[rbp-0x12a0]
    291c:	48 8d 15 b7 17 00 00 	lea    rdx,[rip+0x17b7]        # 40da <_IO_stdin_used+0xda>
    2923:	48 89 ce             	mov    rsi,rcx
    2926:	48 89 c7             	mov    rdi,rax
    2929:	e8 43 07 00 00       	call   3071 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EERKS8_PKS5_>
    292e:	48 8d 95 e0 ed ff ff 	lea    rdx,[rbp-0x1220]
    2935:	48 8d 85 80 ed ff ff 	lea    rax,[rbp-0x1280]
    293c:	48 89 d6             	mov    rsi,rdx
    293f:	48 89 c7             	mov    rdi,rax
    2942:	e8 c9 fa ff ff       	call   2410 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEaSEOS4_@plt>
    2947:	48 8d 85 e0 ed ff ff 	lea    rax,[rbp-0x1220]
    294e:	48 89 c7             	mov    rdi,rax
    2951:	e8 da f9 ff ff       	call   2330 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@plt>
    2956:	48 8d 85 3e ed ff ff 	lea    rax,[rbp-0x12c2]
    295d:	48 89 85 58 ed ff ff 	mov    QWORD PTR [rbp-0x12a8],rax
    2964:	90                   	nop
    2965:	90                   	nop
    2966:	48 8d 95 3e ed ff ff 	lea    rdx,[rbp-0x12c2]
    296d:	48 8d 85 a0 ed ff ff 	lea    rax,[rbp-0x1260]
    2974:	48 8d 0d 64 17 00 00 	lea    rcx,[rip+0x1764]        # 40df <_IO_stdin_used+0xdf>
    297b:	48 89 ce             	mov    rsi,rcx
    297e:	48 89 c7             	mov    rdi,rax
    2981:	e8 b6 05 00 00       	call   2f3c <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1IS3_EEPKcRKS3_>
    2986:	48 8d 85 3e ed ff ff 	lea    rax,[rbp-0x12c2]
    298d:	48 89 c7             	mov    rdi,rax
    2990:	e8 1b 09 00 00       	call   32b0 <_ZNSt15__new_allocatorIcED1Ev>
    2995:	90                   	nop
    2996:	80 bd 3f ed ff ff 00 	cmp    BYTE PTR [rbp-0x12c1],0x0
    299d:	74 19                	je     29b8 <main+0x3af>
    299f:	48 8d 85 a0 ed ff ff 	lea    rax,[rbp-0x1260]
    29a6:	48 8d 15 3e 17 00 00 	lea    rdx,[rip+0x173e]        # 40eb <_IO_stdin_used+0xeb>
    29ad:	48 89 d6             	mov    rsi,rdx
    29b0:	48 89 c7             	mov    rdi,rax
    29b3:	e8 e8 f9 ff ff       	call   23a0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEpLEPKc@plt>
    29b8:	48 8d 85 c0 ed ff ff 	lea    rax,[rbp-0x1240]
    29bf:	48 8d 95 60 ed ff ff 	lea    rdx,[rbp-0x12a0]
    29c6:	be 22 00 00 00       	mov    esi,0x22
    29cb:	48 89 c7             	mov    rdi,rax
    29ce:	e8 8c 07 00 00       	call   315f <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EES5_RKS8_>
    29d3:	48 8d 85 e0 ed ff ff 	lea    rax,[rbp-0x1220]
    29da:	48 8d 8d c0 ed ff ff 	lea    rcx,[rbp-0x1240]
    29e1:	ba 22 00 00 00       	mov    edx,0x22
    29e6:	48 89 ce             	mov    rsi,rcx
    29e9:	48 89 c7             	mov    rdi,rax
    29ec:	e8 4b 08 00 00       	call   323c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_S5_>
    29f1:	48 8d 95 e0 ed ff ff 	lea    rdx,[rbp-0x1220]
    29f8:	48 8d 85 a0 ed ff ff 	lea    rax,[rbp-0x1260]
    29ff:	48 89 d6             	mov    rsi,rdx
    2a02:	48 89 c7             	mov    rdi,rax
    2a05:	e8 26 fa ff ff       	call   2430 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEpLERKS4_@plt>
    2a0a:	48 8d 85 e0 ed ff ff 	lea    rax,[rbp-0x1220]
    2a11:	48 89 c7             	mov    rdi,rax
    2a14:	e8 17 f9 ff ff       	call   2330 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@plt>
    2a19:	48 8d 85 c0 ed ff ff 	lea    rax,[rbp-0x1240]
    2a20:	48 89 c7             	mov    rdi,rax
    2a23:	e8 08 f9 ff ff       	call   2330 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@plt>
    2a28:	48 8d 85 a0 ed ff ff 	lea    rax,[rbp-0x1260]
    2a2f:	48 89 c7             	mov    rdi,rax
    2a32:	e8 a9 f8 ff ff       	call   22e0 <_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE5c_strEv@plt>
    2a37:	48 89 c2             	mov    rdx,rax
    2a3a:	48 8d 05 b3 16 00 00 	lea    rax,[rip+0x16b3]        # 40f4 <_IO_stdin_used+0xf4>
    2a41:	48 89 c6             	mov    rsi,rax
    2a44:	48 89 d7             	mov    rdi,rdx
    2a47:	e8 74 f8 ff ff       	call   22c0 <popen@plt>
    2a4c:	48 89 85 48 ed ff ff 	mov    QWORD PTR [rbp-0x12b8],rax
    2a53:	48 83 bd 48 ed ff ff 	cmp    QWORD PTR [rbp-0x12b8],0x0
    2a5a:	00 
    2a5b:	75 23                	jne    2a80 <main+0x477>
    2a5d:	48 8d 05 94 16 00 00 	lea    rax,[rip+0x1694]        # 40f8 <_IO_stdin_used+0xf8>
    2a64:	48 89 c6             	mov    rsi,rax
    2a67:	48 8d 05 f2 36 00 00 	lea    rax,[rip+0x36f2]        # 6160 <_ZSt4cerr@GLIBCXX_3.4>
    2a6e:	48 89 c7             	mov    rdi,rax
    2a71:	e8 3a f9 ff ff       	call   23b0 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
    2a76:	bb 02 00 00 00       	mov    ebx,0x2
    2a7b:	e9 93 01 00 00       	jmp    2c13 <main+0x60a>
    2a80:	be 04 00 00 00       	mov    esi,0x4
    2a85:	bf 10 00 00 00       	mov    edi,0x10
    2a8a:	e8 00 04 00 00       	call   2e8f <_ZStorSt13_Ios_OpenmodeS_>
    2a8f:	89 c2                	mov    edx,eax
    2a91:	48 8d 8d 80 ed ff ff 	lea    rcx,[rbp-0x1280]
    2a98:	48 8d 85 e0 ed ff ff 	lea    rax,[rbp-0x1220]
    2a9f:	48 89 ce             	mov    rsi,rcx
    2aa2:	48 89 c7             	mov    rdi,rax
    2aa5:	e8 56 fa ff ff       	call   2500 <_ZNSt14basic_ofstreamIcSt11char_traitsIcEEC1ERKNSt7__cxx1112basic_stringIcS1_SaIcEEESt13_Ios_Openmode@plt>
    2aaa:	48 8d 85 e0 ed ff ff 	lea    rax,[rbp-0x1220]
    2ab1:	48 05 f8 00 00 00    	add    rax,0xf8
    2ab7:	48 89 c7             	mov    rdi,rax
    2aba:	e8 51 f8 ff ff       	call   2310 <_ZNKSt9basic_iosIcSt11char_traitsIcEEntEv@plt>
    2abf:	84 c0                	test   al,al
    2ac1:	74 75                	je     2b38 <main+0x52f>
    2ac3:	48 8d 05 71 16 00 00 	lea    rax,[rip+0x1671]        # 413b <_IO_stdin_used+0x13b>
    2aca:	48 89 c6             	mov    rsi,rax
    2acd:	48 8d 05 8c 36 00 00 	lea    rax,[rip+0x368c]        # 6160 <_ZSt4cerr@GLIBCXX_3.4>
    2ad4:	48 89 c7             	mov    rdi,rax
    2ad7:	e8 d4 f8 ff ff       	call   23b0 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
    2adc:	48 89 c2             	mov    rdx,rax
    2adf:	48 8d 85 80 ed ff ff 	lea    rax,[rbp-0x1280]
    2ae6:	48 89 c6             	mov    rsi,rax
    2ae9:	48 89 d7             	mov    rdi,rdx
    2aec:	e8 9f f8 ff ff       	call   2390 <_ZStlsIcSt11char_traitsIcESaIcEERSt13basic_ostreamIT_T0_ES7_RKNSt7__cxx1112basic_stringIS4_S5_T1_EE@plt>
    2af1:	48 89 c2             	mov    rdx,rax
    2af4:	48 8d 05 dd 15 00 00 	lea    rax,[rip+0x15dd]        # 40d8 <_IO_stdin_used+0xd8>
    2afb:	48 89 c6             	mov    rsi,rax
    2afe:	48 89 d7             	mov    rdi,rdx
    2b01:	e8 aa f8 ff ff       	call   23b0 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
    2b06:	48 8b 85 48 ed ff ff 	mov    rax,QWORD PTR [rbp-0x12b8]
    2b0d:	48 89 c7             	mov    rdi,rax
    2b10:	e8 5b f9 ff ff       	call   2470 <pclose@plt>
    2b15:	bb 03 00 00 00       	mov    ebx,0x3
    2b1a:	e9 e5 00 00 00       	jmp    2c04 <main+0x5fb>
    2b1f:	48 8d 95 e0 ef ff ff 	lea    rdx,[rbp-0x1020]
    2b26:	48 8d 85 e0 ed ff ff 	lea    rax,[rbp-0x1220]
    2b2d:	48 89 d6             	mov    rsi,rdx
    2b30:	48 89 c7             	mov    rdi,rax
    2b33:	e8 78 f8 ff ff       	call   23b0 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
    2b38:	48 8b 95 48 ed ff ff 	mov    rdx,QWORD PTR [rbp-0x12b8]
    2b3f:	48 8d 85 e0 ef ff ff 	lea    rax,[rbp-0x1020]
    2b46:	be 00 10 00 00       	mov    esi,0x1000
    2b4b:	48 89 c7             	mov    rdi,rax
    2b4e:	e8 4d f9 ff ff       	call   24a0 <fgets@plt>
    2b53:	48 85 c0             	test   rax,rax
    2b56:	0f 95 c0             	setne  al
    2b59:	84 c0                	test   al,al
    2b5b:	75 c2                	jne    2b1f <main+0x516>
    2b5d:	48 8b 85 48 ed ff ff 	mov    rax,QWORD PTR [rbp-0x12b8]
    2b64:	48 89 c7             	mov    rdi,rax
    2b67:	e8 04 f9 ff ff       	call   2470 <pclose@plt>
    2b6c:	89 85 44 ed ff ff    	mov    DWORD PTR [rbp-0x12bc],eax
    2b72:	83 bd 44 ed ff ff 00 	cmp    DWORD PTR [rbp-0x12bc],0x0
    2b79:	74 41                	je     2bbc <main+0x5b3>
    2b7b:	48 8d 05 d6 15 00 00 	lea    rax,[rip+0x15d6]        # 4158 <_IO_stdin_used+0x158>
    2b82:	48 89 c6             	mov    rsi,rax
    2b85:	48 8d 05 d4 35 00 00 	lea    rax,[rip+0x35d4]        # 6160 <_ZSt4cerr@GLIBCXX_3.4>
    2b8c:	48 89 c7             	mov    rdi,rax
    2b8f:	e8 1c f8 ff ff       	call   23b0 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
    2b94:	48 89 c2             	mov    rdx,rax
    2b97:	8b 85 44 ed ff ff    	mov    eax,DWORD PTR [rbp-0x12bc]
    2b9d:	89 c6                	mov    esi,eax
    2b9f:	48 89 d7             	mov    rdi,rdx
    2ba2:	e8 29 f9 ff ff       	call   24d0 <_ZNSolsEi@plt>
    2ba7:	48 89 c2             	mov    rdx,rax
    2baa:	48 8d 05 c7 15 00 00 	lea    rax,[rip+0x15c7]        # 4178 <_IO_stdin_used+0x178>
    2bb1:	48 89 c6             	mov    rsi,rax
    2bb4:	48 89 d7             	mov    rdi,rdx
    2bb7:	e8 f4 f7 ff ff       	call   23b0 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
    2bbc:	48 8d 05 dd 15 00 00 	lea    rax,[rip+0x15dd]        # 41a0 <_IO_stdin_used+0x1a0>
    2bc3:	48 89 c6             	mov    rsi,rax
    2bc6:	48 8d 05 73 34 00 00 	lea    rax,[rip+0x3473]        # 6040 <_ZSt4cout@GLIBCXX_3.4>
    2bcd:	48 89 c7             	mov    rdi,rax
    2bd0:	e8 db f7 ff ff       	call   23b0 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
    2bd5:	48 89 c2             	mov    rdx,rax
    2bd8:	48 8d 85 80 ed ff ff 	lea    rax,[rbp-0x1280]
    2bdf:	48 89 c6             	mov    rsi,rax
    2be2:	48 89 d7             	mov    rdi,rdx
    2be5:	e8 a6 f7 ff ff       	call   2390 <_ZStlsIcSt11char_traitsIcESaIcEERSt13basic_ostreamIT_T0_ES7_RKNSt7__cxx1112basic_stringIS4_S5_T1_EE@plt>
    2bea:	48 89 c2             	mov    rdx,rax
    2bed:	48 8d 05 e4 14 00 00 	lea    rax,[rip+0x14e4]        # 40d8 <_IO_stdin_used+0xd8>
    2bf4:	48 89 c6             	mov    rsi,rax
    2bf7:	48 89 d7             	mov    rdi,rdx
    2bfa:	e8 b1 f7 ff ff       	call   23b0 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
    2bff:	bb 00 00 00 00       	mov    ebx,0x0
    2c04:	48 8d 85 e0 ed ff ff 	lea    rax,[rbp-0x1220]
    2c0b:	48 89 c7             	mov    rdi,rax
    2c0e:	e8 6d f8 ff ff       	call   2480 <_ZNSt14basic_ofstreamIcSt11char_traitsIcEED1Ev@plt>
    2c13:	48 8d 85 a0 ed ff ff 	lea    rax,[rbp-0x1260]
    2c1a:	48 89 c7             	mov    rdi,rax
    2c1d:	e8 0e f7 ff ff       	call   2330 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@plt>
    2c22:	48 8d 85 80 ed ff ff 	lea    rax,[rbp-0x1280]
    2c29:	48 89 c7             	mov    rdi,rax
    2c2c:	e8 ff f6 ff ff       	call   2330 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@plt>
    2c31:	48 8d 85 60 ed ff ff 	lea    rax,[rbp-0x12a0]
    2c38:	48 89 c7             	mov    rdi,rax
    2c3b:	e8 f0 f6 ff ff       	call   2330 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@plt>
    2c40:	89 d8                	mov    eax,ebx
    2c42:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
    2c46:	64 48 2b 14 25 28 00 	sub    rdx,QWORD PTR fs:0x28
    2c4d:	00 00 
    2c4f:	0f 84 fe 00 00 00    	je     2d53 <main+0x74a>
    2c55:	e9 f4 00 00 00       	jmp    2d4e <main+0x745>
    2c5a:	f3 0f 1e fa          	endbr64
    2c5e:	48 89 c3             	mov    rbx,rax
    2c61:	48 8d 85 3e ed ff ff 	lea    rax,[rbp-0x12c2]
    2c68:	48 89 c7             	mov    rdi,rax
    2c6b:	e8 40 06 00 00       	call   32b0 <_ZNSt15__new_allocatorIcED1Ev>
    2c70:	90                   	nop
    2c71:	e9 9b 00 00 00       	jmp    2d11 <main+0x708>
    2c76:	f3 0f 1e fa          	endbr64
    2c7a:	48 89 c3             	mov    rbx,rax
    2c7d:	48 8d 85 e0 ed ff ff 	lea    rax,[rbp-0x1220]
    2c84:	48 89 c7             	mov    rdi,rax
    2c87:	e8 a4 f6 ff ff       	call   2330 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@plt>
    2c8c:	e9 80 00 00 00       	jmp    2d11 <main+0x708>
    2c91:	f3 0f 1e fa          	endbr64
    2c95:	48 89 c3             	mov    rbx,rax
    2c98:	48 8d 85 3e ed ff ff 	lea    rax,[rbp-0x12c2]
    2c9f:	48 89 c7             	mov    rdi,rax
    2ca2:	e8 09 06 00 00       	call   32b0 <_ZNSt15__new_allocatorIcED1Ev>
    2ca7:	90                   	nop
    2ca8:	eb 67                	jmp    2d11 <main+0x708>
    2caa:	f3 0f 1e fa          	endbr64
    2cae:	48 89 c3             	mov    rbx,rax
    2cb1:	48 8d 85 e0 ed ff ff 	lea    rax,[rbp-0x1220]
    2cb8:	48 89 c7             	mov    rdi,rax
    2cbb:	e8 70 f6 ff ff       	call   2330 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@plt>
    2cc0:	eb 07                	jmp    2cc9 <main+0x6c0>
    2cc2:	f3 0f 1e fa          	endbr64
    2cc6:	48 89 c3             	mov    rbx,rax
    2cc9:	48 8d 85 c0 ed ff ff 	lea    rax,[rbp-0x1240]
    2cd0:	48 89 c7             	mov    rdi,rax
    2cd3:	e8 58 f6 ff ff       	call   2330 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@plt>
    2cd8:	eb 1f                	jmp    2cf9 <main+0x6f0>
    2cda:	f3 0f 1e fa          	endbr64
    2cde:	48 89 c3             	mov    rbx,rax
    2ce1:	48 8d 85 e0 ed ff ff 	lea    rax,[rbp-0x1220]
    2ce8:	48 89 c7             	mov    rdi,rax
    2ceb:	e8 90 f7 ff ff       	call   2480 <_ZNSt14basic_ofstreamIcSt11char_traitsIcEED1Ev@plt>
    2cf0:	eb 07                	jmp    2cf9 <main+0x6f0>
    2cf2:	f3 0f 1e fa          	endbr64
    2cf6:	48 89 c3             	mov    rbx,rax
    2cf9:	48 8d 85 a0 ed ff ff 	lea    rax,[rbp-0x1260]
    2d00:	48 89 c7             	mov    rdi,rax
    2d03:	e8 28 f6 ff ff       	call   2330 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@plt>
    2d08:	eb 07                	jmp    2d11 <main+0x708>
    2d0a:	f3 0f 1e fa          	endbr64
    2d0e:	48 89 c3             	mov    rbx,rax
    2d11:	48 8d 85 80 ed ff ff 	lea    rax,[rbp-0x1280]
    2d18:	48 89 c7             	mov    rdi,rax
    2d1b:	e8 10 f6 ff ff       	call   2330 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@plt>
    2d20:	48 8d 85 60 ed ff ff 	lea    rax,[rbp-0x12a0]
    2d27:	48 89 c7             	mov    rdi,rax
    2d2a:	e8 01 f6 ff ff       	call   2330 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@plt>
    2d2f:	48 89 d8             	mov    rax,rbx
    2d32:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
    2d36:	64 48 2b 14 25 28 00 	sub    rdx,QWORD PTR fs:0x28
    2d3d:	00 00 
    2d3f:	74 05                	je     2d46 <main+0x73d>
    2d41:	e8 ba f6 ff ff       	call   2400 <__stack_chk_fail@plt>
    2d46:	48 89 c7             	mov    rdi,rax
    2d49:	e8 92 f7 ff ff       	call   24e0 <_Unwind_Resume@plt>
    2d4e:	e8 ad f6 ff ff       	call   2400 <__stack_chk_fail@plt>
    2d53:	48 81 c4 d0 12 00 00 	add    rsp,0x12d0
    2d5a:	5b                   	pop    rbx
    2d5b:	41 5c                	pop    r12
    2d5d:	5d                   	pop    rbp
    2d5e:	c3                   	ret

0000000000002d5f <_ZSt23__is_constant_evaluatedv>:
    2d5f:	f3 0f 1e fa          	endbr64
    2d63:	55                   	push   rbp
    2d64:	48 89 e5             	mov    rbp,rsp
    2d67:	b8 00 00 00 00       	mov    eax,0x0
    2d6c:	5d                   	pop    rbp
    2d6d:	c3                   	ret

0000000000002d6e <_ZNSt11char_traitsIcE2ltERKcS2_>:
    2d6e:	f3 0f 1e fa          	endbr64
    2d72:	55                   	push   rbp
    2d73:	48 89 e5             	mov    rbp,rsp
    2d76:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    2d7a:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    2d7e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    2d82:	0f b6 00             	movzx  eax,BYTE PTR [rax]
    2d85:	89 c2                	mov    edx,eax
    2d87:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    2d8b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
    2d8e:	38 c2                	cmp    dl,al
    2d90:	0f 92 c0             	setb   al
    2d93:	5d                   	pop    rbp
    2d94:	c3                   	ret

0000000000002d95 <_ZNSt11char_traitsIcE7compareEPKcS2_m>:
    2d95:	f3 0f 1e fa          	endbr64
    2d99:	55                   	push   rbp
    2d9a:	48 89 e5             	mov    rbp,rsp
    2d9d:	48 83 ec 30          	sub    rsp,0x30
    2da1:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    2da5:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
    2da9:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
    2dad:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
    2db2:	75 0a                	jne    2dbe <_ZNSt11char_traitsIcE7compareEPKcS2_m+0x29>
    2db4:	b8 00 00 00 00       	mov    eax,0x0
    2db9:	e9 99 00 00 00       	jmp    2e57 <_ZNSt11char_traitsIcE7compareEPKcS2_m+0xc2>
    2dbe:	e8 9c ff ff ff       	call   2d5f <_ZSt23__is_constant_evaluatedv>
    2dc3:	84 c0                	test   al,al
    2dc5:	74 78                	je     2e3f <_ZNSt11char_traitsIcE7compareEPKcS2_m+0xaa>
    2dc7:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
    2dce:	00 
    2dcf:	eb 5d                	jmp    2e2e <_ZNSt11char_traitsIcE7compareEPKcS2_m+0x99>
    2dd1:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
    2dd5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    2dd9:	48 01 c2             	add    rdx,rax
    2ddc:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
    2de0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    2de4:	48 01 c8             	add    rax,rcx
    2de7:	48 89 d6             	mov    rsi,rdx
    2dea:	48 89 c7             	mov    rdi,rax
    2ded:	e8 7c ff ff ff       	call   2d6e <_ZNSt11char_traitsIcE2ltERKcS2_>
    2df2:	84 c0                	test   al,al
    2df4:	74 07                	je     2dfd <_ZNSt11char_traitsIcE7compareEPKcS2_m+0x68>
    2df6:	b8 ff ff ff ff       	mov    eax,0xffffffff
    2dfb:	eb 5a                	jmp    2e57 <_ZNSt11char_traitsIcE7compareEPKcS2_m+0xc2>
    2dfd:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
    2e01:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    2e05:	48 01 c2             	add    rdx,rax
    2e08:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
    2e0c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    2e10:	48 01 c8             	add    rax,rcx
    2e13:	48 89 d6             	mov    rsi,rdx
    2e16:	48 89 c7             	mov    rdi,rax
    2e19:	e8 50 ff ff ff       	call   2d6e <_ZNSt11char_traitsIcE2ltERKcS2_>
    2e1e:	84 c0                	test   al,al
    2e20:	74 07                	je     2e29 <_ZNSt11char_traitsIcE7compareEPKcS2_m+0x94>
    2e22:	b8 01 00 00 00       	mov    eax,0x1
    2e27:	eb 2e                	jmp    2e57 <_ZNSt11char_traitsIcE7compareEPKcS2_m+0xc2>
    2e29:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
    2e2e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    2e32:	48 3b 45 d8          	cmp    rax,QWORD PTR [rbp-0x28]
    2e36:	72 99                	jb     2dd1 <_ZNSt11char_traitsIcE7compareEPKcS2_m+0x3c>
    2e38:	b8 00 00 00 00       	mov    eax,0x0
    2e3d:	eb 18                	jmp    2e57 <_ZNSt11char_traitsIcE7compareEPKcS2_m+0xc2>
    2e3f:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
    2e43:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
    2e47:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    2e4b:	48 89 ce             	mov    rsi,rcx
    2e4e:	48 89 c7             	mov    rdi,rax
    2e51:	e8 aa f4 ff ff       	call   2300 <memcmp@plt>
    2e56:	90                   	nop
    2e57:	c9                   	leave
    2e58:	c3                   	ret

0000000000002e59 <_ZNSt11char_traitsIcE6lengthEPKc>:
    2e59:	f3 0f 1e fa          	endbr64
    2e5d:	55                   	push   rbp
    2e5e:	48 89 e5             	mov    rbp,rsp
    2e61:	48 83 ec 10          	sub    rsp,0x10
    2e65:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    2e69:	e8 f1 fe ff ff       	call   2d5f <_ZSt23__is_constant_evaluatedv>
    2e6e:	84 c0                	test   al,al
    2e70:	74 0e                	je     2e80 <_ZNSt11char_traitsIcE6lengthEPKc+0x27>
    2e72:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    2e76:	48 89 c7             	mov    rdi,rax
    2e79:	e8 28 00 00 00       	call   2ea6 <_ZN9__gnu_cxx11char_traitsIcE6lengthEPKc>
    2e7e:	eb 0d                	jmp    2e8d <_ZNSt11char_traitsIcE6lengthEPKc+0x34>
    2e80:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    2e84:	48 89 c7             	mov    rdi,rax
    2e87:	e8 64 f4 ff ff       	call   22f0 <strlen@plt>
    2e8c:	90                   	nop
    2e8d:	c9                   	leave
    2e8e:	c3                   	ret

0000000000002e8f <_ZStorSt13_Ios_OpenmodeS_>:
    2e8f:	f3 0f 1e fa          	endbr64
    2e93:	55                   	push   rbp
    2e94:	48 89 e5             	mov    rbp,rsp
    2e97:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    2e9a:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
    2e9d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
    2ea0:	0b 45 f8             	or     eax,DWORD PTR [rbp-0x8]
    2ea3:	5d                   	pop    rbp
    2ea4:	c3                   	ret
    2ea5:	90                   	nop

0000000000002ea6 <_ZN9__gnu_cxx11char_traitsIcE6lengthEPKc>:
    2ea6:	f3 0f 1e fa          	endbr64
    2eaa:	55                   	push   rbp
    2eab:	48 89 e5             	mov    rbp,rsp
    2eae:	48 83 ec 30          	sub    rsp,0x30
    2eb2:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
    2eb6:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
    2ebd:	00 00 
    2ebf:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    2ec3:	31 c0                	xor    eax,eax
    2ec5:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
    2ecc:	00 
    2ecd:	eb 05                	jmp    2ed4 <_ZN9__gnu_cxx11char_traitsIcE6lengthEPKc+0x2e>
    2ecf:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
    2ed4:	c6 45 ef 00          	mov    BYTE PTR [rbp-0x11],0x0
    2ed8:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
    2edc:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    2ee0:	48 01 c2             	add    rdx,rax
    2ee3:	48 8d 45 ef          	lea    rax,[rbp-0x11]
    2ee7:	48 89 c6             	mov    rsi,rax
    2eea:	48 89 d7             	mov    rdi,rdx
    2eed:	e8 98 03 00 00       	call   328a <_ZN9__gnu_cxx11char_traitsIcE2eqERKcS3_>
    2ef2:	83 f0 01             	xor    eax,0x1
    2ef5:	84 c0                	test   al,al
    2ef7:	75 d6                	jne    2ecf <_ZN9__gnu_cxx11char_traitsIcE6lengthEPKc+0x29>
    2ef9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    2efd:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
    2f01:	64 48 2b 14 25 28 00 	sub    rdx,QWORD PTR fs:0x28
    2f08:	00 00 
    2f0a:	74 05                	je     2f11 <_ZN9__gnu_cxx11char_traitsIcE6lengthEPKc+0x6b>
    2f0c:	e8 ef f4 ff ff       	call   2400 <__stack_chk_fail@plt>
    2f11:	c9                   	leave
    2f12:	c3                   	ret
    2f13:	90                   	nop

0000000000002f14 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderD1Ev>:
    2f14:	f3 0f 1e fa          	endbr64
    2f18:	55                   	push   rbp
    2f19:	48 89 e5             	mov    rbp,rsp
    2f1c:	48 83 ec 20          	sub    rsp,0x20
    2f20:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    2f24:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    2f28:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    2f2c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    2f30:	48 89 c7             	mov    rdi,rax
    2f33:	e8 78 03 00 00       	call   32b0 <_ZNSt15__new_allocatorIcED1Ev>
    2f38:	90                   	nop
    2f39:	90                   	nop
    2f3a:	c9                   	leave
    2f3b:	c3                   	ret

0000000000002f3c <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1IS3_EEPKcRKS3_>:
    2f3c:	f3 0f 1e fa          	endbr64
    2f40:	55                   	push   rbp
    2f41:	48 89 e5             	mov    rbp,rsp
    2f44:	53                   	push   rbx
    2f45:	48 83 ec 38          	sub    rsp,0x38
    2f49:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
    2f4d:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
    2f51:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
    2f55:	48 8b 5d d8          	mov    rbx,QWORD PTR [rbp-0x28]
    2f59:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    2f5d:	48 89 c7             	mov    rdi,rax
    2f60:	e8 0b f4 ff ff       	call   2370 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE13_M_local_dataEv@plt>
    2f65:	48 89 c1             	mov    rcx,rax
    2f68:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
    2f6c:	48 89 c2             	mov    rdx,rax
    2f6f:	48 89 ce             	mov    rsi,rcx
    2f72:	48 89 df             	mov    rdi,rbx
    2f75:	e8 46 f4 ff ff       	call   23c0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderC1EPcRKS3_@plt>
    2f7a:	48 83 7d d0 00       	cmp    QWORD PTR [rbp-0x30],0x0
    2f7f:	75 0f                	jne    2f90 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1IS3_EEPKcRKS3_+0x54>
    2f81:	48 8d 05 30 12 00 00 	lea    rax,[rip+0x1230]        # 41b8 <_IO_stdin_used+0x1b8>
    2f88:	48 89 c7             	mov    rdi,rax
    2f8b:	e8 d0 f3 ff ff       	call   2360 <_ZSt19__throw_logic_errorPKc@plt>
    2f90:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    2f94:	48 89 c7             	mov    rdi,rax
    2f97:	e8 bd fe ff ff       	call   2e59 <_ZNSt11char_traitsIcE6lengthEPKc>
    2f9c:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
    2fa0:	48 01 d0             	add    rax,rdx
    2fa3:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    2fa7:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
    2fab:	48 8b 4d d0          	mov    rcx,QWORD PTR [rbp-0x30]
    2faf:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    2fb3:	48 89 ce             	mov    rsi,rcx
    2fb6:	48 89 c7             	mov    rdi,rax
    2fb9:	e8 4e 03 00 00       	call   330c <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag>
    2fbe:	eb 1e                	jmp    2fde <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1IS3_EEPKcRKS3_+0xa2>
    2fc0:	f3 0f 1e fa          	endbr64
    2fc4:	48 89 c3             	mov    rbx,rax
    2fc7:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    2fcb:	48 89 c7             	mov    rdi,rax
    2fce:	e8 41 ff ff ff       	call   2f14 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderD1Ev>
    2fd3:	48 89 d8             	mov    rax,rbx
    2fd6:	48 89 c7             	mov    rdi,rax
    2fd9:	e8 02 f5 ff ff       	call   24e0 <_Unwind_Resume@plt>
    2fde:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
    2fe2:	c9                   	leave
    2fe3:	c3                   	ret

0000000000002fe4 <_ZSt4moveIRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEONSt16remove_referenceIT_E4typeEOS8_>:
    2fe4:	f3 0f 1e fa          	endbr64
    2fe8:	55                   	push   rbp
    2fe9:	48 89 e5             	mov    rbp,rsp
    2fec:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    2ff0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    2ff4:	5d                   	pop    rbp
    2ff5:	c3                   	ret

0000000000002ff6 <_ZSteqIcSt11char_traitsIcESaIcEEbRKNSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_>:
    2ff6:	f3 0f 1e fa          	endbr64
    2ffa:	55                   	push   rbp
    2ffb:	48 89 e5             	mov    rbp,rsp
    2ffe:	53                   	push   rbx
    2fff:	48 83 ec 18          	sub    rsp,0x18
    3003:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    3007:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
    300b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    300f:	48 89 c7             	mov    rdi,rax
    3012:	e8 39 f3 ff ff       	call   2350 <_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE4sizeEv@plt>
    3017:	48 89 c3             	mov    rbx,rax
    301a:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    301e:	48 89 c7             	mov    rdi,rax
    3021:	e8 33 fe ff ff       	call   2e59 <_ZNSt11char_traitsIcE6lengthEPKc>
    3026:	48 39 c3             	cmp    rbx,rax
    3029:	75 3b                	jne    3066 <_ZSteqIcSt11char_traitsIcESaIcEEbRKNSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_+0x70>
    302b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    302f:	48 89 c7             	mov    rdi,rax
    3032:	e8 19 f3 ff ff       	call   2350 <_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE4sizeEv@plt>
    3037:	48 89 c3             	mov    rbx,rax
    303a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    303e:	48 89 c7             	mov    rdi,rax
    3041:	e8 fa f3 ff ff       	call   2440 <_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE4dataEv@plt>
    3046:	48 89 c1             	mov    rcx,rax
    3049:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    304d:	48 89 da             	mov    rdx,rbx
    3050:	48 89 c6             	mov    rsi,rax
    3053:	48 89 cf             	mov    rdi,rcx
    3056:	e8 3a fd ff ff       	call   2d95 <_ZNSt11char_traitsIcE7compareEPKcS2_m>
    305b:	85 c0                	test   eax,eax
    305d:	75 07                	jne    3066 <_ZSteqIcSt11char_traitsIcESaIcEEbRKNSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_+0x70>
    305f:	b8 01 00 00 00       	mov    eax,0x1
    3064:	eb 05                	jmp    306b <_ZSteqIcSt11char_traitsIcESaIcEEbRKNSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_+0x75>
    3066:	b8 00 00 00 00       	mov    eax,0x0
    306b:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
    306f:	c9                   	leave
    3070:	c3                   	ret

0000000000003071 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EERKS8_PKS5_>:
    3071:	f3 0f 1e fa          	endbr64
    3075:	55                   	push   rbp
    3076:	48 89 e5             	mov    rbp,rsp
    3079:	41 54                	push   r12
    307b:	53                   	push   rbx
    307c:	48 83 ec 30          	sub    rsp,0x30
    3080:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
    3084:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
    3088:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
    308c:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
    3093:	00 00 
    3095:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    3099:	31 c0                	xor    eax,eax
    309b:	48 8d 45 e7          	lea    rax,[rbp-0x19]
    309f:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
    30a3:	48 89 d6             	mov    rsi,rdx
    30a6:	48 89 c7             	mov    rdi,rax
    30a9:	e8 22 f2 ff ff       	call   22d0 <_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE13get_allocatorEv@plt>
    30ae:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
    30b2:	48 89 c7             	mov    rdi,rax
    30b5:	e8 9f fd ff ff       	call   2e59 <_ZNSt11char_traitsIcE6lengthEPKc>
    30ba:	49 89 c4             	mov    r12,rax
    30bd:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    30c1:	48 89 c7             	mov    rdi,rax
    30c4:	e8 87 f2 ff ff       	call   2350 <_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE4sizeEv@plt>
    30c9:	48 89 c3             	mov    rbx,rax
    30cc:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    30d0:	48 89 c7             	mov    rdi,rax
    30d3:	e8 08 f2 ff ff       	call   22e0 <_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE5c_strEv@plt>
    30d8:	48 89 c6             	mov    rsi,rax
    30db:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    30df:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
    30e3:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
    30e7:	49 89 c9             	mov    r9,rcx
    30ea:	4d 89 e0             	mov    r8,r12
    30ed:	48 89 d1             	mov    rcx,rdx
    30f0:	48 89 da             	mov    rdx,rbx
    30f3:	48 89 c7             	mov    rdi,rax
    30f6:	e8 2a 03 00 00       	call   3425 <_ZSt12__str_concatINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEET_PKNS6_10value_typeENS6_9size_typeES9_SA_RKNS6_14allocator_typeE>
    30fb:	48 8d 45 e7          	lea    rax,[rbp-0x19]
    30ff:	48 89 c7             	mov    rdi,rax
    3102:	e8 a9 01 00 00       	call   32b0 <_ZNSt15__new_allocatorIcED1Ev>
    3107:	90                   	nop
    3108:	90                   	nop
    3109:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    310d:	64 48 2b 04 25 28 00 	sub    rax,QWORD PTR fs:0x28
    3114:	00 00 
    3116:	74 3a                	je     3152 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EERKS8_PKS5_+0xe1>
    3118:	eb 33                	jmp    314d <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EERKS8_PKS5_+0xdc>
    311a:	f3 0f 1e fa          	endbr64
    311e:	48 89 c3             	mov    rbx,rax
    3121:	48 8d 45 e7          	lea    rax,[rbp-0x19]
    3125:	48 89 c7             	mov    rdi,rax
    3128:	e8 83 01 00 00       	call   32b0 <_ZNSt15__new_allocatorIcED1Ev>
    312d:	90                   	nop
    312e:	48 89 d8             	mov    rax,rbx
    3131:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
    3135:	64 48 2b 14 25 28 00 	sub    rdx,QWORD PTR fs:0x28
    313c:	00 00 
    313e:	74 05                	je     3145 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EERKS8_PKS5_+0xd4>
    3140:	e8 bb f2 ff ff       	call   2400 <__stack_chk_fail@plt>
    3145:	48 89 c7             	mov    rdi,rax
    3148:	e8 93 f3 ff ff       	call   24e0 <_Unwind_Resume@plt>
    314d:	e8 ae f2 ff ff       	call   2400 <__stack_chk_fail@plt>
    3152:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    3156:	48 83 c4 30          	add    rsp,0x30
    315a:	5b                   	pop    rbx
    315b:	41 5c                	pop    r12
    315d:	5d                   	pop    rbp
    315e:	c3                   	ret

000000000000315f <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EES5_RKS8_>:
    315f:	f3 0f 1e fa          	endbr64
    3163:	55                   	push   rbp
    3164:	48 89 e5             	mov    rbp,rsp
    3167:	53                   	push   rbx
    3168:	48 83 ec 38          	sub    rsp,0x38
    316c:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
    3170:	89 f0                	mov    eax,esi
    3172:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
    3176:	88 45 d4             	mov    BYTE PTR [rbp-0x2c],al
    3179:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
    3180:	00 00 
    3182:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    3186:	31 c0                	xor    eax,eax
    3188:	48 8d 45 e7          	lea    rax,[rbp-0x19]
    318c:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
    3190:	48 89 d6             	mov    rsi,rdx
    3193:	48 89 c7             	mov    rdi,rax
    3196:	e8 35 f1 ff ff       	call   22d0 <_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE13get_allocatorEv@plt>
    319b:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
    319f:	48 89 c7             	mov    rdi,rax
    31a2:	e8 a9 f1 ff ff       	call   2350 <_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE4sizeEv@plt>
    31a7:	48 89 c3             	mov    rbx,rax
    31aa:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
    31ae:	48 89 c7             	mov    rdi,rax
    31b1:	e8 2a f1 ff ff       	call   22e0 <_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE5c_strEv@plt>
    31b6:	48 89 c2             	mov    rdx,rax
    31b9:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    31bd:	48 8d 4d e7          	lea    rcx,[rbp-0x19]
    31c1:	48 8d 75 d4          	lea    rsi,[rbp-0x2c]
    31c5:	49 89 c9             	mov    r9,rcx
    31c8:	49 89 d8             	mov    r8,rbx
    31cb:	48 89 d1             	mov    rcx,rdx
    31ce:	ba 01 00 00 00       	mov    edx,0x1
    31d3:	48 89 c7             	mov    rdi,rax
    31d6:	e8 4a 02 00 00       	call   3425 <_ZSt12__str_concatINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEET_PKNS6_10value_typeENS6_9size_typeES9_SA_RKNS6_14allocator_typeE>
    31db:	48 8d 45 e7          	lea    rax,[rbp-0x19]
    31df:	48 89 c7             	mov    rdi,rax
    31e2:	e8 c9 00 00 00       	call   32b0 <_ZNSt15__new_allocatorIcED1Ev>
    31e7:	90                   	nop
    31e8:	90                   	nop
    31e9:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    31ed:	64 48 2b 04 25 28 00 	sub    rax,QWORD PTR fs:0x28
    31f4:	00 00 
    31f6:	74 3a                	je     3232 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EES5_RKS8_+0xd3>
    31f8:	eb 33                	jmp    322d <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EES5_RKS8_+0xce>
    31fa:	f3 0f 1e fa          	endbr64
    31fe:	48 89 c3             	mov    rbx,rax
    3201:	48 8d 45 e7          	lea    rax,[rbp-0x19]
    3205:	48 89 c7             	mov    rdi,rax
    3208:	e8 a3 00 00 00       	call   32b0 <_ZNSt15__new_allocatorIcED1Ev>
    320d:	90                   	nop
    320e:	48 89 d8             	mov    rax,rbx
    3211:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
    3215:	64 48 2b 14 25 28 00 	sub    rdx,QWORD PTR fs:0x28
    321c:	00 00 
    321e:	74 05                	je     3225 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EES5_RKS8_+0xc6>
    3220:	e8 db f1 ff ff       	call   2400 <__stack_chk_fail@plt>
    3225:	48 89 c7             	mov    rdi,rax
    3228:	e8 b3 f2 ff ff       	call   24e0 <_Unwind_Resume@plt>
    322d:	e8 ce f1 ff ff       	call   2400 <__stack_chk_fail@plt>
    3232:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    3236:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
    323a:	c9                   	leave
    323b:	c3                   	ret

000000000000323c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEOS8_S5_>:
    323c:	f3 0f 1e fa          	endbr64
    3240:	55                   	push   rbp
    3241:	48 89 e5             	mov    rbp,rsp
    3244:	48 83 ec 20          	sub    rsp,0x20
    3248:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    324c:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    3250:	89 d0                	mov    eax,edx
    3252:	88 45 ec             	mov    BYTE PTR [rbp-0x14],al
    3255:	0f be 55 ec          	movsx  edx,BYTE PTR [rbp-0x14]
    3259:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    325d:	be 01 00 00 00       	mov    esi,0x1
    3262:	48 89 c7             	mov    rdi,rax
    3265:	e8 66 f1 ff ff       	call   23d0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6appendEmc@plt>
    326a:	48 89 c7             	mov    rdi,rax
    326d:	e8 72 fd ff ff       	call   2fe4 <_ZSt4moveIRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEONSt16remove_referenceIT_E4typeEOS8_>
    3272:	48 89 c2             	mov    rdx,rax
    3275:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    3279:	48 89 d6             	mov    rsi,rdx
    327c:	48 89 c7             	mov    rdi,rax
    327f:	e8 9c f0 ff ff       	call   2320 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1EOS4_@plt>
    3284:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    3288:	c9                   	leave
    3289:	c3                   	ret

000000000000328a <_ZN9__gnu_cxx11char_traitsIcE2eqERKcS3_>:
    328a:	f3 0f 1e fa          	endbr64
    328e:	55                   	push   rbp
    328f:	48 89 e5             	mov    rbp,rsp
    3292:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    3296:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    329a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    329e:	0f b6 10             	movzx  edx,BYTE PTR [rax]
    32a1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    32a5:	0f b6 00             	movzx  eax,BYTE PTR [rax]
    32a8:	38 c2                	cmp    dl,al
    32aa:	0f 94 c0             	sete   al
    32ad:	5d                   	pop    rbp
    32ae:	c3                   	ret
    32af:	90                   	nop

00000000000032b0 <_ZNSt15__new_allocatorIcED1Ev>:
    32b0:	f3 0f 1e fa          	endbr64
    32b4:	55                   	push   rbp
    32b5:	48 89 e5             	mov    rbp,rsp
    32b8:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    32bc:	90                   	nop
    32bd:	5d                   	pop    rbp
    32be:	c3                   	ret
    32bf:	90                   	nop

00000000000032c0 <_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardC1EPS4_>:
    32c0:	f3 0f 1e fa          	endbr64
    32c4:	55                   	push   rbp
    32c5:	48 89 e5             	mov    rbp,rsp
    32c8:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    32cc:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    32d0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    32d4:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
    32d8:	48 89 10             	mov    QWORD PTR [rax],rdx
    32db:	90                   	nop
    32dc:	5d                   	pop    rbp
    32dd:	c3                   	ret

00000000000032de <_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardD1Ev>:
    32de:	f3 0f 1e fa          	endbr64
    32e2:	55                   	push   rbp
    32e3:	48 89 e5             	mov    rbp,rsp
    32e6:	48 83 ec 10          	sub    rsp,0x10
    32ea:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    32ee:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    32f2:	48 8b 00             	mov    rax,QWORD PTR [rax]
    32f5:	48 85 c0             	test   rax,rax
    32f8:	74 0f                	je     3309 <_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardD1Ev+0x2b>
    32fa:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    32fe:	48 8b 00             	mov    rax,QWORD PTR [rax]
    3301:	48 89 c7             	mov    rdi,rax
    3304:	e8 17 f1 ff ff       	call   2420 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    3309:	90                   	nop
    330a:	c9                   	leave
    330b:	c3                   	ret

000000000000330c <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag>:
    330c:	f3 0f 1e fa          	endbr64
    3310:	55                   	push   rbp
    3311:	48 89 e5             	mov    rbp,rsp
    3314:	48 83 ec 60          	sub    rsp,0x60
    3318:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
    331c:	48 89 75 b0          	mov    QWORD PTR [rbp-0x50],rsi
    3320:	48 89 55 a8          	mov    QWORD PTR [rbp-0x58],rdx
    3324:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
    332b:	00 00 
    332d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    3331:	31 c0                	xor    eax,eax
    3333:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
    3337:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    333b:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
    333f:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    3343:	90                   	nop
    3344:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    3348:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    334c:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    3350:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    3354:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    3358:	48 2b 45 e0          	sub    rax,QWORD PTR [rbp-0x20]
    335c:	90                   	nop
    335d:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    3361:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
    3365:	48 83 f8 0f          	cmp    rax,0xf
    3369:	76 3f                	jbe    33aa <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag+0x9e>
    336b:	48 8d 4d c8          	lea    rcx,[rbp-0x38]
    336f:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
    3373:	ba 00 00 00 00       	mov    edx,0x0
    3378:	48 89 ce             	mov    rsi,rcx
    337b:	48 89 c7             	mov    rdi,rax
    337e:	e8 6d f1 ff ff       	call   24f0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm@plt>
    3383:	48 89 c2             	mov    rdx,rax
    3386:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
    338a:	48 89 d6             	mov    rsi,rdx
    338d:	48 89 c7             	mov    rdi,rax
    3390:	e8 eb ef ff ff       	call   2380 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7_M_dataEPc@plt>
    3395:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
    3399:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
    339d:	48 89 d6             	mov    rsi,rdx
    33a0:	48 89 c7             	mov    rdi,rax
    33a3:	e8 68 f1 ff ff       	call   2510 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE11_M_capacityEm@plt>
    33a8:	eb 09                	jmp    33b3 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag+0xa7>
    33aa:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
    33ae:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    33b2:	90                   	nop
    33b3:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
    33b7:	48 8d 45 d0          	lea    rax,[rbp-0x30]
    33bb:	48 89 d6             	mov    rsi,rdx
    33be:	48 89 c7             	mov    rdi,rax
    33c1:	e8 fa fe ff ff       	call   32c0 <_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardC1EPS4_>
    33c6:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
    33ca:	48 89 c7             	mov    rdi,rax
    33cd:	e8 0e f0 ff ff       	call   23e0 <_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7_M_dataEv@plt>
    33d2:	48 89 c1             	mov    rcx,rax
    33d5:	48 8b 55 a8          	mov    rdx,QWORD PTR [rbp-0x58]
    33d9:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
    33dd:	48 89 c6             	mov    rsi,rax
    33e0:	48 89 cf             	mov    rdi,rcx
    33e3:	e8 08 f0 ff ff       	call   23f0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE13_S_copy_charsEPcPKcS7_@plt>
    33e8:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
    33ef:	00 
    33f0:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
    33f4:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
    33f8:	48 89 d6             	mov    rsi,rdx
    33fb:	48 89 c7             	mov    rdi,rax
    33fe:	e8 3d ef ff ff       	call   2340 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE13_M_set_lengthEm@plt>
    3403:	48 8d 45 d0          	lea    rax,[rbp-0x30]
    3407:	48 89 c7             	mov    rdi,rax
    340a:	e8 cf fe ff ff       	call   32de <_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardD1Ev>
    340f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    3413:	64 48 2b 04 25 28 00 	sub    rax,QWORD PTR fs:0x28
    341a:	00 00 
    341c:	74 05                	je     3423 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag+0x117>
    341e:	e8 dd ef ff ff       	call   2400 <__stack_chk_fail@plt>
    3423:	c9                   	leave
    3424:	c3                   	ret

0000000000003425 <_ZSt12__str_concatINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEET_PKNS6_10value_typeENS6_9size_typeES9_SA_RKNS6_14allocator_typeE>:
    3425:	f3 0f 1e fa          	endbr64
    3429:	55                   	push   rbp
    342a:	48 89 e5             	mov    rbp,rsp
    342d:	53                   	push   rbx
    342e:	48 83 ec 78          	sub    rsp,0x78
    3432:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
    3436:	48 89 75 a0          	mov    QWORD PTR [rbp-0x60],rsi
    343a:	48 89 55 98          	mov    QWORD PTR [rbp-0x68],rdx
    343e:	48 89 4d 90          	mov    QWORD PTR [rbp-0x70],rcx
    3442:	4c 89 45 88          	mov    QWORD PTR [rbp-0x78],r8
    3446:	4c 89 4d 80          	mov    QWORD PTR [rbp-0x80],r9
    344a:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
    3451:	00 00 
    3453:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    3457:	31 c0                	xor    eax,eax
    3459:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
    345d:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
    3461:	48 8d 45 b7          	lea    rax,[rbp-0x49]
    3465:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
    3469:	48 89 55 c0          	mov    QWORD PTR [rbp-0x40],rdx
    346d:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    3471:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
    3475:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    3479:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
    347d:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    3481:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    3485:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    3489:	90                   	nop
    348a:	90                   	nop
    348b:	90                   	nop
    348c:	90                   	nop
    348d:	48 8d 55 b7          	lea    rdx,[rbp-0x49]
    3491:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
    3495:	48 89 d6             	mov    rsi,rdx
    3498:	48 89 c7             	mov    rdi,rax
    349b:	e8 20 f0 ff ff       	call   24c0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1ERKS3_@plt>
    34a0:	48 8d 45 b7          	lea    rax,[rbp-0x49]
    34a4:	48 89 c7             	mov    rdi,rax
    34a7:	e8 04 fe ff ff       	call   32b0 <_ZNSt15__new_allocatorIcED1Ev>
    34ac:	90                   	nop
    34ad:	48 8b 55 98          	mov    rdx,QWORD PTR [rbp-0x68]
    34b1:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
    34b5:	48 01 c2             	add    rdx,rax
    34b8:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
    34bc:	48 89 d6             	mov    rsi,rdx
    34bf:	48 89 c7             	mov    rdi,rax
    34c2:	e8 c9 ef ff ff       	call   2490 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7reserveEm@plt>
    34c7:	48 8b 55 98          	mov    rdx,QWORD PTR [rbp-0x68]
    34cb:	48 8b 4d a0          	mov    rcx,QWORD PTR [rbp-0x60]
    34cf:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
    34d3:	48 89 ce             	mov    rsi,rcx
    34d6:	48 89 c7             	mov    rdi,rax
    34d9:	e8 d2 ed ff ff       	call   22b0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6appendEPKcm@plt>
    34de:	48 8b 55 88          	mov    rdx,QWORD PTR [rbp-0x78]
    34e2:	48 8b 4d 90          	mov    rcx,QWORD PTR [rbp-0x70]
    34e6:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
    34ea:	48 89 ce             	mov    rsi,rcx
    34ed:	48 89 c7             	mov    rdi,rax
    34f0:	e8 bb ed ff ff       	call   22b0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6appendEPKcm@plt>
    34f5:	eb 32                	jmp    3529 <_ZSt12__str_concatINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEET_PKNS6_10value_typeENS6_9size_typeES9_SA_RKNS6_14allocator_typeE+0x104>
    34f7:	f3 0f 1e fa          	endbr64
    34fb:	48 89 c3             	mov    rbx,rax
    34fe:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
    3502:	48 89 c7             	mov    rdi,rax
    3505:	e8 26 ee ff ff       	call   2330 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@plt>
    350a:	48 89 d8             	mov    rax,rbx
    350d:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
    3511:	64 48 2b 14 25 28 00 	sub    rdx,QWORD PTR fs:0x28
    3518:	00 00 
    351a:	74 05                	je     3521 <_ZSt12__str_concatINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEET_PKNS6_10value_typeENS6_9size_typeES9_SA_RKNS6_14allocator_typeE+0xfc>
    351c:	e8 df ee ff ff       	call   2400 <__stack_chk_fail@plt>
    3521:	48 89 c7             	mov    rdi,rax
    3524:	e8 b7 ef ff ff       	call   24e0 <_Unwind_Resume@plt>
    3529:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    352d:	64 48 2b 04 25 28 00 	sub    rax,QWORD PTR fs:0x28
    3534:	00 00 
    3536:	74 05                	je     353d <_ZSt12__str_concatINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEET_PKNS6_10value_typeENS6_9size_typeES9_SA_RKNS6_14allocator_typeE+0x118>
    3538:	e8 c3 ee ff ff       	call   2400 <__stack_chk_fail@plt>
    353d:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
    3541:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
    3545:	c9                   	leave
    3546:	c3                   	ret

Disassembly of section .fini:

0000000000003548 <_fini>:
    3548:	f3 0f 1e fa          	endbr64
    354c:	48 83 ec 08          	sub    rsp,0x8
    3550:	48 83 c4 08          	add    rsp,0x8
    3554:	c3                   	ret
