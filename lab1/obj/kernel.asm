
bin/kernel:     file format elf32-i386


Disassembly of section .text:

00100000 <kern_init>:
int kern_init(void) __attribute__((noreturn));
void grade_backtrace(void);
static void lab1_switch_test(void);

int
kern_init(void) {
  100000:	f3 0f 1e fb          	endbr32 
  100004:	55                   	push   %ebp
  100005:	89 e5                	mov    %esp,%ebp
  100007:	83 ec 28             	sub    $0x28,%esp
    extern char edata[], end[];
    memset(edata, 0, end - edata);
  10000a:	b8 20 0d 11 00       	mov    $0x110d20,%eax
  10000f:	2d 16 fa 10 00       	sub    $0x10fa16,%eax
  100014:	89 44 24 08          	mov    %eax,0x8(%esp)
  100018:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  10001f:	00 
  100020:	c7 04 24 16 fa 10 00 	movl   $0x10fa16,(%esp)
  100027:	e8 ac 2d 00 00       	call   102dd8 <memset>

    cons_init();                // init the console
  10002c:	e8 06 16 00 00       	call   101637 <cons_init>

    const char *message = "(THU.CST) os is loading ...";
  100031:	c7 45 f4 00 36 10 00 	movl   $0x103600,-0xc(%ebp)
    cprintf("%s\n\n", message);
  100038:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10003b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10003f:	c7 04 24 1c 36 10 00 	movl   $0x10361c,(%esp)
  100046:	e8 39 02 00 00       	call   100284 <cprintf>

    print_kerninfo();
  10004b:	e8 f7 08 00 00       	call   100947 <print_kerninfo>

    grade_backtrace();
  100050:	e8 95 00 00 00       	call   1000ea <grade_backtrace>

    pmm_init();                 // init physical memory management
  100055:	e8 2d 2a 00 00       	call   102a87 <pmm_init>

    pic_init();                 // init interrupt controller
  10005a:	e8 2d 17 00 00       	call   10178c <pic_init>
    idt_init();                 // init interrupt descriptor table
  10005f:	e8 d2 18 00 00       	call   101936 <idt_init>

    clock_init();               // init clock interrupt
  100064:	e8 53 0d 00 00       	call   100dbc <clock_init>
    intr_enable();              // enable irq interrupt
  100069:	e8 6a 18 00 00       	call   1018d8 <intr_enable>
    //LAB1: CAHLLENGE 1 If you try to do it, uncomment lab1_switch_test()
    // user/kernel mode switch test
    //lab1_switch_test();

    /* do nothing */
    while (1);
  10006e:	eb fe                	jmp    10006e <kern_init+0x6e>

00100070 <grade_backtrace2>:
}

void __attribute__((noinline))
grade_backtrace2(int arg0, int arg1, int arg2, int arg3) {
  100070:	f3 0f 1e fb          	endbr32 
  100074:	55                   	push   %ebp
  100075:	89 e5                	mov    %esp,%ebp
  100077:	83 ec 18             	sub    $0x18,%esp
    mon_backtrace(0, NULL, NULL);
  10007a:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  100081:	00 
  100082:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  100089:	00 
  10008a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100091:	e8 10 0d 00 00       	call   100da6 <mon_backtrace>
}
  100096:	90                   	nop
  100097:	c9                   	leave  
  100098:	c3                   	ret    

00100099 <grade_backtrace1>:

void __attribute__((noinline))
grade_backtrace1(int arg0, int arg1) {
  100099:	f3 0f 1e fb          	endbr32 
  10009d:	55                   	push   %ebp
  10009e:	89 e5                	mov    %esp,%ebp
  1000a0:	53                   	push   %ebx
  1000a1:	83 ec 14             	sub    $0x14,%esp
    grade_backtrace2(arg0, (int)&arg0, arg1, (int)&arg1);
  1000a4:	8d 4d 0c             	lea    0xc(%ebp),%ecx
  1000a7:	8b 55 0c             	mov    0xc(%ebp),%edx
  1000aa:	8d 5d 08             	lea    0x8(%ebp),%ebx
  1000ad:	8b 45 08             	mov    0x8(%ebp),%eax
  1000b0:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
  1000b4:	89 54 24 08          	mov    %edx,0x8(%esp)
  1000b8:	89 5c 24 04          	mov    %ebx,0x4(%esp)
  1000bc:	89 04 24             	mov    %eax,(%esp)
  1000bf:	e8 ac ff ff ff       	call   100070 <grade_backtrace2>
}
  1000c4:	90                   	nop
  1000c5:	83 c4 14             	add    $0x14,%esp
  1000c8:	5b                   	pop    %ebx
  1000c9:	5d                   	pop    %ebp
  1000ca:	c3                   	ret    

001000cb <grade_backtrace0>:

void __attribute__((noinline))
grade_backtrace0(int arg0, int arg1, int arg2) {
  1000cb:	f3 0f 1e fb          	endbr32 
  1000cf:	55                   	push   %ebp
  1000d0:	89 e5                	mov    %esp,%ebp
  1000d2:	83 ec 18             	sub    $0x18,%esp
    grade_backtrace1(arg0, arg2);
  1000d5:	8b 45 10             	mov    0x10(%ebp),%eax
  1000d8:	89 44 24 04          	mov    %eax,0x4(%esp)
  1000dc:	8b 45 08             	mov    0x8(%ebp),%eax
  1000df:	89 04 24             	mov    %eax,(%esp)
  1000e2:	e8 b2 ff ff ff       	call   100099 <grade_backtrace1>
}
  1000e7:	90                   	nop
  1000e8:	c9                   	leave  
  1000e9:	c3                   	ret    

001000ea <grade_backtrace>:

void
grade_backtrace(void) {
  1000ea:	f3 0f 1e fb          	endbr32 
  1000ee:	55                   	push   %ebp
  1000ef:	89 e5                	mov    %esp,%ebp
  1000f1:	83 ec 18             	sub    $0x18,%esp
    grade_backtrace0(0, (int)kern_init, 0xffff0000);
  1000f4:	b8 00 00 10 00       	mov    $0x100000,%eax
  1000f9:	c7 44 24 08 00 00 ff 	movl   $0xffff0000,0x8(%esp)
  100100:	ff 
  100101:	89 44 24 04          	mov    %eax,0x4(%esp)
  100105:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  10010c:	e8 ba ff ff ff       	call   1000cb <grade_backtrace0>
}
  100111:	90                   	nop
  100112:	c9                   	leave  
  100113:	c3                   	ret    

00100114 <lab1_print_cur_status>:

static void
lab1_print_cur_status(void) {
  100114:	f3 0f 1e fb          	endbr32 
  100118:	55                   	push   %ebp
  100119:	89 e5                	mov    %esp,%ebp
  10011b:	83 ec 28             	sub    $0x28,%esp
    static int round = 0;
    uint16_t reg1, reg2, reg3, reg4;
    asm volatile (
  10011e:	8c 4d f6             	mov    %cs,-0xa(%ebp)
  100121:	8c 5d f4             	mov    %ds,-0xc(%ebp)
  100124:	8c 45 f2             	mov    %es,-0xe(%ebp)
  100127:	8c 55 f0             	mov    %ss,-0x10(%ebp)
            "mov %%cs, %0;"
            "mov %%ds, %1;"
            "mov %%es, %2;"
            "mov %%ss, %3;"
            : "=m"(reg1), "=m"(reg2), "=m"(reg3), "=m"(reg4));
    cprintf("%d: @ring %d\n", round, reg1 & 3);
  10012a:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  10012e:	83 e0 03             	and    $0x3,%eax
  100131:	89 c2                	mov    %eax,%edx
  100133:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  100138:	89 54 24 08          	mov    %edx,0x8(%esp)
  10013c:	89 44 24 04          	mov    %eax,0x4(%esp)
  100140:	c7 04 24 21 36 10 00 	movl   $0x103621,(%esp)
  100147:	e8 38 01 00 00       	call   100284 <cprintf>
    cprintf("%d:  cs = %x\n", round, reg1);
  10014c:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100150:	89 c2                	mov    %eax,%edx
  100152:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  100157:	89 54 24 08          	mov    %edx,0x8(%esp)
  10015b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10015f:	c7 04 24 2f 36 10 00 	movl   $0x10362f,(%esp)
  100166:	e8 19 01 00 00       	call   100284 <cprintf>
    cprintf("%d:  ds = %x\n", round, reg2);
  10016b:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
  10016f:	89 c2                	mov    %eax,%edx
  100171:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  100176:	89 54 24 08          	mov    %edx,0x8(%esp)
  10017a:	89 44 24 04          	mov    %eax,0x4(%esp)
  10017e:	c7 04 24 3d 36 10 00 	movl   $0x10363d,(%esp)
  100185:	e8 fa 00 00 00       	call   100284 <cprintf>
    cprintf("%d:  es = %x\n", round, reg3);
  10018a:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  10018e:	89 c2                	mov    %eax,%edx
  100190:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  100195:	89 54 24 08          	mov    %edx,0x8(%esp)
  100199:	89 44 24 04          	mov    %eax,0x4(%esp)
  10019d:	c7 04 24 4b 36 10 00 	movl   $0x10364b,(%esp)
  1001a4:	e8 db 00 00 00       	call   100284 <cprintf>
    cprintf("%d:  ss = %x\n", round, reg4);
  1001a9:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
  1001ad:	89 c2                	mov    %eax,%edx
  1001af:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  1001b4:	89 54 24 08          	mov    %edx,0x8(%esp)
  1001b8:	89 44 24 04          	mov    %eax,0x4(%esp)
  1001bc:	c7 04 24 59 36 10 00 	movl   $0x103659,(%esp)
  1001c3:	e8 bc 00 00 00       	call   100284 <cprintf>
    round ++;
  1001c8:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  1001cd:	40                   	inc    %eax
  1001ce:	a3 20 fa 10 00       	mov    %eax,0x10fa20
}
  1001d3:	90                   	nop
  1001d4:	c9                   	leave  
  1001d5:	c3                   	ret    

001001d6 <lab1_switch_to_user>:

static void
lab1_switch_to_user(void) {
  1001d6:	f3 0f 1e fb          	endbr32 
  1001da:	55                   	push   %ebp
  1001db:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 : TODO
}
  1001dd:	90                   	nop
  1001de:	5d                   	pop    %ebp
  1001df:	c3                   	ret    

001001e0 <lab1_switch_to_kernel>:

static void
lab1_switch_to_kernel(void) {
  1001e0:	f3 0f 1e fb          	endbr32 
  1001e4:	55                   	push   %ebp
  1001e5:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 :  TODO
}
  1001e7:	90                   	nop
  1001e8:	5d                   	pop    %ebp
  1001e9:	c3                   	ret    

001001ea <lab1_switch_test>:

static void
lab1_switch_test(void) {
  1001ea:	f3 0f 1e fb          	endbr32 
  1001ee:	55                   	push   %ebp
  1001ef:	89 e5                	mov    %esp,%ebp
  1001f1:	83 ec 18             	sub    $0x18,%esp
    lab1_print_cur_status();
  1001f4:	e8 1b ff ff ff       	call   100114 <lab1_print_cur_status>
    cprintf("+++ switch to  user  mode +++\n");
  1001f9:	c7 04 24 68 36 10 00 	movl   $0x103668,(%esp)
  100200:	e8 7f 00 00 00       	call   100284 <cprintf>
    lab1_switch_to_user();
  100205:	e8 cc ff ff ff       	call   1001d6 <lab1_switch_to_user>
    lab1_print_cur_status();
  10020a:	e8 05 ff ff ff       	call   100114 <lab1_print_cur_status>
    cprintf("+++ switch to kernel mode +++\n");
  10020f:	c7 04 24 88 36 10 00 	movl   $0x103688,(%esp)
  100216:	e8 69 00 00 00       	call   100284 <cprintf>
    lab1_switch_to_kernel();
  10021b:	e8 c0 ff ff ff       	call   1001e0 <lab1_switch_to_kernel>
    lab1_print_cur_status();
  100220:	e8 ef fe ff ff       	call   100114 <lab1_print_cur_status>
}
  100225:	90                   	nop
  100226:	c9                   	leave  
  100227:	c3                   	ret    

00100228 <cputch>:
/* *
 * cputch - writes a single character @c to stdout, and it will
 * increace the value of counter pointed by @cnt.
 * */
static void
cputch(int c, int *cnt) {
  100228:	f3 0f 1e fb          	endbr32 
  10022c:	55                   	push   %ebp
  10022d:	89 e5                	mov    %esp,%ebp
  10022f:	83 ec 18             	sub    $0x18,%esp
    cons_putc(c);
  100232:	8b 45 08             	mov    0x8(%ebp),%eax
  100235:	89 04 24             	mov    %eax,(%esp)
  100238:	e8 2b 14 00 00       	call   101668 <cons_putc>
    (*cnt) ++;
  10023d:	8b 45 0c             	mov    0xc(%ebp),%eax
  100240:	8b 00                	mov    (%eax),%eax
  100242:	8d 50 01             	lea    0x1(%eax),%edx
  100245:	8b 45 0c             	mov    0xc(%ebp),%eax
  100248:	89 10                	mov    %edx,(%eax)
}
  10024a:	90                   	nop
  10024b:	c9                   	leave  
  10024c:	c3                   	ret    

0010024d <vcprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want cprintf() instead.
 * */
int
vcprintf(const char *fmt, va_list ap) {
  10024d:	f3 0f 1e fb          	endbr32 
  100251:	55                   	push   %ebp
  100252:	89 e5                	mov    %esp,%ebp
  100254:	83 ec 28             	sub    $0x28,%esp
    int cnt = 0;
  100257:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    vprintfmt((void*)cputch, &cnt, fmt, ap);
  10025e:	8b 45 0c             	mov    0xc(%ebp),%eax
  100261:	89 44 24 0c          	mov    %eax,0xc(%esp)
  100265:	8b 45 08             	mov    0x8(%ebp),%eax
  100268:	89 44 24 08          	mov    %eax,0x8(%esp)
  10026c:	8d 45 f4             	lea    -0xc(%ebp),%eax
  10026f:	89 44 24 04          	mov    %eax,0x4(%esp)
  100273:	c7 04 24 28 02 10 00 	movl   $0x100228,(%esp)
  10027a:	e8 c5 2e 00 00       	call   103144 <vprintfmt>
    return cnt;
  10027f:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100282:	c9                   	leave  
  100283:	c3                   	ret    

00100284 <cprintf>:
 *
 * The return value is the number of characters which would be
 * written to stdout.
 * */
int
cprintf(const char *fmt, ...) {
  100284:	f3 0f 1e fb          	endbr32 
  100288:	55                   	push   %ebp
  100289:	89 e5                	mov    %esp,%ebp
  10028b:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  10028e:	8d 45 0c             	lea    0xc(%ebp),%eax
  100291:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vcprintf(fmt, ap);
  100294:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100297:	89 44 24 04          	mov    %eax,0x4(%esp)
  10029b:	8b 45 08             	mov    0x8(%ebp),%eax
  10029e:	89 04 24             	mov    %eax,(%esp)
  1002a1:	e8 a7 ff ff ff       	call   10024d <vcprintf>
  1002a6:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  1002a9:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1002ac:	c9                   	leave  
  1002ad:	c3                   	ret    

001002ae <cputchar>:

/* cputchar - writes a single character to stdout */
void
cputchar(int c) {
  1002ae:	f3 0f 1e fb          	endbr32 
  1002b2:	55                   	push   %ebp
  1002b3:	89 e5                	mov    %esp,%ebp
  1002b5:	83 ec 18             	sub    $0x18,%esp
    cons_putc(c);
  1002b8:	8b 45 08             	mov    0x8(%ebp),%eax
  1002bb:	89 04 24             	mov    %eax,(%esp)
  1002be:	e8 a5 13 00 00       	call   101668 <cons_putc>
}
  1002c3:	90                   	nop
  1002c4:	c9                   	leave  
  1002c5:	c3                   	ret    

001002c6 <cputs>:
/* *
 * cputs- writes the string pointed by @str to stdout and
 * appends a newline character.
 * */
int
cputs(const char *str) {
  1002c6:	f3 0f 1e fb          	endbr32 
  1002ca:	55                   	push   %ebp
  1002cb:	89 e5                	mov    %esp,%ebp
  1002cd:	83 ec 28             	sub    $0x28,%esp
    int cnt = 0;
  1002d0:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    char c;
    while ((c = *str ++) != '\0') {
  1002d7:	eb 13                	jmp    1002ec <cputs+0x26>
        cputch(c, &cnt);
  1002d9:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  1002dd:	8d 55 f0             	lea    -0x10(%ebp),%edx
  1002e0:	89 54 24 04          	mov    %edx,0x4(%esp)
  1002e4:	89 04 24             	mov    %eax,(%esp)
  1002e7:	e8 3c ff ff ff       	call   100228 <cputch>
    while ((c = *str ++) != '\0') {
  1002ec:	8b 45 08             	mov    0x8(%ebp),%eax
  1002ef:	8d 50 01             	lea    0x1(%eax),%edx
  1002f2:	89 55 08             	mov    %edx,0x8(%ebp)
  1002f5:	0f b6 00             	movzbl (%eax),%eax
  1002f8:	88 45 f7             	mov    %al,-0x9(%ebp)
  1002fb:	80 7d f7 00          	cmpb   $0x0,-0x9(%ebp)
  1002ff:	75 d8                	jne    1002d9 <cputs+0x13>
    }
    cputch('\n', &cnt);
  100301:	8d 45 f0             	lea    -0x10(%ebp),%eax
  100304:	89 44 24 04          	mov    %eax,0x4(%esp)
  100308:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
  10030f:	e8 14 ff ff ff       	call   100228 <cputch>
    return cnt;
  100314:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
  100317:	c9                   	leave  
  100318:	c3                   	ret    

00100319 <getchar>:

/* getchar - reads a single non-zero character from stdin */
int
getchar(void) {
  100319:	f3 0f 1e fb          	endbr32 
  10031d:	55                   	push   %ebp
  10031e:	89 e5                	mov    %esp,%ebp
  100320:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = cons_getc()) == 0)
  100323:	90                   	nop
  100324:	e8 6d 13 00 00       	call   101696 <cons_getc>
  100329:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10032c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100330:	74 f2                	je     100324 <getchar+0xb>
        /* do nothing */;
    return c;
  100332:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100335:	c9                   	leave  
  100336:	c3                   	ret    

00100337 <readline>:
 * The readline() function returns the text of the line read. If some errors
 * are happened, NULL is returned. The return value is a global variable,
 * thus it should be copied before it is used.
 * */
char *
readline(const char *prompt) {
  100337:	f3 0f 1e fb          	endbr32 
  10033b:	55                   	push   %ebp
  10033c:	89 e5                	mov    %esp,%ebp
  10033e:	83 ec 28             	sub    $0x28,%esp
    if (prompt != NULL) {
  100341:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100345:	74 13                	je     10035a <readline+0x23>
        cprintf("%s", prompt);
  100347:	8b 45 08             	mov    0x8(%ebp),%eax
  10034a:	89 44 24 04          	mov    %eax,0x4(%esp)
  10034e:	c7 04 24 a7 36 10 00 	movl   $0x1036a7,(%esp)
  100355:	e8 2a ff ff ff       	call   100284 <cprintf>
    }
    int i = 0, c;
  10035a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        c = getchar();
  100361:	e8 b3 ff ff ff       	call   100319 <getchar>
  100366:	89 45 f0             	mov    %eax,-0x10(%ebp)
        if (c < 0) {
  100369:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  10036d:	79 07                	jns    100376 <readline+0x3f>
            return NULL;
  10036f:	b8 00 00 00 00       	mov    $0x0,%eax
  100374:	eb 78                	jmp    1003ee <readline+0xb7>
        }
        else if (c >= ' ' && i < BUFSIZE - 1) {
  100376:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
  10037a:	7e 28                	jle    1003a4 <readline+0x6d>
  10037c:	81 7d f4 fe 03 00 00 	cmpl   $0x3fe,-0xc(%ebp)
  100383:	7f 1f                	jg     1003a4 <readline+0x6d>
            cputchar(c);
  100385:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100388:	89 04 24             	mov    %eax,(%esp)
  10038b:	e8 1e ff ff ff       	call   1002ae <cputchar>
            buf[i ++] = c;
  100390:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100393:	8d 50 01             	lea    0x1(%eax),%edx
  100396:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100399:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10039c:	88 90 40 fa 10 00    	mov    %dl,0x10fa40(%eax)
  1003a2:	eb 45                	jmp    1003e9 <readline+0xb2>
        }
        else if (c == '\b' && i > 0) {
  1003a4:	83 7d f0 08          	cmpl   $0x8,-0x10(%ebp)
  1003a8:	75 16                	jne    1003c0 <readline+0x89>
  1003aa:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1003ae:	7e 10                	jle    1003c0 <readline+0x89>
            cputchar(c);
  1003b0:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1003b3:	89 04 24             	mov    %eax,(%esp)
  1003b6:	e8 f3 fe ff ff       	call   1002ae <cputchar>
            i --;
  1003bb:	ff 4d f4             	decl   -0xc(%ebp)
  1003be:	eb 29                	jmp    1003e9 <readline+0xb2>
        }
        else if (c == '\n' || c == '\r') {
  1003c0:	83 7d f0 0a          	cmpl   $0xa,-0x10(%ebp)
  1003c4:	74 06                	je     1003cc <readline+0x95>
  1003c6:	83 7d f0 0d          	cmpl   $0xd,-0x10(%ebp)
  1003ca:	75 95                	jne    100361 <readline+0x2a>
            cputchar(c);
  1003cc:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1003cf:	89 04 24             	mov    %eax,(%esp)
  1003d2:	e8 d7 fe ff ff       	call   1002ae <cputchar>
            buf[i] = '\0';
  1003d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1003da:	05 40 fa 10 00       	add    $0x10fa40,%eax
  1003df:	c6 00 00             	movb   $0x0,(%eax)
            return buf;
  1003e2:	b8 40 fa 10 00       	mov    $0x10fa40,%eax
  1003e7:	eb 05                	jmp    1003ee <readline+0xb7>
        c = getchar();
  1003e9:	e9 73 ff ff ff       	jmp    100361 <readline+0x2a>
        }
    }
}
  1003ee:	c9                   	leave  
  1003ef:	c3                   	ret    

001003f0 <__panic>:
/* *
 * __panic - __panic is called on unresolvable fatal errors. it prints
 * "panic: 'message'", and then enters the kernel monitor.
 * */
void
__panic(const char *file, int line, const char *fmt, ...) {
  1003f0:	f3 0f 1e fb          	endbr32 
  1003f4:	55                   	push   %ebp
  1003f5:	89 e5                	mov    %esp,%ebp
  1003f7:	83 ec 28             	sub    $0x28,%esp
    if (is_panic) {
  1003fa:	a1 40 fe 10 00       	mov    0x10fe40,%eax
  1003ff:	85 c0                	test   %eax,%eax
  100401:	75 5b                	jne    10045e <__panic+0x6e>
        goto panic_dead;
    }
    is_panic = 1;
  100403:	c7 05 40 fe 10 00 01 	movl   $0x1,0x10fe40
  10040a:	00 00 00 

    // print the 'message'
    va_list ap;
    va_start(ap, fmt);
  10040d:	8d 45 14             	lea    0x14(%ebp),%eax
  100410:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel panic at %s:%d:\n    ", file, line);
  100413:	8b 45 0c             	mov    0xc(%ebp),%eax
  100416:	89 44 24 08          	mov    %eax,0x8(%esp)
  10041a:	8b 45 08             	mov    0x8(%ebp),%eax
  10041d:	89 44 24 04          	mov    %eax,0x4(%esp)
  100421:	c7 04 24 aa 36 10 00 	movl   $0x1036aa,(%esp)
  100428:	e8 57 fe ff ff       	call   100284 <cprintf>
    vcprintf(fmt, ap);
  10042d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100430:	89 44 24 04          	mov    %eax,0x4(%esp)
  100434:	8b 45 10             	mov    0x10(%ebp),%eax
  100437:	89 04 24             	mov    %eax,(%esp)
  10043a:	e8 0e fe ff ff       	call   10024d <vcprintf>
    cprintf("\n");
  10043f:	c7 04 24 c6 36 10 00 	movl   $0x1036c6,(%esp)
  100446:	e8 39 fe ff ff       	call   100284 <cprintf>
    
    cprintf("stack trackback:\n");
  10044b:	c7 04 24 c8 36 10 00 	movl   $0x1036c8,(%esp)
  100452:	e8 2d fe ff ff       	call   100284 <cprintf>
    print_stackframe();
  100457:	e8 3d 06 00 00       	call   100a99 <print_stackframe>
  10045c:	eb 01                	jmp    10045f <__panic+0x6f>
        goto panic_dead;
  10045e:	90                   	nop
    
    va_end(ap);

panic_dead:
    intr_disable();
  10045f:	e8 80 14 00 00       	call   1018e4 <intr_disable>
    while (1) {
        kmonitor(NULL);
  100464:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  10046b:	e8 5d 08 00 00       	call   100ccd <kmonitor>
  100470:	eb f2                	jmp    100464 <__panic+0x74>

00100472 <__warn>:
    }
}

/* __warn - like panic, but don't */
void
__warn(const char *file, int line, const char *fmt, ...) {
  100472:	f3 0f 1e fb          	endbr32 
  100476:	55                   	push   %ebp
  100477:	89 e5                	mov    %esp,%ebp
  100479:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    va_start(ap, fmt);
  10047c:	8d 45 14             	lea    0x14(%ebp),%eax
  10047f:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel warning at %s:%d:\n    ", file, line);
  100482:	8b 45 0c             	mov    0xc(%ebp),%eax
  100485:	89 44 24 08          	mov    %eax,0x8(%esp)
  100489:	8b 45 08             	mov    0x8(%ebp),%eax
  10048c:	89 44 24 04          	mov    %eax,0x4(%esp)
  100490:	c7 04 24 da 36 10 00 	movl   $0x1036da,(%esp)
  100497:	e8 e8 fd ff ff       	call   100284 <cprintf>
    vcprintf(fmt, ap);
  10049c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10049f:	89 44 24 04          	mov    %eax,0x4(%esp)
  1004a3:	8b 45 10             	mov    0x10(%ebp),%eax
  1004a6:	89 04 24             	mov    %eax,(%esp)
  1004a9:	e8 9f fd ff ff       	call   10024d <vcprintf>
    cprintf("\n");
  1004ae:	c7 04 24 c6 36 10 00 	movl   $0x1036c6,(%esp)
  1004b5:	e8 ca fd ff ff       	call   100284 <cprintf>
    va_end(ap);
}
  1004ba:	90                   	nop
  1004bb:	c9                   	leave  
  1004bc:	c3                   	ret    

001004bd <is_kernel_panic>:

bool
is_kernel_panic(void) {
  1004bd:	f3 0f 1e fb          	endbr32 
  1004c1:	55                   	push   %ebp
  1004c2:	89 e5                	mov    %esp,%ebp
    return is_panic;
  1004c4:	a1 40 fe 10 00       	mov    0x10fe40,%eax
}
  1004c9:	5d                   	pop    %ebp
  1004ca:	c3                   	ret    

001004cb <stab_binsearch>:
 *      stab_binsearch(stabs, &left, &right, N_SO, 0xf0100184);
 * will exit setting left = 118, right = 554.
 * */
static void
stab_binsearch(const struct stab *stabs, int *region_left, int *region_right,
           int type, uintptr_t addr) {
  1004cb:	f3 0f 1e fb          	endbr32 
  1004cf:	55                   	push   %ebp
  1004d0:	89 e5                	mov    %esp,%ebp
  1004d2:	83 ec 20             	sub    $0x20,%esp
    int l = *region_left, r = *region_right, any_matches = 0;
  1004d5:	8b 45 0c             	mov    0xc(%ebp),%eax
  1004d8:	8b 00                	mov    (%eax),%eax
  1004da:	89 45 fc             	mov    %eax,-0x4(%ebp)
  1004dd:	8b 45 10             	mov    0x10(%ebp),%eax
  1004e0:	8b 00                	mov    (%eax),%eax
  1004e2:	89 45 f8             	mov    %eax,-0x8(%ebp)
  1004e5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)

    while (l <= r) {
  1004ec:	e9 ca 00 00 00       	jmp    1005bb <stab_binsearch+0xf0>
        int true_m = (l + r) / 2, m = true_m;
  1004f1:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1004f4:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1004f7:	01 d0                	add    %edx,%eax
  1004f9:	89 c2                	mov    %eax,%edx
  1004fb:	c1 ea 1f             	shr    $0x1f,%edx
  1004fe:	01 d0                	add    %edx,%eax
  100500:	d1 f8                	sar    %eax
  100502:	89 45 ec             	mov    %eax,-0x14(%ebp)
  100505:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100508:	89 45 f0             	mov    %eax,-0x10(%ebp)

        // search for earliest stab with right type
        while (m >= l && stabs[m].n_type != type) {
  10050b:	eb 03                	jmp    100510 <stab_binsearch+0x45>
            m --;
  10050d:	ff 4d f0             	decl   -0x10(%ebp)
        while (m >= l && stabs[m].n_type != type) {
  100510:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100513:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  100516:	7c 1f                	jl     100537 <stab_binsearch+0x6c>
  100518:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10051b:	89 d0                	mov    %edx,%eax
  10051d:	01 c0                	add    %eax,%eax
  10051f:	01 d0                	add    %edx,%eax
  100521:	c1 e0 02             	shl    $0x2,%eax
  100524:	89 c2                	mov    %eax,%edx
  100526:	8b 45 08             	mov    0x8(%ebp),%eax
  100529:	01 d0                	add    %edx,%eax
  10052b:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10052f:	0f b6 c0             	movzbl %al,%eax
  100532:	39 45 14             	cmp    %eax,0x14(%ebp)
  100535:	75 d6                	jne    10050d <stab_binsearch+0x42>
        }
        if (m < l) {    // no match in [l, m]
  100537:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10053a:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  10053d:	7d 09                	jge    100548 <stab_binsearch+0x7d>
            l = true_m + 1;
  10053f:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100542:	40                   	inc    %eax
  100543:	89 45 fc             	mov    %eax,-0x4(%ebp)
            continue;
  100546:	eb 73                	jmp    1005bb <stab_binsearch+0xf0>
        }

        // actual binary search
        any_matches = 1;
  100548:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
        if (stabs[m].n_value < addr) {
  10054f:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100552:	89 d0                	mov    %edx,%eax
  100554:	01 c0                	add    %eax,%eax
  100556:	01 d0                	add    %edx,%eax
  100558:	c1 e0 02             	shl    $0x2,%eax
  10055b:	89 c2                	mov    %eax,%edx
  10055d:	8b 45 08             	mov    0x8(%ebp),%eax
  100560:	01 d0                	add    %edx,%eax
  100562:	8b 40 08             	mov    0x8(%eax),%eax
  100565:	39 45 18             	cmp    %eax,0x18(%ebp)
  100568:	76 11                	jbe    10057b <stab_binsearch+0xb0>
            *region_left = m;
  10056a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10056d:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100570:	89 10                	mov    %edx,(%eax)
            l = true_m + 1;
  100572:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100575:	40                   	inc    %eax
  100576:	89 45 fc             	mov    %eax,-0x4(%ebp)
  100579:	eb 40                	jmp    1005bb <stab_binsearch+0xf0>
        } else if (stabs[m].n_value > addr) {
  10057b:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10057e:	89 d0                	mov    %edx,%eax
  100580:	01 c0                	add    %eax,%eax
  100582:	01 d0                	add    %edx,%eax
  100584:	c1 e0 02             	shl    $0x2,%eax
  100587:	89 c2                	mov    %eax,%edx
  100589:	8b 45 08             	mov    0x8(%ebp),%eax
  10058c:	01 d0                	add    %edx,%eax
  10058e:	8b 40 08             	mov    0x8(%eax),%eax
  100591:	39 45 18             	cmp    %eax,0x18(%ebp)
  100594:	73 14                	jae    1005aa <stab_binsearch+0xdf>
            *region_right = m - 1;
  100596:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100599:	8d 50 ff             	lea    -0x1(%eax),%edx
  10059c:	8b 45 10             	mov    0x10(%ebp),%eax
  10059f:	89 10                	mov    %edx,(%eax)
            r = m - 1;
  1005a1:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1005a4:	48                   	dec    %eax
  1005a5:	89 45 f8             	mov    %eax,-0x8(%ebp)
  1005a8:	eb 11                	jmp    1005bb <stab_binsearch+0xf0>
        } else {
            // exact match for 'addr', but continue loop to find
            // *region_right
            *region_left = m;
  1005aa:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005ad:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1005b0:	89 10                	mov    %edx,(%eax)
            l = m;
  1005b2:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1005b5:	89 45 fc             	mov    %eax,-0x4(%ebp)
            addr ++;
  1005b8:	ff 45 18             	incl   0x18(%ebp)
    while (l <= r) {
  1005bb:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1005be:	3b 45 f8             	cmp    -0x8(%ebp),%eax
  1005c1:	0f 8e 2a ff ff ff    	jle    1004f1 <stab_binsearch+0x26>
        }
    }

    if (!any_matches) {
  1005c7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1005cb:	75 0f                	jne    1005dc <stab_binsearch+0x111>
        *region_right = *region_left - 1;
  1005cd:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005d0:	8b 00                	mov    (%eax),%eax
  1005d2:	8d 50 ff             	lea    -0x1(%eax),%edx
  1005d5:	8b 45 10             	mov    0x10(%ebp),%eax
  1005d8:	89 10                	mov    %edx,(%eax)
        l = *region_right;
        for (; l > *region_left && stabs[l].n_type != type; l --)
            /* do nothing */;
        *region_left = l;
    }
}
  1005da:	eb 3e                	jmp    10061a <stab_binsearch+0x14f>
        l = *region_right;
  1005dc:	8b 45 10             	mov    0x10(%ebp),%eax
  1005df:	8b 00                	mov    (%eax),%eax
  1005e1:	89 45 fc             	mov    %eax,-0x4(%ebp)
        for (; l > *region_left && stabs[l].n_type != type; l --)
  1005e4:	eb 03                	jmp    1005e9 <stab_binsearch+0x11e>
  1005e6:	ff 4d fc             	decl   -0x4(%ebp)
  1005e9:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005ec:	8b 00                	mov    (%eax),%eax
  1005ee:	39 45 fc             	cmp    %eax,-0x4(%ebp)
  1005f1:	7e 1f                	jle    100612 <stab_binsearch+0x147>
  1005f3:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1005f6:	89 d0                	mov    %edx,%eax
  1005f8:	01 c0                	add    %eax,%eax
  1005fa:	01 d0                	add    %edx,%eax
  1005fc:	c1 e0 02             	shl    $0x2,%eax
  1005ff:	89 c2                	mov    %eax,%edx
  100601:	8b 45 08             	mov    0x8(%ebp),%eax
  100604:	01 d0                	add    %edx,%eax
  100606:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10060a:	0f b6 c0             	movzbl %al,%eax
  10060d:	39 45 14             	cmp    %eax,0x14(%ebp)
  100610:	75 d4                	jne    1005e6 <stab_binsearch+0x11b>
        *region_left = l;
  100612:	8b 45 0c             	mov    0xc(%ebp),%eax
  100615:	8b 55 fc             	mov    -0x4(%ebp),%edx
  100618:	89 10                	mov    %edx,(%eax)
}
  10061a:	90                   	nop
  10061b:	c9                   	leave  
  10061c:	c3                   	ret    

0010061d <debuginfo_eip>:
 * the specified instruction address, @addr.  Returns 0 if information
 * was found, and negative if not.  But even if it returns negative it
 * has stored some information into '*info'.
 * */
int
debuginfo_eip(uintptr_t addr, struct eipdebuginfo *info) {
  10061d:	f3 0f 1e fb          	endbr32 
  100621:	55                   	push   %ebp
  100622:	89 e5                	mov    %esp,%ebp
  100624:	83 ec 58             	sub    $0x58,%esp
    const struct stab *stabs, *stab_end;
    const char *stabstr, *stabstr_end;

    info->eip_file = "<unknown>";
  100627:	8b 45 0c             	mov    0xc(%ebp),%eax
  10062a:	c7 00 f8 36 10 00    	movl   $0x1036f8,(%eax)
    info->eip_line = 0;
  100630:	8b 45 0c             	mov    0xc(%ebp),%eax
  100633:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    info->eip_fn_name = "<unknown>";
  10063a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10063d:	c7 40 08 f8 36 10 00 	movl   $0x1036f8,0x8(%eax)
    info->eip_fn_namelen = 9;
  100644:	8b 45 0c             	mov    0xc(%ebp),%eax
  100647:	c7 40 0c 09 00 00 00 	movl   $0x9,0xc(%eax)
    info->eip_fn_addr = addr;
  10064e:	8b 45 0c             	mov    0xc(%ebp),%eax
  100651:	8b 55 08             	mov    0x8(%ebp),%edx
  100654:	89 50 10             	mov    %edx,0x10(%eax)
    info->eip_fn_narg = 0;
  100657:	8b 45 0c             	mov    0xc(%ebp),%eax
  10065a:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)

    stabs = __STAB_BEGIN__;
  100661:	c7 45 f4 2c 3f 10 00 	movl   $0x103f2c,-0xc(%ebp)
    stab_end = __STAB_END__;
  100668:	c7 45 f0 d8 cb 10 00 	movl   $0x10cbd8,-0x10(%ebp)
    stabstr = __STABSTR_BEGIN__;
  10066f:	c7 45 ec d9 cb 10 00 	movl   $0x10cbd9,-0x14(%ebp)
    stabstr_end = __STABSTR_END__;
  100676:	c7 45 e8 c3 ec 10 00 	movl   $0x10ecc3,-0x18(%ebp)

    // String table validity checks
    if (stabstr_end <= stabstr || stabstr_end[-1] != 0) {
  10067d:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100680:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  100683:	76 0b                	jbe    100690 <debuginfo_eip+0x73>
  100685:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100688:	48                   	dec    %eax
  100689:	0f b6 00             	movzbl (%eax),%eax
  10068c:	84 c0                	test   %al,%al
  10068e:	74 0a                	je     10069a <debuginfo_eip+0x7d>
        return -1;
  100690:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100695:	e9 ab 02 00 00       	jmp    100945 <debuginfo_eip+0x328>
    // 'eip'.  First, we find the basic source file containing 'eip'.
    // Then, we look in that source file for the function.  Then we look
    // for the line number.

    // Search the entire set of stabs for the source file (type N_SO).
    int lfile = 0, rfile = (stab_end - stabs) - 1;
  10069a:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  1006a1:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1006a4:	2b 45 f4             	sub    -0xc(%ebp),%eax
  1006a7:	c1 f8 02             	sar    $0x2,%eax
  1006aa:	69 c0 ab aa aa aa    	imul   $0xaaaaaaab,%eax,%eax
  1006b0:	48                   	dec    %eax
  1006b1:	89 45 e0             	mov    %eax,-0x20(%ebp)
    stab_binsearch(stabs, &lfile, &rfile, N_SO, addr);
  1006b4:	8b 45 08             	mov    0x8(%ebp),%eax
  1006b7:	89 44 24 10          	mov    %eax,0x10(%esp)
  1006bb:	c7 44 24 0c 64 00 00 	movl   $0x64,0xc(%esp)
  1006c2:	00 
  1006c3:	8d 45 e0             	lea    -0x20(%ebp),%eax
  1006c6:	89 44 24 08          	mov    %eax,0x8(%esp)
  1006ca:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  1006cd:	89 44 24 04          	mov    %eax,0x4(%esp)
  1006d1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1006d4:	89 04 24             	mov    %eax,(%esp)
  1006d7:	e8 ef fd ff ff       	call   1004cb <stab_binsearch>
    if (lfile == 0)
  1006dc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1006df:	85 c0                	test   %eax,%eax
  1006e1:	75 0a                	jne    1006ed <debuginfo_eip+0xd0>
        return -1;
  1006e3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1006e8:	e9 58 02 00 00       	jmp    100945 <debuginfo_eip+0x328>

    // Search within that file's stabs for the function definition
    // (N_FUN).
    int lfun = lfile, rfun = rfile;
  1006ed:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1006f0:	89 45 dc             	mov    %eax,-0x24(%ebp)
  1006f3:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1006f6:	89 45 d8             	mov    %eax,-0x28(%ebp)
    int lline, rline;
    stab_binsearch(stabs, &lfun, &rfun, N_FUN, addr);
  1006f9:	8b 45 08             	mov    0x8(%ebp),%eax
  1006fc:	89 44 24 10          	mov    %eax,0x10(%esp)
  100700:	c7 44 24 0c 24 00 00 	movl   $0x24,0xc(%esp)
  100707:	00 
  100708:	8d 45 d8             	lea    -0x28(%ebp),%eax
  10070b:	89 44 24 08          	mov    %eax,0x8(%esp)
  10070f:	8d 45 dc             	lea    -0x24(%ebp),%eax
  100712:	89 44 24 04          	mov    %eax,0x4(%esp)
  100716:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100719:	89 04 24             	mov    %eax,(%esp)
  10071c:	e8 aa fd ff ff       	call   1004cb <stab_binsearch>

    if (lfun <= rfun) {
  100721:	8b 55 dc             	mov    -0x24(%ebp),%edx
  100724:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100727:	39 c2                	cmp    %eax,%edx
  100729:	7f 78                	jg     1007a3 <debuginfo_eip+0x186>
        // stabs[lfun] points to the function name
        // in the string table, but check bounds just in case.
        if (stabs[lfun].n_strx < stabstr_end - stabstr) {
  10072b:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10072e:	89 c2                	mov    %eax,%edx
  100730:	89 d0                	mov    %edx,%eax
  100732:	01 c0                	add    %eax,%eax
  100734:	01 d0                	add    %edx,%eax
  100736:	c1 e0 02             	shl    $0x2,%eax
  100739:	89 c2                	mov    %eax,%edx
  10073b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10073e:	01 d0                	add    %edx,%eax
  100740:	8b 10                	mov    (%eax),%edx
  100742:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100745:	2b 45 ec             	sub    -0x14(%ebp),%eax
  100748:	39 c2                	cmp    %eax,%edx
  10074a:	73 22                	jae    10076e <debuginfo_eip+0x151>
            info->eip_fn_name = stabstr + stabs[lfun].n_strx;
  10074c:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10074f:	89 c2                	mov    %eax,%edx
  100751:	89 d0                	mov    %edx,%eax
  100753:	01 c0                	add    %eax,%eax
  100755:	01 d0                	add    %edx,%eax
  100757:	c1 e0 02             	shl    $0x2,%eax
  10075a:	89 c2                	mov    %eax,%edx
  10075c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10075f:	01 d0                	add    %edx,%eax
  100761:	8b 10                	mov    (%eax),%edx
  100763:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100766:	01 c2                	add    %eax,%edx
  100768:	8b 45 0c             	mov    0xc(%ebp),%eax
  10076b:	89 50 08             	mov    %edx,0x8(%eax)
        }
        info->eip_fn_addr = stabs[lfun].n_value;
  10076e:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100771:	89 c2                	mov    %eax,%edx
  100773:	89 d0                	mov    %edx,%eax
  100775:	01 c0                	add    %eax,%eax
  100777:	01 d0                	add    %edx,%eax
  100779:	c1 e0 02             	shl    $0x2,%eax
  10077c:	89 c2                	mov    %eax,%edx
  10077e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100781:	01 d0                	add    %edx,%eax
  100783:	8b 50 08             	mov    0x8(%eax),%edx
  100786:	8b 45 0c             	mov    0xc(%ebp),%eax
  100789:	89 50 10             	mov    %edx,0x10(%eax)
        addr -= info->eip_fn_addr;
  10078c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10078f:	8b 40 10             	mov    0x10(%eax),%eax
  100792:	29 45 08             	sub    %eax,0x8(%ebp)
        // Search within the function definition for the line number.
        lline = lfun;
  100795:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100798:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfun;
  10079b:	8b 45 d8             	mov    -0x28(%ebp),%eax
  10079e:	89 45 d0             	mov    %eax,-0x30(%ebp)
  1007a1:	eb 15                	jmp    1007b8 <debuginfo_eip+0x19b>
    } else {
        // Couldn't find function stab!  Maybe we're in an assembly
        // file.  Search the whole file for the line number.
        info->eip_fn_addr = addr;
  1007a3:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007a6:	8b 55 08             	mov    0x8(%ebp),%edx
  1007a9:	89 50 10             	mov    %edx,0x10(%eax)
        lline = lfile;
  1007ac:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1007af:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfile;
  1007b2:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1007b5:	89 45 d0             	mov    %eax,-0x30(%ebp)
    }
    info->eip_fn_namelen = strfind(info->eip_fn_name, ':') - info->eip_fn_name;
  1007b8:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007bb:	8b 40 08             	mov    0x8(%eax),%eax
  1007be:	c7 44 24 04 3a 00 00 	movl   $0x3a,0x4(%esp)
  1007c5:	00 
  1007c6:	89 04 24             	mov    %eax,(%esp)
  1007c9:	e8 7e 24 00 00       	call   102c4c <strfind>
  1007ce:	8b 55 0c             	mov    0xc(%ebp),%edx
  1007d1:	8b 52 08             	mov    0x8(%edx),%edx
  1007d4:	29 d0                	sub    %edx,%eax
  1007d6:	89 c2                	mov    %eax,%edx
  1007d8:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007db:	89 50 0c             	mov    %edx,0xc(%eax)

    // Search within [lline, rline] for the line number stab.
    // If found, set info->eip_line to the right line number.
    // If not found, return -1.
    stab_binsearch(stabs, &lline, &rline, N_SLINE, addr);
  1007de:	8b 45 08             	mov    0x8(%ebp),%eax
  1007e1:	89 44 24 10          	mov    %eax,0x10(%esp)
  1007e5:	c7 44 24 0c 44 00 00 	movl   $0x44,0xc(%esp)
  1007ec:	00 
  1007ed:	8d 45 d0             	lea    -0x30(%ebp),%eax
  1007f0:	89 44 24 08          	mov    %eax,0x8(%esp)
  1007f4:	8d 45 d4             	lea    -0x2c(%ebp),%eax
  1007f7:	89 44 24 04          	mov    %eax,0x4(%esp)
  1007fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1007fe:	89 04 24             	mov    %eax,(%esp)
  100801:	e8 c5 fc ff ff       	call   1004cb <stab_binsearch>
    if (lline <= rline) {
  100806:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  100809:	8b 45 d0             	mov    -0x30(%ebp),%eax
  10080c:	39 c2                	cmp    %eax,%edx
  10080e:	7f 23                	jg     100833 <debuginfo_eip+0x216>
        info->eip_line = stabs[rline].n_desc;
  100810:	8b 45 d0             	mov    -0x30(%ebp),%eax
  100813:	89 c2                	mov    %eax,%edx
  100815:	89 d0                	mov    %edx,%eax
  100817:	01 c0                	add    %eax,%eax
  100819:	01 d0                	add    %edx,%eax
  10081b:	c1 e0 02             	shl    $0x2,%eax
  10081e:	89 c2                	mov    %eax,%edx
  100820:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100823:	01 d0                	add    %edx,%eax
  100825:	0f b7 40 06          	movzwl 0x6(%eax),%eax
  100829:	89 c2                	mov    %eax,%edx
  10082b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10082e:	89 50 04             	mov    %edx,0x4(%eax)

    // Search backwards from the line number for the relevant filename stab.
    // We can't just use the "lfile" stab because inlined functions
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
  100831:	eb 11                	jmp    100844 <debuginfo_eip+0x227>
        return -1;
  100833:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100838:	e9 08 01 00 00       	jmp    100945 <debuginfo_eip+0x328>
           && stabs[lline].n_type != N_SOL
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
        lline --;
  10083d:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100840:	48                   	dec    %eax
  100841:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    while (lline >= lfile
  100844:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  100847:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  10084a:	39 c2                	cmp    %eax,%edx
  10084c:	7c 56                	jl     1008a4 <debuginfo_eip+0x287>
           && stabs[lline].n_type != N_SOL
  10084e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100851:	89 c2                	mov    %eax,%edx
  100853:	89 d0                	mov    %edx,%eax
  100855:	01 c0                	add    %eax,%eax
  100857:	01 d0                	add    %edx,%eax
  100859:	c1 e0 02             	shl    $0x2,%eax
  10085c:	89 c2                	mov    %eax,%edx
  10085e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100861:	01 d0                	add    %edx,%eax
  100863:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100867:	3c 84                	cmp    $0x84,%al
  100869:	74 39                	je     1008a4 <debuginfo_eip+0x287>
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
  10086b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10086e:	89 c2                	mov    %eax,%edx
  100870:	89 d0                	mov    %edx,%eax
  100872:	01 c0                	add    %eax,%eax
  100874:	01 d0                	add    %edx,%eax
  100876:	c1 e0 02             	shl    $0x2,%eax
  100879:	89 c2                	mov    %eax,%edx
  10087b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10087e:	01 d0                	add    %edx,%eax
  100880:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100884:	3c 64                	cmp    $0x64,%al
  100886:	75 b5                	jne    10083d <debuginfo_eip+0x220>
  100888:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10088b:	89 c2                	mov    %eax,%edx
  10088d:	89 d0                	mov    %edx,%eax
  10088f:	01 c0                	add    %eax,%eax
  100891:	01 d0                	add    %edx,%eax
  100893:	c1 e0 02             	shl    $0x2,%eax
  100896:	89 c2                	mov    %eax,%edx
  100898:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10089b:	01 d0                	add    %edx,%eax
  10089d:	8b 40 08             	mov    0x8(%eax),%eax
  1008a0:	85 c0                	test   %eax,%eax
  1008a2:	74 99                	je     10083d <debuginfo_eip+0x220>
    }
    if (lline >= lfile && stabs[lline].n_strx < stabstr_end - stabstr) {
  1008a4:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1008a7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1008aa:	39 c2                	cmp    %eax,%edx
  1008ac:	7c 42                	jl     1008f0 <debuginfo_eip+0x2d3>
  1008ae:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1008b1:	89 c2                	mov    %eax,%edx
  1008b3:	89 d0                	mov    %edx,%eax
  1008b5:	01 c0                	add    %eax,%eax
  1008b7:	01 d0                	add    %edx,%eax
  1008b9:	c1 e0 02             	shl    $0x2,%eax
  1008bc:	89 c2                	mov    %eax,%edx
  1008be:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1008c1:	01 d0                	add    %edx,%eax
  1008c3:	8b 10                	mov    (%eax),%edx
  1008c5:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1008c8:	2b 45 ec             	sub    -0x14(%ebp),%eax
  1008cb:	39 c2                	cmp    %eax,%edx
  1008cd:	73 21                	jae    1008f0 <debuginfo_eip+0x2d3>
        info->eip_file = stabstr + stabs[lline].n_strx;
  1008cf:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1008d2:	89 c2                	mov    %eax,%edx
  1008d4:	89 d0                	mov    %edx,%eax
  1008d6:	01 c0                	add    %eax,%eax
  1008d8:	01 d0                	add    %edx,%eax
  1008da:	c1 e0 02             	shl    $0x2,%eax
  1008dd:	89 c2                	mov    %eax,%edx
  1008df:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1008e2:	01 d0                	add    %edx,%eax
  1008e4:	8b 10                	mov    (%eax),%edx
  1008e6:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1008e9:	01 c2                	add    %eax,%edx
  1008eb:	8b 45 0c             	mov    0xc(%ebp),%eax
  1008ee:	89 10                	mov    %edx,(%eax)
    }

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
  1008f0:	8b 55 dc             	mov    -0x24(%ebp),%edx
  1008f3:	8b 45 d8             	mov    -0x28(%ebp),%eax
  1008f6:	39 c2                	cmp    %eax,%edx
  1008f8:	7d 46                	jge    100940 <debuginfo_eip+0x323>
        for (lline = lfun + 1;
  1008fa:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1008fd:	40                   	inc    %eax
  1008fe:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  100901:	eb 16                	jmp    100919 <debuginfo_eip+0x2fc>
             lline < rfun && stabs[lline].n_type == N_PSYM;
             lline ++) {
            info->eip_fn_narg ++;
  100903:	8b 45 0c             	mov    0xc(%ebp),%eax
  100906:	8b 40 14             	mov    0x14(%eax),%eax
  100909:	8d 50 01             	lea    0x1(%eax),%edx
  10090c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10090f:	89 50 14             	mov    %edx,0x14(%eax)
             lline ++) {
  100912:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100915:	40                   	inc    %eax
  100916:	89 45 d4             	mov    %eax,-0x2c(%ebp)
             lline < rfun && stabs[lline].n_type == N_PSYM;
  100919:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10091c:	8b 45 d8             	mov    -0x28(%ebp),%eax
        for (lline = lfun + 1;
  10091f:	39 c2                	cmp    %eax,%edx
  100921:	7d 1d                	jge    100940 <debuginfo_eip+0x323>
             lline < rfun && stabs[lline].n_type == N_PSYM;
  100923:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100926:	89 c2                	mov    %eax,%edx
  100928:	89 d0                	mov    %edx,%eax
  10092a:	01 c0                	add    %eax,%eax
  10092c:	01 d0                	add    %edx,%eax
  10092e:	c1 e0 02             	shl    $0x2,%eax
  100931:	89 c2                	mov    %eax,%edx
  100933:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100936:	01 d0                	add    %edx,%eax
  100938:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10093c:	3c a0                	cmp    $0xa0,%al
  10093e:	74 c3                	je     100903 <debuginfo_eip+0x2e6>
        }
    }
    return 0;
  100940:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100945:	c9                   	leave  
  100946:	c3                   	ret    

00100947 <print_kerninfo>:
 * print_kerninfo - print the information about kernel, including the location
 * of kernel entry, the start addresses of data and text segements, the start
 * address of free memory and how many memory that kernel has used.
 * */
void
print_kerninfo(void) {
  100947:	f3 0f 1e fb          	endbr32 
  10094b:	55                   	push   %ebp
  10094c:	89 e5                	mov    %esp,%ebp
  10094e:	83 ec 18             	sub    $0x18,%esp
    extern char etext[], edata[], end[], kern_init[];
    cprintf("Special kernel symbols:\n");
  100951:	c7 04 24 02 37 10 00 	movl   $0x103702,(%esp)
  100958:	e8 27 f9 ff ff       	call   100284 <cprintf>
    cprintf("  entry  0x%08x (phys)\n", kern_init);
  10095d:	c7 44 24 04 00 00 10 	movl   $0x100000,0x4(%esp)
  100964:	00 
  100965:	c7 04 24 1b 37 10 00 	movl   $0x10371b,(%esp)
  10096c:	e8 13 f9 ff ff       	call   100284 <cprintf>
    cprintf("  etext  0x%08x (phys)\n", etext);
  100971:	c7 44 24 04 fc 35 10 	movl   $0x1035fc,0x4(%esp)
  100978:	00 
  100979:	c7 04 24 33 37 10 00 	movl   $0x103733,(%esp)
  100980:	e8 ff f8 ff ff       	call   100284 <cprintf>
    cprintf("  edata  0x%08x (phys)\n", edata);
  100985:	c7 44 24 04 16 fa 10 	movl   $0x10fa16,0x4(%esp)
  10098c:	00 
  10098d:	c7 04 24 4b 37 10 00 	movl   $0x10374b,(%esp)
  100994:	e8 eb f8 ff ff       	call   100284 <cprintf>
    cprintf("  end    0x%08x (phys)\n", end);
  100999:	c7 44 24 04 20 0d 11 	movl   $0x110d20,0x4(%esp)
  1009a0:	00 
  1009a1:	c7 04 24 63 37 10 00 	movl   $0x103763,(%esp)
  1009a8:	e8 d7 f8 ff ff       	call   100284 <cprintf>
    cprintf("Kernel executable memory footprint: %dKB\n", (end - kern_init + 1023)/1024);
  1009ad:	b8 20 0d 11 00       	mov    $0x110d20,%eax
  1009b2:	2d 00 00 10 00       	sub    $0x100000,%eax
  1009b7:	05 ff 03 00 00       	add    $0x3ff,%eax
  1009bc:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  1009c2:	85 c0                	test   %eax,%eax
  1009c4:	0f 48 c2             	cmovs  %edx,%eax
  1009c7:	c1 f8 0a             	sar    $0xa,%eax
  1009ca:	89 44 24 04          	mov    %eax,0x4(%esp)
  1009ce:	c7 04 24 7c 37 10 00 	movl   $0x10377c,(%esp)
  1009d5:	e8 aa f8 ff ff       	call   100284 <cprintf>
}
  1009da:	90                   	nop
  1009db:	c9                   	leave  
  1009dc:	c3                   	ret    

001009dd <print_debuginfo>:
/* *
 * print_debuginfo - read and print the stat information for the address @eip,
 * and info.eip_fn_addr should be the first address of the related function.
 * */
void
print_debuginfo(uintptr_t eip) {
  1009dd:	f3 0f 1e fb          	endbr32 
  1009e1:	55                   	push   %ebp
  1009e2:	89 e5                	mov    %esp,%ebp
  1009e4:	81 ec 48 01 00 00    	sub    $0x148,%esp
    struct eipdebuginfo info;
    if (debuginfo_eip(eip, &info) != 0) {
  1009ea:	8d 45 dc             	lea    -0x24(%ebp),%eax
  1009ed:	89 44 24 04          	mov    %eax,0x4(%esp)
  1009f1:	8b 45 08             	mov    0x8(%ebp),%eax
  1009f4:	89 04 24             	mov    %eax,(%esp)
  1009f7:	e8 21 fc ff ff       	call   10061d <debuginfo_eip>
  1009fc:	85 c0                	test   %eax,%eax
  1009fe:	74 15                	je     100a15 <print_debuginfo+0x38>
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
  100a00:	8b 45 08             	mov    0x8(%ebp),%eax
  100a03:	89 44 24 04          	mov    %eax,0x4(%esp)
  100a07:	c7 04 24 a6 37 10 00 	movl   $0x1037a6,(%esp)
  100a0e:	e8 71 f8 ff ff       	call   100284 <cprintf>
        }
        fnname[j] = '\0';
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
                fnname, eip - info.eip_fn_addr);
    }
}
  100a13:	eb 6c                	jmp    100a81 <print_debuginfo+0xa4>
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  100a15:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100a1c:	eb 1b                	jmp    100a39 <print_debuginfo+0x5c>
            fnname[j] = info.eip_fn_name[j];
  100a1e:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  100a21:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a24:	01 d0                	add    %edx,%eax
  100a26:	0f b6 10             	movzbl (%eax),%edx
  100a29:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  100a2f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a32:	01 c8                	add    %ecx,%eax
  100a34:	88 10                	mov    %dl,(%eax)
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  100a36:	ff 45 f4             	incl   -0xc(%ebp)
  100a39:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100a3c:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  100a3f:	7c dd                	jl     100a1e <print_debuginfo+0x41>
        fnname[j] = '\0';
  100a41:	8d 95 dc fe ff ff    	lea    -0x124(%ebp),%edx
  100a47:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a4a:	01 d0                	add    %edx,%eax
  100a4c:	c6 00 00             	movb   $0x0,(%eax)
                fnname, eip - info.eip_fn_addr);
  100a4f:	8b 45 ec             	mov    -0x14(%ebp),%eax
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
  100a52:	8b 55 08             	mov    0x8(%ebp),%edx
  100a55:	89 d1                	mov    %edx,%ecx
  100a57:	29 c1                	sub    %eax,%ecx
  100a59:	8b 55 e0             	mov    -0x20(%ebp),%edx
  100a5c:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100a5f:	89 4c 24 10          	mov    %ecx,0x10(%esp)
  100a63:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  100a69:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
  100a6d:	89 54 24 08          	mov    %edx,0x8(%esp)
  100a71:	89 44 24 04          	mov    %eax,0x4(%esp)
  100a75:	c7 04 24 c2 37 10 00 	movl   $0x1037c2,(%esp)
  100a7c:	e8 03 f8 ff ff       	call   100284 <cprintf>
}
  100a81:	90                   	nop
  100a82:	c9                   	leave  
  100a83:	c3                   	ret    

00100a84 <read_eip>:

static __noinline uint32_t
read_eip(void) {
  100a84:	f3 0f 1e fb          	endbr32 
  100a88:	55                   	push   %ebp
  100a89:	89 e5                	mov    %esp,%ebp
  100a8b:	83 ec 10             	sub    $0x10,%esp
    uint32_t eip;
    asm volatile("movl 4(%%ebp), %0" : "=r" (eip));
  100a8e:	8b 45 04             	mov    0x4(%ebp),%eax
  100a91:	89 45 fc             	mov    %eax,-0x4(%ebp)
    return eip;
  100a94:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  100a97:	c9                   	leave  
  100a98:	c3                   	ret    

00100a99 <print_stackframe>:
 *
 * Note that, the length of ebp-chain is limited. In boot/bootasm.S, before jumping
 * to the kernel entry, the value of ebp has been set to zero, that's the boundary.
 * */
void
print_stackframe(void) {
  100a99:	f3 0f 1e fb          	endbr32 
  100a9d:	55                   	push   %ebp
  100a9e:	89 e5                	mov    %esp,%ebp
  100aa0:	83 ec 38             	sub    $0x38,%esp
}

static inline uint32_t
read_ebp(void) {
    uint32_t ebp;
    asm volatile ("movl %%ebp, %0" : "=r" (ebp));
  100aa3:	89 e8                	mov    %ebp,%eax
  100aa5:	89 45 e0             	mov    %eax,-0x20(%ebp)
    return ebp;
  100aa8:	8b 45 e0             	mov    -0x20(%ebp),%eax
      *    (3.4) call print_debuginfo(eip-1) to print the C calling function name and line number, etc.
      *    (3.5) popup a calling stackframe
      *           NOTICE: the calling funciton's return addr eip  = ss:[ebp+4]
      *                   the calling funciton's ebp = ss:[ebp]
      */
    uint32_t ebp = read_ebp();
  100aab:	89 45 f4             	mov    %eax,-0xc(%ebp)
    uint32_t eip = read_eip();
  100aae:	e8 d1 ff ff ff       	call   100a84 <read_eip>
  100ab3:	89 45 f0             	mov    %eax,-0x10(%ebp)

    int i, j;
    for (i = 0; ebp != 0 && i < STACKFRAME_DEPTH; i ++) {
  100ab6:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  100abd:	e9 84 00 00 00       	jmp    100b46 <print_stackframe+0xad>
        cprintf("ebp:0x%08x eip:0x%08x args:", ebp, eip);
  100ac2:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100ac5:	89 44 24 08          	mov    %eax,0x8(%esp)
  100ac9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100acc:	89 44 24 04          	mov    %eax,0x4(%esp)
  100ad0:	c7 04 24 d4 37 10 00 	movl   $0x1037d4,(%esp)
  100ad7:	e8 a8 f7 ff ff       	call   100284 <cprintf>
        uint32_t *args = (uint32_t *)ebp + 2;
  100adc:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100adf:	83 c0 08             	add    $0x8,%eax
  100ae2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        for (j = 0; j < 4; j ++) {
  100ae5:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  100aec:	eb 24                	jmp    100b12 <print_stackframe+0x79>
            cprintf("0x%08x ", args[j]);
  100aee:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100af1:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100af8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100afb:	01 d0                	add    %edx,%eax
  100afd:	8b 00                	mov    (%eax),%eax
  100aff:	89 44 24 04          	mov    %eax,0x4(%esp)
  100b03:	c7 04 24 f0 37 10 00 	movl   $0x1037f0,(%esp)
  100b0a:	e8 75 f7 ff ff       	call   100284 <cprintf>
        for (j = 0; j < 4; j ++) {
  100b0f:	ff 45 e8             	incl   -0x18(%ebp)
  100b12:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
  100b16:	7e d6                	jle    100aee <print_stackframe+0x55>
        }
        cprintf("\n");
  100b18:	c7 04 24 f8 37 10 00 	movl   $0x1037f8,(%esp)
  100b1f:	e8 60 f7 ff ff       	call   100284 <cprintf>
        print_debuginfo(eip - 1);
  100b24:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100b27:	48                   	dec    %eax
  100b28:	89 04 24             	mov    %eax,(%esp)
  100b2b:	e8 ad fe ff ff       	call   1009dd <print_debuginfo>
        eip = *(((uint32_t *)ebp) + 4);
  100b30:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b33:	83 c0 10             	add    $0x10,%eax
  100b36:	8b 00                	mov    (%eax),%eax
  100b38:	89 45 f0             	mov    %eax,-0x10(%ebp)
        ebp = *((uint32_t *)ebp);
  100b3b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b3e:	8b 00                	mov    (%eax),%eax
  100b40:	89 45 f4             	mov    %eax,-0xc(%ebp)
    for (i = 0; ebp != 0 && i < STACKFRAME_DEPTH; i ++) {
  100b43:	ff 45 ec             	incl   -0x14(%ebp)
  100b46:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100b4a:	74 0a                	je     100b56 <print_stackframe+0xbd>
  100b4c:	83 7d ec 13          	cmpl   $0x13,-0x14(%ebp)
  100b50:	0f 8e 6c ff ff ff    	jle    100ac2 <print_stackframe+0x29>
    }
}
  100b56:	90                   	nop
  100b57:	c9                   	leave  
  100b58:	c3                   	ret    

00100b59 <parse>:
#define MAXARGS         16
#define WHITESPACE      " \t\n\r"

/* parse - parse the command buffer into whitespace-separated arguments */
static int
parse(char *buf, char **argv) {
  100b59:	f3 0f 1e fb          	endbr32 
  100b5d:	55                   	push   %ebp
  100b5e:	89 e5                	mov    %esp,%ebp
  100b60:	83 ec 28             	sub    $0x28,%esp
    int argc = 0;
  100b63:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100b6a:	eb 0c                	jmp    100b78 <parse+0x1f>
            *buf ++ = '\0';
  100b6c:	8b 45 08             	mov    0x8(%ebp),%eax
  100b6f:	8d 50 01             	lea    0x1(%eax),%edx
  100b72:	89 55 08             	mov    %edx,0x8(%ebp)
  100b75:	c6 00 00             	movb   $0x0,(%eax)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100b78:	8b 45 08             	mov    0x8(%ebp),%eax
  100b7b:	0f b6 00             	movzbl (%eax),%eax
  100b7e:	84 c0                	test   %al,%al
  100b80:	74 1d                	je     100b9f <parse+0x46>
  100b82:	8b 45 08             	mov    0x8(%ebp),%eax
  100b85:	0f b6 00             	movzbl (%eax),%eax
  100b88:	0f be c0             	movsbl %al,%eax
  100b8b:	89 44 24 04          	mov    %eax,0x4(%esp)
  100b8f:	c7 04 24 7c 38 10 00 	movl   $0x10387c,(%esp)
  100b96:	e8 7b 20 00 00       	call   102c16 <strchr>
  100b9b:	85 c0                	test   %eax,%eax
  100b9d:	75 cd                	jne    100b6c <parse+0x13>
        }
        if (*buf == '\0') {
  100b9f:	8b 45 08             	mov    0x8(%ebp),%eax
  100ba2:	0f b6 00             	movzbl (%eax),%eax
  100ba5:	84 c0                	test   %al,%al
  100ba7:	74 65                	je     100c0e <parse+0xb5>
            break;
        }

        // save and scan past next arg
        if (argc == MAXARGS - 1) {
  100ba9:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
  100bad:	75 14                	jne    100bc3 <parse+0x6a>
            cprintf("Too many arguments (max %d).\n", MAXARGS);
  100baf:	c7 44 24 04 10 00 00 	movl   $0x10,0x4(%esp)
  100bb6:	00 
  100bb7:	c7 04 24 81 38 10 00 	movl   $0x103881,(%esp)
  100bbe:	e8 c1 f6 ff ff       	call   100284 <cprintf>
        }
        argv[argc ++] = buf;
  100bc3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100bc6:	8d 50 01             	lea    0x1(%eax),%edx
  100bc9:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100bcc:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100bd3:	8b 45 0c             	mov    0xc(%ebp),%eax
  100bd6:	01 c2                	add    %eax,%edx
  100bd8:	8b 45 08             	mov    0x8(%ebp),%eax
  100bdb:	89 02                	mov    %eax,(%edx)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100bdd:	eb 03                	jmp    100be2 <parse+0x89>
            buf ++;
  100bdf:	ff 45 08             	incl   0x8(%ebp)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100be2:	8b 45 08             	mov    0x8(%ebp),%eax
  100be5:	0f b6 00             	movzbl (%eax),%eax
  100be8:	84 c0                	test   %al,%al
  100bea:	74 8c                	je     100b78 <parse+0x1f>
  100bec:	8b 45 08             	mov    0x8(%ebp),%eax
  100bef:	0f b6 00             	movzbl (%eax),%eax
  100bf2:	0f be c0             	movsbl %al,%eax
  100bf5:	89 44 24 04          	mov    %eax,0x4(%esp)
  100bf9:	c7 04 24 7c 38 10 00 	movl   $0x10387c,(%esp)
  100c00:	e8 11 20 00 00       	call   102c16 <strchr>
  100c05:	85 c0                	test   %eax,%eax
  100c07:	74 d6                	je     100bdf <parse+0x86>
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100c09:	e9 6a ff ff ff       	jmp    100b78 <parse+0x1f>
            break;
  100c0e:	90                   	nop
        }
    }
    return argc;
  100c0f:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100c12:	c9                   	leave  
  100c13:	c3                   	ret    

00100c14 <runcmd>:
/* *
 * runcmd - parse the input string, split it into separated arguments
 * and then lookup and invoke some related commands/
 * */
static int
runcmd(char *buf, struct trapframe *tf) {
  100c14:	f3 0f 1e fb          	endbr32 
  100c18:	55                   	push   %ebp
  100c19:	89 e5                	mov    %esp,%ebp
  100c1b:	53                   	push   %ebx
  100c1c:	83 ec 64             	sub    $0x64,%esp
    char *argv[MAXARGS];
    int argc = parse(buf, argv);
  100c1f:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100c22:	89 44 24 04          	mov    %eax,0x4(%esp)
  100c26:	8b 45 08             	mov    0x8(%ebp),%eax
  100c29:	89 04 24             	mov    %eax,(%esp)
  100c2c:	e8 28 ff ff ff       	call   100b59 <parse>
  100c31:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if (argc == 0) {
  100c34:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100c38:	75 0a                	jne    100c44 <runcmd+0x30>
        return 0;
  100c3a:	b8 00 00 00 00       	mov    $0x0,%eax
  100c3f:	e9 83 00 00 00       	jmp    100cc7 <runcmd+0xb3>
    }
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100c44:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100c4b:	eb 5a                	jmp    100ca7 <runcmd+0x93>
        if (strcmp(commands[i].name, argv[0]) == 0) {
  100c4d:	8b 4d b0             	mov    -0x50(%ebp),%ecx
  100c50:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100c53:	89 d0                	mov    %edx,%eax
  100c55:	01 c0                	add    %eax,%eax
  100c57:	01 d0                	add    %edx,%eax
  100c59:	c1 e0 02             	shl    $0x2,%eax
  100c5c:	05 00 f0 10 00       	add    $0x10f000,%eax
  100c61:	8b 00                	mov    (%eax),%eax
  100c63:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  100c67:	89 04 24             	mov    %eax,(%esp)
  100c6a:	e8 03 1f 00 00       	call   102b72 <strcmp>
  100c6f:	85 c0                	test   %eax,%eax
  100c71:	75 31                	jne    100ca4 <runcmd+0x90>
            return commands[i].func(argc - 1, argv + 1, tf);
  100c73:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100c76:	89 d0                	mov    %edx,%eax
  100c78:	01 c0                	add    %eax,%eax
  100c7a:	01 d0                	add    %edx,%eax
  100c7c:	c1 e0 02             	shl    $0x2,%eax
  100c7f:	05 08 f0 10 00       	add    $0x10f008,%eax
  100c84:	8b 10                	mov    (%eax),%edx
  100c86:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100c89:	83 c0 04             	add    $0x4,%eax
  100c8c:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  100c8f:	8d 59 ff             	lea    -0x1(%ecx),%ebx
  100c92:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  100c95:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  100c99:	89 44 24 04          	mov    %eax,0x4(%esp)
  100c9d:	89 1c 24             	mov    %ebx,(%esp)
  100ca0:	ff d2                	call   *%edx
  100ca2:	eb 23                	jmp    100cc7 <runcmd+0xb3>
    for (i = 0; i < NCOMMANDS; i ++) {
  100ca4:	ff 45 f4             	incl   -0xc(%ebp)
  100ca7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100caa:	83 f8 02             	cmp    $0x2,%eax
  100cad:	76 9e                	jbe    100c4d <runcmd+0x39>
        }
    }
    cprintf("Unknown command '%s'\n", argv[0]);
  100caf:	8b 45 b0             	mov    -0x50(%ebp),%eax
  100cb2:	89 44 24 04          	mov    %eax,0x4(%esp)
  100cb6:	c7 04 24 9f 38 10 00 	movl   $0x10389f,(%esp)
  100cbd:	e8 c2 f5 ff ff       	call   100284 <cprintf>
    return 0;
  100cc2:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100cc7:	83 c4 64             	add    $0x64,%esp
  100cca:	5b                   	pop    %ebx
  100ccb:	5d                   	pop    %ebp
  100ccc:	c3                   	ret    

00100ccd <kmonitor>:

/***** Implementations of basic kernel monitor commands *****/

void
kmonitor(struct trapframe *tf) {
  100ccd:	f3 0f 1e fb          	endbr32 
  100cd1:	55                   	push   %ebp
  100cd2:	89 e5                	mov    %esp,%ebp
  100cd4:	83 ec 28             	sub    $0x28,%esp
    cprintf("Welcome to the kernel debug monitor!!\n");
  100cd7:	c7 04 24 b8 38 10 00 	movl   $0x1038b8,(%esp)
  100cde:	e8 a1 f5 ff ff       	call   100284 <cprintf>
    cprintf("Type 'help' for a list of commands.\n");
  100ce3:	c7 04 24 e0 38 10 00 	movl   $0x1038e0,(%esp)
  100cea:	e8 95 f5 ff ff       	call   100284 <cprintf>

    if (tf != NULL) {
  100cef:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100cf3:	74 0b                	je     100d00 <kmonitor+0x33>
        print_trapframe(tf);
  100cf5:	8b 45 08             	mov    0x8(%ebp),%eax
  100cf8:	89 04 24             	mov    %eax,(%esp)
  100cfb:	e8 fb 0d 00 00       	call   101afb <print_trapframe>
    }

    char *buf;
    while (1) {
        if ((buf = readline("K> ")) != NULL) {
  100d00:	c7 04 24 05 39 10 00 	movl   $0x103905,(%esp)
  100d07:	e8 2b f6 ff ff       	call   100337 <readline>
  100d0c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100d0f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100d13:	74 eb                	je     100d00 <kmonitor+0x33>
            if (runcmd(buf, tf) < 0) {
  100d15:	8b 45 08             	mov    0x8(%ebp),%eax
  100d18:	89 44 24 04          	mov    %eax,0x4(%esp)
  100d1c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d1f:	89 04 24             	mov    %eax,(%esp)
  100d22:	e8 ed fe ff ff       	call   100c14 <runcmd>
  100d27:	85 c0                	test   %eax,%eax
  100d29:	78 02                	js     100d2d <kmonitor+0x60>
        if ((buf = readline("K> ")) != NULL) {
  100d2b:	eb d3                	jmp    100d00 <kmonitor+0x33>
                break;
  100d2d:	90                   	nop
            }
        }
    }
}
  100d2e:	90                   	nop
  100d2f:	c9                   	leave  
  100d30:	c3                   	ret    

00100d31 <mon_help>:

/* mon_help - print the information about mon_* functions */
int
mon_help(int argc, char **argv, struct trapframe *tf) {
  100d31:	f3 0f 1e fb          	endbr32 
  100d35:	55                   	push   %ebp
  100d36:	89 e5                	mov    %esp,%ebp
  100d38:	83 ec 28             	sub    $0x28,%esp
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100d3b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100d42:	eb 3d                	jmp    100d81 <mon_help+0x50>
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
  100d44:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100d47:	89 d0                	mov    %edx,%eax
  100d49:	01 c0                	add    %eax,%eax
  100d4b:	01 d0                	add    %edx,%eax
  100d4d:	c1 e0 02             	shl    $0x2,%eax
  100d50:	05 04 f0 10 00       	add    $0x10f004,%eax
  100d55:	8b 08                	mov    (%eax),%ecx
  100d57:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100d5a:	89 d0                	mov    %edx,%eax
  100d5c:	01 c0                	add    %eax,%eax
  100d5e:	01 d0                	add    %edx,%eax
  100d60:	c1 e0 02             	shl    $0x2,%eax
  100d63:	05 00 f0 10 00       	add    $0x10f000,%eax
  100d68:	8b 00                	mov    (%eax),%eax
  100d6a:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  100d6e:	89 44 24 04          	mov    %eax,0x4(%esp)
  100d72:	c7 04 24 09 39 10 00 	movl   $0x103909,(%esp)
  100d79:	e8 06 f5 ff ff       	call   100284 <cprintf>
    for (i = 0; i < NCOMMANDS; i ++) {
  100d7e:	ff 45 f4             	incl   -0xc(%ebp)
  100d81:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d84:	83 f8 02             	cmp    $0x2,%eax
  100d87:	76 bb                	jbe    100d44 <mon_help+0x13>
    }
    return 0;
  100d89:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100d8e:	c9                   	leave  
  100d8f:	c3                   	ret    

00100d90 <mon_kerninfo>:
/* *
 * mon_kerninfo - call print_kerninfo in kern/debug/kdebug.c to
 * print the memory occupancy in kernel.
 * */
int
mon_kerninfo(int argc, char **argv, struct trapframe *tf) {
  100d90:	f3 0f 1e fb          	endbr32 
  100d94:	55                   	push   %ebp
  100d95:	89 e5                	mov    %esp,%ebp
  100d97:	83 ec 08             	sub    $0x8,%esp
    print_kerninfo();
  100d9a:	e8 a8 fb ff ff       	call   100947 <print_kerninfo>
    return 0;
  100d9f:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100da4:	c9                   	leave  
  100da5:	c3                   	ret    

00100da6 <mon_backtrace>:
/* *
 * mon_backtrace - call print_stackframe in kern/debug/kdebug.c to
 * print a backtrace of the stack.
 * */
int
mon_backtrace(int argc, char **argv, struct trapframe *tf) {
  100da6:	f3 0f 1e fb          	endbr32 
  100daa:	55                   	push   %ebp
  100dab:	89 e5                	mov    %esp,%ebp
  100dad:	83 ec 08             	sub    $0x8,%esp
    print_stackframe();
  100db0:	e8 e4 fc ff ff       	call   100a99 <print_stackframe>
    return 0;
  100db5:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100dba:	c9                   	leave  
  100dbb:	c3                   	ret    

00100dbc <clock_init>:
/* *
 * clock_init - initialize 8253 clock to interrupt 100 times per second,
 * and then enable IRQ_TIMER.
 * */
void
clock_init(void) {
  100dbc:	f3 0f 1e fb          	endbr32 
  100dc0:	55                   	push   %ebp
  100dc1:	89 e5                	mov    %esp,%ebp
  100dc3:	83 ec 28             	sub    $0x28,%esp
  100dc6:	66 c7 45 ee 43 00    	movw   $0x43,-0x12(%ebp)
  100dcc:	c6 45 ed 34          	movb   $0x34,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100dd0:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100dd4:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100dd8:	ee                   	out    %al,(%dx)
}
  100dd9:	90                   	nop
  100dda:	66 c7 45 f2 40 00    	movw   $0x40,-0xe(%ebp)
  100de0:	c6 45 f1 9c          	movb   $0x9c,-0xf(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100de4:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100de8:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100dec:	ee                   	out    %al,(%dx)
}
  100ded:	90                   	nop
  100dee:	66 c7 45 f6 40 00    	movw   $0x40,-0xa(%ebp)
  100df4:	c6 45 f5 2e          	movb   $0x2e,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100df8:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  100dfc:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100e00:	ee                   	out    %al,(%dx)
}
  100e01:	90                   	nop
    outb(TIMER_MODE, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
    outb(IO_TIMER1, TIMER_DIV(100) % 256);
    outb(IO_TIMER1, TIMER_DIV(100) / 256);

    // initialize time counter 'ticks' to zero
    ticks = 0;
  100e02:	c7 05 08 09 11 00 00 	movl   $0x0,0x110908
  100e09:	00 00 00 

    cprintf("++ setup timer interrupts\n");
  100e0c:	c7 04 24 12 39 10 00 	movl   $0x103912,(%esp)
  100e13:	e8 6c f4 ff ff       	call   100284 <cprintf>
    pic_enable(IRQ_TIMER);
  100e18:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100e1f:	e8 31 09 00 00       	call   101755 <pic_enable>
}
  100e24:	90                   	nop
  100e25:	c9                   	leave  
  100e26:	c3                   	ret    

00100e27 <delay>:
#include <picirq.h>
#include <trap.h>

/* stupid I/O delay routine necessitated by historical PC design flaws */
static void
delay(void) {
  100e27:	f3 0f 1e fb          	endbr32 
  100e2b:	55                   	push   %ebp
  100e2c:	89 e5                	mov    %esp,%ebp
  100e2e:	83 ec 10             	sub    $0x10,%esp
  100e31:	66 c7 45 f2 84 00    	movw   $0x84,-0xe(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100e37:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100e3b:	89 c2                	mov    %eax,%edx
  100e3d:	ec                   	in     (%dx),%al
  100e3e:	88 45 f1             	mov    %al,-0xf(%ebp)
  100e41:	66 c7 45 f6 84 00    	movw   $0x84,-0xa(%ebp)
  100e47:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100e4b:	89 c2                	mov    %eax,%edx
  100e4d:	ec                   	in     (%dx),%al
  100e4e:	88 45 f5             	mov    %al,-0xb(%ebp)
  100e51:	66 c7 45 fa 84 00    	movw   $0x84,-0x6(%ebp)
  100e57:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  100e5b:	89 c2                	mov    %eax,%edx
  100e5d:	ec                   	in     (%dx),%al
  100e5e:	88 45 f9             	mov    %al,-0x7(%ebp)
  100e61:	66 c7 45 fe 84 00    	movw   $0x84,-0x2(%ebp)
  100e67:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  100e6b:	89 c2                	mov    %eax,%edx
  100e6d:	ec                   	in     (%dx),%al
  100e6e:	88 45 fd             	mov    %al,-0x3(%ebp)
    inb(0x84);
    inb(0x84);
    inb(0x84);
    inb(0x84);
}
  100e71:	90                   	nop
  100e72:	c9                   	leave  
  100e73:	c3                   	ret    

00100e74 <cga_init>:
//    -- 数据寄存器 映射 到 端口 0x3D5或0x3B5 
//    -- 索引寄存器 0x3D4或0x3B4,决定在数据寄存器中的数据表示什么。

/* TEXT-mode CGA/VGA display output */
static void
cga_init(void) {
  100e74:	f3 0f 1e fb          	endbr32 
  100e78:	55                   	push   %ebp
  100e79:	89 e5                	mov    %esp,%ebp
  100e7b:	83 ec 20             	sub    $0x20,%esp
    volatile uint16_t *cp = (uint16_t *)CGA_BUF;   //CGA_BUF: 0xB8000 (彩色显示的显存物理基址)
  100e7e:	c7 45 fc 00 80 0b 00 	movl   $0xb8000,-0x4(%ebp)
    uint16_t was = *cp;                                            //保存当前显存0xB8000处的值
  100e85:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e88:	0f b7 00             	movzwl (%eax),%eax
  100e8b:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
    *cp = (uint16_t) 0xA55A;                                   // 给这个地址随便写个值，看看能否再读出同样的值
  100e8f:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e92:	66 c7 00 5a a5       	movw   $0xa55a,(%eax)
    if (*cp != 0xA55A) {                                            // 如果读不出来，说明没有这块显存，即是单显配置
  100e97:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e9a:	0f b7 00             	movzwl (%eax),%eax
  100e9d:	0f b7 c0             	movzwl %ax,%eax
  100ea0:	3d 5a a5 00 00       	cmp    $0xa55a,%eax
  100ea5:	74 12                	je     100eb9 <cga_init+0x45>
        cp = (uint16_t*)MONO_BUF;                         //设置为单显的显存基址 MONO_BUF： 0xB0000
  100ea7:	c7 45 fc 00 00 0b 00 	movl   $0xb0000,-0x4(%ebp)
        addr_6845 = MONO_BASE;                           //设置为单显控制的IO地址，MONO_BASE: 0x3B4
  100eae:	66 c7 05 66 fe 10 00 	movw   $0x3b4,0x10fe66
  100eb5:	b4 03 
  100eb7:	eb 13                	jmp    100ecc <cga_init+0x58>
    } else {                                                                // 如果读出来了，有这块显存，即是彩显配置
        *cp = was;                                                      //还原原来显存位置的值
  100eb9:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100ebc:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  100ec0:	66 89 10             	mov    %dx,(%eax)
        addr_6845 = CGA_BASE;                               // 设置为彩显控制的IO地址，CGA_BASE: 0x3D4 
  100ec3:	66 c7 05 66 fe 10 00 	movw   $0x3d4,0x10fe66
  100eca:	d4 03 
    // Extract cursor location
    // 6845索引寄存器的index 0x0E（及十进制的14）== 光标位置(高位)
    // 6845索引寄存器的index 0x0F（及十进制的15）== 光标位置(低位)
    // 6845 reg 15 : Cursor Address (Low Byte)
    uint32_t pos;
    outb(addr_6845, 14);                                        
  100ecc:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  100ed3:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
  100ed7:	c6 45 e5 0e          	movb   $0xe,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100edb:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  100edf:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  100ee3:	ee                   	out    %al,(%dx)
}
  100ee4:	90                   	nop
    pos = inb(addr_6845 + 1) << 8;                       //读出了光标位置(高位)
  100ee5:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  100eec:	40                   	inc    %eax
  100eed:	0f b7 c0             	movzwl %ax,%eax
  100ef0:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100ef4:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
  100ef8:	89 c2                	mov    %eax,%edx
  100efa:	ec                   	in     (%dx),%al
  100efb:	88 45 e9             	mov    %al,-0x17(%ebp)
    return data;
  100efe:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  100f02:	0f b6 c0             	movzbl %al,%eax
  100f05:	c1 e0 08             	shl    $0x8,%eax
  100f08:	89 45 f4             	mov    %eax,-0xc(%ebp)
    outb(addr_6845, 15);
  100f0b:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  100f12:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
  100f16:	c6 45 ed 0f          	movb   $0xf,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f1a:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100f1e:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100f22:	ee                   	out    %al,(%dx)
}
  100f23:	90                   	nop
    pos |= inb(addr_6845 + 1);                             //读出了光标位置(低位)
  100f24:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  100f2b:	40                   	inc    %eax
  100f2c:	0f b7 c0             	movzwl %ax,%eax
  100f2f:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100f33:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100f37:	89 c2                	mov    %eax,%edx
  100f39:	ec                   	in     (%dx),%al
  100f3a:	88 45 f1             	mov    %al,-0xf(%ebp)
    return data;
  100f3d:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100f41:	0f b6 c0             	movzbl %al,%eax
  100f44:	09 45 f4             	or     %eax,-0xc(%ebp)

    crt_buf = (uint16_t*) cp;                                  //crt_buf是CGA显存起始地址
  100f47:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100f4a:	a3 60 fe 10 00       	mov    %eax,0x10fe60
    crt_pos = pos;                                                  //crt_pos是CGA当前光标位置
  100f4f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100f52:	0f b7 c0             	movzwl %ax,%eax
  100f55:	66 a3 64 fe 10 00    	mov    %ax,0x10fe64
}
  100f5b:	90                   	nop
  100f5c:	c9                   	leave  
  100f5d:	c3                   	ret    

00100f5e <serial_init>:

static bool serial_exists = 0;

static void
serial_init(void) {
  100f5e:	f3 0f 1e fb          	endbr32 
  100f62:	55                   	push   %ebp
  100f63:	89 e5                	mov    %esp,%ebp
  100f65:	83 ec 48             	sub    $0x48,%esp
  100f68:	66 c7 45 d2 fa 03    	movw   $0x3fa,-0x2e(%ebp)
  100f6e:	c6 45 d1 00          	movb   $0x0,-0x2f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f72:	0f b6 45 d1          	movzbl -0x2f(%ebp),%eax
  100f76:	0f b7 55 d2          	movzwl -0x2e(%ebp),%edx
  100f7a:	ee                   	out    %al,(%dx)
}
  100f7b:	90                   	nop
  100f7c:	66 c7 45 d6 fb 03    	movw   $0x3fb,-0x2a(%ebp)
  100f82:	c6 45 d5 80          	movb   $0x80,-0x2b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f86:	0f b6 45 d5          	movzbl -0x2b(%ebp),%eax
  100f8a:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
  100f8e:	ee                   	out    %al,(%dx)
}
  100f8f:	90                   	nop
  100f90:	66 c7 45 da f8 03    	movw   $0x3f8,-0x26(%ebp)
  100f96:	c6 45 d9 0c          	movb   $0xc,-0x27(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f9a:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
  100f9e:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  100fa2:	ee                   	out    %al,(%dx)
}
  100fa3:	90                   	nop
  100fa4:	66 c7 45 de f9 03    	movw   $0x3f9,-0x22(%ebp)
  100faa:	c6 45 dd 00          	movb   $0x0,-0x23(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100fae:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  100fb2:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  100fb6:	ee                   	out    %al,(%dx)
}
  100fb7:	90                   	nop
  100fb8:	66 c7 45 e2 fb 03    	movw   $0x3fb,-0x1e(%ebp)
  100fbe:	c6 45 e1 03          	movb   $0x3,-0x1f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100fc2:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  100fc6:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  100fca:	ee                   	out    %al,(%dx)
}
  100fcb:	90                   	nop
  100fcc:	66 c7 45 e6 fc 03    	movw   $0x3fc,-0x1a(%ebp)
  100fd2:	c6 45 e5 00          	movb   $0x0,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100fd6:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  100fda:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  100fde:	ee                   	out    %al,(%dx)
}
  100fdf:	90                   	nop
  100fe0:	66 c7 45 ea f9 03    	movw   $0x3f9,-0x16(%ebp)
  100fe6:	c6 45 e9 01          	movb   $0x1,-0x17(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100fea:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  100fee:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  100ff2:	ee                   	out    %al,(%dx)
}
  100ff3:	90                   	nop
  100ff4:	66 c7 45 ee fd 03    	movw   $0x3fd,-0x12(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100ffa:	0f b7 45 ee          	movzwl -0x12(%ebp),%eax
  100ffe:	89 c2                	mov    %eax,%edx
  101000:	ec                   	in     (%dx),%al
  101001:	88 45 ed             	mov    %al,-0x13(%ebp)
    return data;
  101004:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
    // Enable rcv interrupts
    outb(COM1 + COM_IER, COM_IER_RDI);

    // Clear any preexisting overrun indications and interrupts
    // Serial port doesn't exist if COM_LSR returns 0xFF
    serial_exists = (inb(COM1 + COM_LSR) != 0xFF);
  101008:	3c ff                	cmp    $0xff,%al
  10100a:	0f 95 c0             	setne  %al
  10100d:	0f b6 c0             	movzbl %al,%eax
  101010:	a3 68 fe 10 00       	mov    %eax,0x10fe68
  101015:	66 c7 45 f2 fa 03    	movw   $0x3fa,-0xe(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  10101b:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  10101f:	89 c2                	mov    %eax,%edx
  101021:	ec                   	in     (%dx),%al
  101022:	88 45 f1             	mov    %al,-0xf(%ebp)
  101025:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
  10102b:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  10102f:	89 c2                	mov    %eax,%edx
  101031:	ec                   	in     (%dx),%al
  101032:	88 45 f5             	mov    %al,-0xb(%ebp)
    (void) inb(COM1+COM_IIR);
    (void) inb(COM1+COM_RX);

    if (serial_exists) {
  101035:	a1 68 fe 10 00       	mov    0x10fe68,%eax
  10103a:	85 c0                	test   %eax,%eax
  10103c:	74 0c                	je     10104a <serial_init+0xec>
        pic_enable(IRQ_COM1);
  10103e:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
  101045:	e8 0b 07 00 00       	call   101755 <pic_enable>
    }
}
  10104a:	90                   	nop
  10104b:	c9                   	leave  
  10104c:	c3                   	ret    

0010104d <lpt_putc_sub>:

static void
lpt_putc_sub(int c) {
  10104d:	f3 0f 1e fb          	endbr32 
  101051:	55                   	push   %ebp
  101052:	89 e5                	mov    %esp,%ebp
  101054:	83 ec 20             	sub    $0x20,%esp
    int i;
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  101057:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  10105e:	eb 08                	jmp    101068 <lpt_putc_sub+0x1b>
        delay();
  101060:	e8 c2 fd ff ff       	call   100e27 <delay>
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  101065:	ff 45 fc             	incl   -0x4(%ebp)
  101068:	66 c7 45 fa 79 03    	movw   $0x379,-0x6(%ebp)
  10106e:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  101072:	89 c2                	mov    %eax,%edx
  101074:	ec                   	in     (%dx),%al
  101075:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  101078:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  10107c:	84 c0                	test   %al,%al
  10107e:	78 09                	js     101089 <lpt_putc_sub+0x3c>
  101080:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  101087:	7e d7                	jle    101060 <lpt_putc_sub+0x13>
    }
    outb(LPTPORT + 0, c);
  101089:	8b 45 08             	mov    0x8(%ebp),%eax
  10108c:	0f b6 c0             	movzbl %al,%eax
  10108f:	66 c7 45 ee 78 03    	movw   $0x378,-0x12(%ebp)
  101095:	88 45 ed             	mov    %al,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101098:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  10109c:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  1010a0:	ee                   	out    %al,(%dx)
}
  1010a1:	90                   	nop
  1010a2:	66 c7 45 f2 7a 03    	movw   $0x37a,-0xe(%ebp)
  1010a8:	c6 45 f1 0d          	movb   $0xd,-0xf(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1010ac:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  1010b0:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  1010b4:	ee                   	out    %al,(%dx)
}
  1010b5:	90                   	nop
  1010b6:	66 c7 45 f6 7a 03    	movw   $0x37a,-0xa(%ebp)
  1010bc:	c6 45 f5 08          	movb   $0x8,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1010c0:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  1010c4:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  1010c8:	ee                   	out    %al,(%dx)
}
  1010c9:	90                   	nop
    outb(LPTPORT + 2, 0x08 | 0x04 | 0x01);
    outb(LPTPORT + 2, 0x08);
}
  1010ca:	90                   	nop
  1010cb:	c9                   	leave  
  1010cc:	c3                   	ret    

001010cd <lpt_putc>:

/* lpt_putc - copy console output to parallel port */
static void
lpt_putc(int c) {
  1010cd:	f3 0f 1e fb          	endbr32 
  1010d1:	55                   	push   %ebp
  1010d2:	89 e5                	mov    %esp,%ebp
  1010d4:	83 ec 04             	sub    $0x4,%esp
    if (c != '\b') {
  1010d7:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  1010db:	74 0d                	je     1010ea <lpt_putc+0x1d>
        lpt_putc_sub(c);
  1010dd:	8b 45 08             	mov    0x8(%ebp),%eax
  1010e0:	89 04 24             	mov    %eax,(%esp)
  1010e3:	e8 65 ff ff ff       	call   10104d <lpt_putc_sub>
    else {
        lpt_putc_sub('\b');
        lpt_putc_sub(' ');
        lpt_putc_sub('\b');
    }
}
  1010e8:	eb 24                	jmp    10110e <lpt_putc+0x41>
        lpt_putc_sub('\b');
  1010ea:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  1010f1:	e8 57 ff ff ff       	call   10104d <lpt_putc_sub>
        lpt_putc_sub(' ');
  1010f6:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  1010fd:	e8 4b ff ff ff       	call   10104d <lpt_putc_sub>
        lpt_putc_sub('\b');
  101102:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  101109:	e8 3f ff ff ff       	call   10104d <lpt_putc_sub>
}
  10110e:	90                   	nop
  10110f:	c9                   	leave  
  101110:	c3                   	ret    

00101111 <cga_putc>:

/* cga_putc - print character to console */
static void
cga_putc(int c) {
  101111:	f3 0f 1e fb          	endbr32 
  101115:	55                   	push   %ebp
  101116:	89 e5                	mov    %esp,%ebp
  101118:	53                   	push   %ebx
  101119:	83 ec 34             	sub    $0x34,%esp
    // set black on white
    if (!(c & ~0xFF)) {
  10111c:	8b 45 08             	mov    0x8(%ebp),%eax
  10111f:	25 00 ff ff ff       	and    $0xffffff00,%eax
  101124:	85 c0                	test   %eax,%eax
  101126:	75 07                	jne    10112f <cga_putc+0x1e>
        c |= 0x0700;
  101128:	81 4d 08 00 07 00 00 	orl    $0x700,0x8(%ebp)
    }

    switch (c & 0xff) {
  10112f:	8b 45 08             	mov    0x8(%ebp),%eax
  101132:	0f b6 c0             	movzbl %al,%eax
  101135:	83 f8 0d             	cmp    $0xd,%eax
  101138:	74 72                	je     1011ac <cga_putc+0x9b>
  10113a:	83 f8 0d             	cmp    $0xd,%eax
  10113d:	0f 8f a3 00 00 00    	jg     1011e6 <cga_putc+0xd5>
  101143:	83 f8 08             	cmp    $0x8,%eax
  101146:	74 0a                	je     101152 <cga_putc+0x41>
  101148:	83 f8 0a             	cmp    $0xa,%eax
  10114b:	74 4c                	je     101199 <cga_putc+0x88>
  10114d:	e9 94 00 00 00       	jmp    1011e6 <cga_putc+0xd5>
    case '\b':
        if (crt_pos > 0) {
  101152:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  101159:	85 c0                	test   %eax,%eax
  10115b:	0f 84 af 00 00 00    	je     101210 <cga_putc+0xff>
            crt_pos --;
  101161:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  101168:	48                   	dec    %eax
  101169:	0f b7 c0             	movzwl %ax,%eax
  10116c:	66 a3 64 fe 10 00    	mov    %ax,0x10fe64
            crt_buf[crt_pos] = (c & ~0xff) | ' ';
  101172:	8b 45 08             	mov    0x8(%ebp),%eax
  101175:	98                   	cwtl   
  101176:	25 00 ff ff ff       	and    $0xffffff00,%eax
  10117b:	98                   	cwtl   
  10117c:	83 c8 20             	or     $0x20,%eax
  10117f:	98                   	cwtl   
  101180:	8b 15 60 fe 10 00    	mov    0x10fe60,%edx
  101186:	0f b7 0d 64 fe 10 00 	movzwl 0x10fe64,%ecx
  10118d:	01 c9                	add    %ecx,%ecx
  10118f:	01 ca                	add    %ecx,%edx
  101191:	0f b7 c0             	movzwl %ax,%eax
  101194:	66 89 02             	mov    %ax,(%edx)
        }
        break;
  101197:	eb 77                	jmp    101210 <cga_putc+0xff>
    case '\n':
        crt_pos += CRT_COLS;
  101199:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  1011a0:	83 c0 50             	add    $0x50,%eax
  1011a3:	0f b7 c0             	movzwl %ax,%eax
  1011a6:	66 a3 64 fe 10 00    	mov    %ax,0x10fe64
    case '\r':
        crt_pos -= (crt_pos % CRT_COLS);
  1011ac:	0f b7 1d 64 fe 10 00 	movzwl 0x10fe64,%ebx
  1011b3:	0f b7 0d 64 fe 10 00 	movzwl 0x10fe64,%ecx
  1011ba:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
  1011bf:	89 c8                	mov    %ecx,%eax
  1011c1:	f7 e2                	mul    %edx
  1011c3:	c1 ea 06             	shr    $0x6,%edx
  1011c6:	89 d0                	mov    %edx,%eax
  1011c8:	c1 e0 02             	shl    $0x2,%eax
  1011cb:	01 d0                	add    %edx,%eax
  1011cd:	c1 e0 04             	shl    $0x4,%eax
  1011d0:	29 c1                	sub    %eax,%ecx
  1011d2:	89 c8                	mov    %ecx,%eax
  1011d4:	0f b7 c0             	movzwl %ax,%eax
  1011d7:	29 c3                	sub    %eax,%ebx
  1011d9:	89 d8                	mov    %ebx,%eax
  1011db:	0f b7 c0             	movzwl %ax,%eax
  1011de:	66 a3 64 fe 10 00    	mov    %ax,0x10fe64
        break;
  1011e4:	eb 2b                	jmp    101211 <cga_putc+0x100>
    default:
        crt_buf[crt_pos ++] = c;     // write the character
  1011e6:	8b 0d 60 fe 10 00    	mov    0x10fe60,%ecx
  1011ec:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  1011f3:	8d 50 01             	lea    0x1(%eax),%edx
  1011f6:	0f b7 d2             	movzwl %dx,%edx
  1011f9:	66 89 15 64 fe 10 00 	mov    %dx,0x10fe64
  101200:	01 c0                	add    %eax,%eax
  101202:	8d 14 01             	lea    (%ecx,%eax,1),%edx
  101205:	8b 45 08             	mov    0x8(%ebp),%eax
  101208:	0f b7 c0             	movzwl %ax,%eax
  10120b:	66 89 02             	mov    %ax,(%edx)
        break;
  10120e:	eb 01                	jmp    101211 <cga_putc+0x100>
        break;
  101210:	90                   	nop
    }

    // What is the purpose of this?
    if (crt_pos >= CRT_SIZE) {
  101211:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  101218:	3d cf 07 00 00       	cmp    $0x7cf,%eax
  10121d:	76 5d                	jbe    10127c <cga_putc+0x16b>
        int i;
        memmove(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
  10121f:	a1 60 fe 10 00       	mov    0x10fe60,%eax
  101224:	8d 90 a0 00 00 00    	lea    0xa0(%eax),%edx
  10122a:	a1 60 fe 10 00       	mov    0x10fe60,%eax
  10122f:	c7 44 24 08 00 0f 00 	movl   $0xf00,0x8(%esp)
  101236:	00 
  101237:	89 54 24 04          	mov    %edx,0x4(%esp)
  10123b:	89 04 24             	mov    %eax,(%esp)
  10123e:	e8 d8 1b 00 00       	call   102e1b <memmove>
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  101243:	c7 45 f4 80 07 00 00 	movl   $0x780,-0xc(%ebp)
  10124a:	eb 14                	jmp    101260 <cga_putc+0x14f>
            crt_buf[i] = 0x0700 | ' ';
  10124c:	a1 60 fe 10 00       	mov    0x10fe60,%eax
  101251:	8b 55 f4             	mov    -0xc(%ebp),%edx
  101254:	01 d2                	add    %edx,%edx
  101256:	01 d0                	add    %edx,%eax
  101258:	66 c7 00 20 07       	movw   $0x720,(%eax)
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  10125d:	ff 45 f4             	incl   -0xc(%ebp)
  101260:	81 7d f4 cf 07 00 00 	cmpl   $0x7cf,-0xc(%ebp)
  101267:	7e e3                	jle    10124c <cga_putc+0x13b>
        }
        crt_pos -= CRT_COLS;
  101269:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  101270:	83 e8 50             	sub    $0x50,%eax
  101273:	0f b7 c0             	movzwl %ax,%eax
  101276:	66 a3 64 fe 10 00    	mov    %ax,0x10fe64
    }

    // move that little blinky thing
    outb(addr_6845, 14);
  10127c:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  101283:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
  101287:	c6 45 e5 0e          	movb   $0xe,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10128b:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  10128f:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  101293:	ee                   	out    %al,(%dx)
}
  101294:	90                   	nop
    outb(addr_6845 + 1, crt_pos >> 8);
  101295:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  10129c:	c1 e8 08             	shr    $0x8,%eax
  10129f:	0f b7 c0             	movzwl %ax,%eax
  1012a2:	0f b6 c0             	movzbl %al,%eax
  1012a5:	0f b7 15 66 fe 10 00 	movzwl 0x10fe66,%edx
  1012ac:	42                   	inc    %edx
  1012ad:	0f b7 d2             	movzwl %dx,%edx
  1012b0:	66 89 55 ea          	mov    %dx,-0x16(%ebp)
  1012b4:	88 45 e9             	mov    %al,-0x17(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1012b7:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  1012bb:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  1012bf:	ee                   	out    %al,(%dx)
}
  1012c0:	90                   	nop
    outb(addr_6845, 15);
  1012c1:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  1012c8:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
  1012cc:	c6 45 ed 0f          	movb   $0xf,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1012d0:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  1012d4:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  1012d8:	ee                   	out    %al,(%dx)
}
  1012d9:	90                   	nop
    outb(addr_6845 + 1, crt_pos);
  1012da:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  1012e1:	0f b6 c0             	movzbl %al,%eax
  1012e4:	0f b7 15 66 fe 10 00 	movzwl 0x10fe66,%edx
  1012eb:	42                   	inc    %edx
  1012ec:	0f b7 d2             	movzwl %dx,%edx
  1012ef:	66 89 55 f2          	mov    %dx,-0xe(%ebp)
  1012f3:	88 45 f1             	mov    %al,-0xf(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1012f6:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  1012fa:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  1012fe:	ee                   	out    %al,(%dx)
}
  1012ff:	90                   	nop
}
  101300:	90                   	nop
  101301:	83 c4 34             	add    $0x34,%esp
  101304:	5b                   	pop    %ebx
  101305:	5d                   	pop    %ebp
  101306:	c3                   	ret    

00101307 <serial_putc_sub>:

static void
serial_putc_sub(int c) {
  101307:	f3 0f 1e fb          	endbr32 
  10130b:	55                   	push   %ebp
  10130c:	89 e5                	mov    %esp,%ebp
  10130e:	83 ec 10             	sub    $0x10,%esp
    int i;
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  101311:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  101318:	eb 08                	jmp    101322 <serial_putc_sub+0x1b>
        delay();
  10131a:	e8 08 fb ff ff       	call   100e27 <delay>
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  10131f:	ff 45 fc             	incl   -0x4(%ebp)
  101322:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101328:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  10132c:	89 c2                	mov    %eax,%edx
  10132e:	ec                   	in     (%dx),%al
  10132f:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  101332:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  101336:	0f b6 c0             	movzbl %al,%eax
  101339:	83 e0 20             	and    $0x20,%eax
  10133c:	85 c0                	test   %eax,%eax
  10133e:	75 09                	jne    101349 <serial_putc_sub+0x42>
  101340:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  101347:	7e d1                	jle    10131a <serial_putc_sub+0x13>
    }
    outb(COM1 + COM_TX, c);
  101349:	8b 45 08             	mov    0x8(%ebp),%eax
  10134c:	0f b6 c0             	movzbl %al,%eax
  10134f:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
  101355:	88 45 f5             	mov    %al,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101358:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  10135c:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  101360:	ee                   	out    %al,(%dx)
}
  101361:	90                   	nop
}
  101362:	90                   	nop
  101363:	c9                   	leave  
  101364:	c3                   	ret    

00101365 <serial_putc>:

/* serial_putc - print character to serial port */
static void
serial_putc(int c) {
  101365:	f3 0f 1e fb          	endbr32 
  101369:	55                   	push   %ebp
  10136a:	89 e5                	mov    %esp,%ebp
  10136c:	83 ec 04             	sub    $0x4,%esp
    if (c != '\b') {
  10136f:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  101373:	74 0d                	je     101382 <serial_putc+0x1d>
        serial_putc_sub(c);
  101375:	8b 45 08             	mov    0x8(%ebp),%eax
  101378:	89 04 24             	mov    %eax,(%esp)
  10137b:	e8 87 ff ff ff       	call   101307 <serial_putc_sub>
    else {
        serial_putc_sub('\b');
        serial_putc_sub(' ');
        serial_putc_sub('\b');
    }
}
  101380:	eb 24                	jmp    1013a6 <serial_putc+0x41>
        serial_putc_sub('\b');
  101382:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  101389:	e8 79 ff ff ff       	call   101307 <serial_putc_sub>
        serial_putc_sub(' ');
  10138e:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  101395:	e8 6d ff ff ff       	call   101307 <serial_putc_sub>
        serial_putc_sub('\b');
  10139a:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  1013a1:	e8 61 ff ff ff       	call   101307 <serial_putc_sub>
}
  1013a6:	90                   	nop
  1013a7:	c9                   	leave  
  1013a8:	c3                   	ret    

001013a9 <cons_intr>:
/* *
 * cons_intr - called by device interrupt routines to feed input
 * characters into the circular console input buffer.
 * */
static void
cons_intr(int (*proc)(void)) {
  1013a9:	f3 0f 1e fb          	endbr32 
  1013ad:	55                   	push   %ebp
  1013ae:	89 e5                	mov    %esp,%ebp
  1013b0:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = (*proc)()) != -1) {
  1013b3:	eb 33                	jmp    1013e8 <cons_intr+0x3f>
        if (c != 0) {
  1013b5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1013b9:	74 2d                	je     1013e8 <cons_intr+0x3f>
            cons.buf[cons.wpos ++] = c;
  1013bb:	a1 84 00 11 00       	mov    0x110084,%eax
  1013c0:	8d 50 01             	lea    0x1(%eax),%edx
  1013c3:	89 15 84 00 11 00    	mov    %edx,0x110084
  1013c9:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1013cc:	88 90 80 fe 10 00    	mov    %dl,0x10fe80(%eax)
            if (cons.wpos == CONSBUFSIZE) {
  1013d2:	a1 84 00 11 00       	mov    0x110084,%eax
  1013d7:	3d 00 02 00 00       	cmp    $0x200,%eax
  1013dc:	75 0a                	jne    1013e8 <cons_intr+0x3f>
                cons.wpos = 0;
  1013de:	c7 05 84 00 11 00 00 	movl   $0x0,0x110084
  1013e5:	00 00 00 
    while ((c = (*proc)()) != -1) {
  1013e8:	8b 45 08             	mov    0x8(%ebp),%eax
  1013eb:	ff d0                	call   *%eax
  1013ed:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1013f0:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
  1013f4:	75 bf                	jne    1013b5 <cons_intr+0xc>
            }
        }
    }
}
  1013f6:	90                   	nop
  1013f7:	90                   	nop
  1013f8:	c9                   	leave  
  1013f9:	c3                   	ret    

001013fa <serial_proc_data>:

/* serial_proc_data - get data from serial port */
static int
serial_proc_data(void) {
  1013fa:	f3 0f 1e fb          	endbr32 
  1013fe:	55                   	push   %ebp
  1013ff:	89 e5                	mov    %esp,%ebp
  101401:	83 ec 10             	sub    $0x10,%esp
  101404:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  10140a:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  10140e:	89 c2                	mov    %eax,%edx
  101410:	ec                   	in     (%dx),%al
  101411:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  101414:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
    if (!(inb(COM1 + COM_LSR) & COM_LSR_DATA)) {
  101418:	0f b6 c0             	movzbl %al,%eax
  10141b:	83 e0 01             	and    $0x1,%eax
  10141e:	85 c0                	test   %eax,%eax
  101420:	75 07                	jne    101429 <serial_proc_data+0x2f>
        return -1;
  101422:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101427:	eb 2a                	jmp    101453 <serial_proc_data+0x59>
  101429:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  10142f:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  101433:	89 c2                	mov    %eax,%edx
  101435:	ec                   	in     (%dx),%al
  101436:	88 45 f5             	mov    %al,-0xb(%ebp)
    return data;
  101439:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
    }
    int c = inb(COM1 + COM_RX);
  10143d:	0f b6 c0             	movzbl %al,%eax
  101440:	89 45 fc             	mov    %eax,-0x4(%ebp)
    if (c == 127) {
  101443:	83 7d fc 7f          	cmpl   $0x7f,-0x4(%ebp)
  101447:	75 07                	jne    101450 <serial_proc_data+0x56>
        c = '\b';
  101449:	c7 45 fc 08 00 00 00 	movl   $0x8,-0x4(%ebp)
    }
    return c;
  101450:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  101453:	c9                   	leave  
  101454:	c3                   	ret    

00101455 <serial_intr>:

/* serial_intr - try to feed input characters from serial port */
void
serial_intr(void) {
  101455:	f3 0f 1e fb          	endbr32 
  101459:	55                   	push   %ebp
  10145a:	89 e5                	mov    %esp,%ebp
  10145c:	83 ec 18             	sub    $0x18,%esp
    if (serial_exists) {
  10145f:	a1 68 fe 10 00       	mov    0x10fe68,%eax
  101464:	85 c0                	test   %eax,%eax
  101466:	74 0c                	je     101474 <serial_intr+0x1f>
        cons_intr(serial_proc_data);
  101468:	c7 04 24 fa 13 10 00 	movl   $0x1013fa,(%esp)
  10146f:	e8 35 ff ff ff       	call   1013a9 <cons_intr>
    }
}
  101474:	90                   	nop
  101475:	c9                   	leave  
  101476:	c3                   	ret    

00101477 <kbd_proc_data>:
 *
 * The kbd_proc_data() function gets data from the keyboard.
 * If we finish a character, return it, else 0. And return -1 if no data.
 * */
static int
kbd_proc_data(void) {
  101477:	f3 0f 1e fb          	endbr32 
  10147b:	55                   	push   %ebp
  10147c:	89 e5                	mov    %esp,%ebp
  10147e:	83 ec 38             	sub    $0x38,%esp
  101481:	66 c7 45 f0 64 00    	movw   $0x64,-0x10(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101487:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10148a:	89 c2                	mov    %eax,%edx
  10148c:	ec                   	in     (%dx),%al
  10148d:	88 45 ef             	mov    %al,-0x11(%ebp)
    return data;
  101490:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    int c;
    uint8_t data;
    static uint32_t shift;

    if ((inb(KBSTATP) & KBS_DIB) == 0) {
  101494:	0f b6 c0             	movzbl %al,%eax
  101497:	83 e0 01             	and    $0x1,%eax
  10149a:	85 c0                	test   %eax,%eax
  10149c:	75 0a                	jne    1014a8 <kbd_proc_data+0x31>
        return -1;
  10149e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1014a3:	e9 56 01 00 00       	jmp    1015fe <kbd_proc_data+0x187>
  1014a8:	66 c7 45 ec 60 00    	movw   $0x60,-0x14(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1014ae:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1014b1:	89 c2                	mov    %eax,%edx
  1014b3:	ec                   	in     (%dx),%al
  1014b4:	88 45 eb             	mov    %al,-0x15(%ebp)
    return data;
  1014b7:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
    }

    data = inb(KBDATAP);
  1014bb:	88 45 f3             	mov    %al,-0xd(%ebp)

    if (data == 0xE0) {
  1014be:	80 7d f3 e0          	cmpb   $0xe0,-0xd(%ebp)
  1014c2:	75 17                	jne    1014db <kbd_proc_data+0x64>
        // E0 escape character
        shift |= E0ESC;
  1014c4:	a1 88 00 11 00       	mov    0x110088,%eax
  1014c9:	83 c8 40             	or     $0x40,%eax
  1014cc:	a3 88 00 11 00       	mov    %eax,0x110088
        return 0;
  1014d1:	b8 00 00 00 00       	mov    $0x0,%eax
  1014d6:	e9 23 01 00 00       	jmp    1015fe <kbd_proc_data+0x187>
    } else if (data & 0x80) {
  1014db:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014df:	84 c0                	test   %al,%al
  1014e1:	79 45                	jns    101528 <kbd_proc_data+0xb1>
        // Key released
        data = (shift & E0ESC ? data : data & 0x7F);
  1014e3:	a1 88 00 11 00       	mov    0x110088,%eax
  1014e8:	83 e0 40             	and    $0x40,%eax
  1014eb:	85 c0                	test   %eax,%eax
  1014ed:	75 08                	jne    1014f7 <kbd_proc_data+0x80>
  1014ef:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014f3:	24 7f                	and    $0x7f,%al
  1014f5:	eb 04                	jmp    1014fb <kbd_proc_data+0x84>
  1014f7:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014fb:	88 45 f3             	mov    %al,-0xd(%ebp)
        shift &= ~(shiftcode[data] | E0ESC);
  1014fe:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101502:	0f b6 80 40 f0 10 00 	movzbl 0x10f040(%eax),%eax
  101509:	0c 40                	or     $0x40,%al
  10150b:	0f b6 c0             	movzbl %al,%eax
  10150e:	f7 d0                	not    %eax
  101510:	89 c2                	mov    %eax,%edx
  101512:	a1 88 00 11 00       	mov    0x110088,%eax
  101517:	21 d0                	and    %edx,%eax
  101519:	a3 88 00 11 00       	mov    %eax,0x110088
        return 0;
  10151e:	b8 00 00 00 00       	mov    $0x0,%eax
  101523:	e9 d6 00 00 00       	jmp    1015fe <kbd_proc_data+0x187>
    } else if (shift & E0ESC) {
  101528:	a1 88 00 11 00       	mov    0x110088,%eax
  10152d:	83 e0 40             	and    $0x40,%eax
  101530:	85 c0                	test   %eax,%eax
  101532:	74 11                	je     101545 <kbd_proc_data+0xce>
        // Last character was an E0 escape; or with 0x80
        data |= 0x80;
  101534:	80 4d f3 80          	orb    $0x80,-0xd(%ebp)
        shift &= ~E0ESC;
  101538:	a1 88 00 11 00       	mov    0x110088,%eax
  10153d:	83 e0 bf             	and    $0xffffffbf,%eax
  101540:	a3 88 00 11 00       	mov    %eax,0x110088
    }

    shift |= shiftcode[data];
  101545:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101549:	0f b6 80 40 f0 10 00 	movzbl 0x10f040(%eax),%eax
  101550:	0f b6 d0             	movzbl %al,%edx
  101553:	a1 88 00 11 00       	mov    0x110088,%eax
  101558:	09 d0                	or     %edx,%eax
  10155a:	a3 88 00 11 00       	mov    %eax,0x110088
    shift ^= togglecode[data];
  10155f:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101563:	0f b6 80 40 f1 10 00 	movzbl 0x10f140(%eax),%eax
  10156a:	0f b6 d0             	movzbl %al,%edx
  10156d:	a1 88 00 11 00       	mov    0x110088,%eax
  101572:	31 d0                	xor    %edx,%eax
  101574:	a3 88 00 11 00       	mov    %eax,0x110088

    c = charcode[shift & (CTL | SHIFT)][data];
  101579:	a1 88 00 11 00       	mov    0x110088,%eax
  10157e:	83 e0 03             	and    $0x3,%eax
  101581:	8b 14 85 40 f5 10 00 	mov    0x10f540(,%eax,4),%edx
  101588:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10158c:	01 d0                	add    %edx,%eax
  10158e:	0f b6 00             	movzbl (%eax),%eax
  101591:	0f b6 c0             	movzbl %al,%eax
  101594:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if (shift & CAPSLOCK) {
  101597:	a1 88 00 11 00       	mov    0x110088,%eax
  10159c:	83 e0 08             	and    $0x8,%eax
  10159f:	85 c0                	test   %eax,%eax
  1015a1:	74 22                	je     1015c5 <kbd_proc_data+0x14e>
        if ('a' <= c && c <= 'z')
  1015a3:	83 7d f4 60          	cmpl   $0x60,-0xc(%ebp)
  1015a7:	7e 0c                	jle    1015b5 <kbd_proc_data+0x13e>
  1015a9:	83 7d f4 7a          	cmpl   $0x7a,-0xc(%ebp)
  1015ad:	7f 06                	jg     1015b5 <kbd_proc_data+0x13e>
            c += 'A' - 'a';
  1015af:	83 6d f4 20          	subl   $0x20,-0xc(%ebp)
  1015b3:	eb 10                	jmp    1015c5 <kbd_proc_data+0x14e>
        else if ('A' <= c && c <= 'Z')
  1015b5:	83 7d f4 40          	cmpl   $0x40,-0xc(%ebp)
  1015b9:	7e 0a                	jle    1015c5 <kbd_proc_data+0x14e>
  1015bb:	83 7d f4 5a          	cmpl   $0x5a,-0xc(%ebp)
  1015bf:	7f 04                	jg     1015c5 <kbd_proc_data+0x14e>
            c += 'a' - 'A';
  1015c1:	83 45 f4 20          	addl   $0x20,-0xc(%ebp)
    }

    // Process special keys
    // Ctrl-Alt-Del: reboot
    if (!(~shift & (CTL | ALT)) && c == KEY_DEL) {
  1015c5:	a1 88 00 11 00       	mov    0x110088,%eax
  1015ca:	f7 d0                	not    %eax
  1015cc:	83 e0 06             	and    $0x6,%eax
  1015cf:	85 c0                	test   %eax,%eax
  1015d1:	75 28                	jne    1015fb <kbd_proc_data+0x184>
  1015d3:	81 7d f4 e9 00 00 00 	cmpl   $0xe9,-0xc(%ebp)
  1015da:	75 1f                	jne    1015fb <kbd_proc_data+0x184>
        cprintf("Rebooting!\n");
  1015dc:	c7 04 24 2d 39 10 00 	movl   $0x10392d,(%esp)
  1015e3:	e8 9c ec ff ff       	call   100284 <cprintf>
  1015e8:	66 c7 45 e8 92 00    	movw   $0x92,-0x18(%ebp)
  1015ee:	c6 45 e7 03          	movb   $0x3,-0x19(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1015f2:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  1015f6:	8b 55 e8             	mov    -0x18(%ebp),%edx
  1015f9:	ee                   	out    %al,(%dx)
}
  1015fa:	90                   	nop
        outb(0x92, 0x3); // courtesy of Chris Frost
    }
    return c;
  1015fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1015fe:	c9                   	leave  
  1015ff:	c3                   	ret    

00101600 <kbd_intr>:

/* kbd_intr - try to feed input characters from keyboard */
static void
kbd_intr(void) {
  101600:	f3 0f 1e fb          	endbr32 
  101604:	55                   	push   %ebp
  101605:	89 e5                	mov    %esp,%ebp
  101607:	83 ec 18             	sub    $0x18,%esp
    cons_intr(kbd_proc_data);
  10160a:	c7 04 24 77 14 10 00 	movl   $0x101477,(%esp)
  101611:	e8 93 fd ff ff       	call   1013a9 <cons_intr>
}
  101616:	90                   	nop
  101617:	c9                   	leave  
  101618:	c3                   	ret    

00101619 <kbd_init>:

static void
kbd_init(void) {
  101619:	f3 0f 1e fb          	endbr32 
  10161d:	55                   	push   %ebp
  10161e:	89 e5                	mov    %esp,%ebp
  101620:	83 ec 18             	sub    $0x18,%esp
    // drain the kbd buffer
    kbd_intr();
  101623:	e8 d8 ff ff ff       	call   101600 <kbd_intr>
    pic_enable(IRQ_KBD);
  101628:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  10162f:	e8 21 01 00 00       	call   101755 <pic_enable>
}
  101634:	90                   	nop
  101635:	c9                   	leave  
  101636:	c3                   	ret    

00101637 <cons_init>:

/* cons_init - initializes the console devices */
void
cons_init(void) {
  101637:	f3 0f 1e fb          	endbr32 
  10163b:	55                   	push   %ebp
  10163c:	89 e5                	mov    %esp,%ebp
  10163e:	83 ec 18             	sub    $0x18,%esp
    cga_init();
  101641:	e8 2e f8 ff ff       	call   100e74 <cga_init>
    serial_init();
  101646:	e8 13 f9 ff ff       	call   100f5e <serial_init>
    kbd_init();
  10164b:	e8 c9 ff ff ff       	call   101619 <kbd_init>
    if (!serial_exists) {
  101650:	a1 68 fe 10 00       	mov    0x10fe68,%eax
  101655:	85 c0                	test   %eax,%eax
  101657:	75 0c                	jne    101665 <cons_init+0x2e>
        cprintf("serial port does not exist!!\n");
  101659:	c7 04 24 39 39 10 00 	movl   $0x103939,(%esp)
  101660:	e8 1f ec ff ff       	call   100284 <cprintf>
    }
}
  101665:	90                   	nop
  101666:	c9                   	leave  
  101667:	c3                   	ret    

00101668 <cons_putc>:

/* cons_putc - print a single character @c to console devices */
void
cons_putc(int c) {
  101668:	f3 0f 1e fb          	endbr32 
  10166c:	55                   	push   %ebp
  10166d:	89 e5                	mov    %esp,%ebp
  10166f:	83 ec 18             	sub    $0x18,%esp
    lpt_putc(c);
  101672:	8b 45 08             	mov    0x8(%ebp),%eax
  101675:	89 04 24             	mov    %eax,(%esp)
  101678:	e8 50 fa ff ff       	call   1010cd <lpt_putc>
    cga_putc(c);
  10167d:	8b 45 08             	mov    0x8(%ebp),%eax
  101680:	89 04 24             	mov    %eax,(%esp)
  101683:	e8 89 fa ff ff       	call   101111 <cga_putc>
    serial_putc(c);
  101688:	8b 45 08             	mov    0x8(%ebp),%eax
  10168b:	89 04 24             	mov    %eax,(%esp)
  10168e:	e8 d2 fc ff ff       	call   101365 <serial_putc>
}
  101693:	90                   	nop
  101694:	c9                   	leave  
  101695:	c3                   	ret    

00101696 <cons_getc>:
/* *
 * cons_getc - return the next input character from console,
 * or 0 if none waiting.
 * */
int
cons_getc(void) {
  101696:	f3 0f 1e fb          	endbr32 
  10169a:	55                   	push   %ebp
  10169b:	89 e5                	mov    %esp,%ebp
  10169d:	83 ec 18             	sub    $0x18,%esp
    int c;

    // poll for any pending input characters,
    // so that this function works even when interrupts are disabled
    // (e.g., when called from the kernel monitor).
    serial_intr();
  1016a0:	e8 b0 fd ff ff       	call   101455 <serial_intr>
    kbd_intr();
  1016a5:	e8 56 ff ff ff       	call   101600 <kbd_intr>

    // grab the next character from the input buffer.
    if (cons.rpos != cons.wpos) {
  1016aa:	8b 15 80 00 11 00    	mov    0x110080,%edx
  1016b0:	a1 84 00 11 00       	mov    0x110084,%eax
  1016b5:	39 c2                	cmp    %eax,%edx
  1016b7:	74 36                	je     1016ef <cons_getc+0x59>
        c = cons.buf[cons.rpos ++];
  1016b9:	a1 80 00 11 00       	mov    0x110080,%eax
  1016be:	8d 50 01             	lea    0x1(%eax),%edx
  1016c1:	89 15 80 00 11 00    	mov    %edx,0x110080
  1016c7:	0f b6 80 80 fe 10 00 	movzbl 0x10fe80(%eax),%eax
  1016ce:	0f b6 c0             	movzbl %al,%eax
  1016d1:	89 45 f4             	mov    %eax,-0xc(%ebp)
        if (cons.rpos == CONSBUFSIZE) {
  1016d4:	a1 80 00 11 00       	mov    0x110080,%eax
  1016d9:	3d 00 02 00 00       	cmp    $0x200,%eax
  1016de:	75 0a                	jne    1016ea <cons_getc+0x54>
            cons.rpos = 0;
  1016e0:	c7 05 80 00 11 00 00 	movl   $0x0,0x110080
  1016e7:	00 00 00 
        }
        return c;
  1016ea:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1016ed:	eb 05                	jmp    1016f4 <cons_getc+0x5e>
    }
    return 0;
  1016ef:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1016f4:	c9                   	leave  
  1016f5:	c3                   	ret    

001016f6 <pic_setmask>:
// Initial IRQ mask has interrupt 2 enabled (for slave 8259A).
static uint16_t irq_mask = 0xFFFF & ~(1 << IRQ_SLAVE);
static bool did_init = 0;

static void
pic_setmask(uint16_t mask) {
  1016f6:	f3 0f 1e fb          	endbr32 
  1016fa:	55                   	push   %ebp
  1016fb:	89 e5                	mov    %esp,%ebp
  1016fd:	83 ec 14             	sub    $0x14,%esp
  101700:	8b 45 08             	mov    0x8(%ebp),%eax
  101703:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
    irq_mask = mask;
  101707:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10170a:	66 a3 50 f5 10 00    	mov    %ax,0x10f550
    if (did_init) {
  101710:	a1 8c 00 11 00       	mov    0x11008c,%eax
  101715:	85 c0                	test   %eax,%eax
  101717:	74 39                	je     101752 <pic_setmask+0x5c>
        outb(IO_PIC1 + 1, mask);
  101719:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10171c:	0f b6 c0             	movzbl %al,%eax
  10171f:	66 c7 45 fa 21 00    	movw   $0x21,-0x6(%ebp)
  101725:	88 45 f9             	mov    %al,-0x7(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101728:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  10172c:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  101730:	ee                   	out    %al,(%dx)
}
  101731:	90                   	nop
        outb(IO_PIC2 + 1, mask >> 8);
  101732:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  101736:	c1 e8 08             	shr    $0x8,%eax
  101739:	0f b7 c0             	movzwl %ax,%eax
  10173c:	0f b6 c0             	movzbl %al,%eax
  10173f:	66 c7 45 fe a1 00    	movw   $0xa1,-0x2(%ebp)
  101745:	88 45 fd             	mov    %al,-0x3(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101748:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  10174c:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  101750:	ee                   	out    %al,(%dx)
}
  101751:	90                   	nop
    }
}
  101752:	90                   	nop
  101753:	c9                   	leave  
  101754:	c3                   	ret    

00101755 <pic_enable>:

void
pic_enable(unsigned int irq) {
  101755:	f3 0f 1e fb          	endbr32 
  101759:	55                   	push   %ebp
  10175a:	89 e5                	mov    %esp,%ebp
  10175c:	83 ec 04             	sub    $0x4,%esp
    pic_setmask(irq_mask & ~(1 << irq));
  10175f:	8b 45 08             	mov    0x8(%ebp),%eax
  101762:	ba 01 00 00 00       	mov    $0x1,%edx
  101767:	88 c1                	mov    %al,%cl
  101769:	d3 e2                	shl    %cl,%edx
  10176b:	89 d0                	mov    %edx,%eax
  10176d:	98                   	cwtl   
  10176e:	f7 d0                	not    %eax
  101770:	0f bf d0             	movswl %ax,%edx
  101773:	0f b7 05 50 f5 10 00 	movzwl 0x10f550,%eax
  10177a:	98                   	cwtl   
  10177b:	21 d0                	and    %edx,%eax
  10177d:	98                   	cwtl   
  10177e:	0f b7 c0             	movzwl %ax,%eax
  101781:	89 04 24             	mov    %eax,(%esp)
  101784:	e8 6d ff ff ff       	call   1016f6 <pic_setmask>
}
  101789:	90                   	nop
  10178a:	c9                   	leave  
  10178b:	c3                   	ret    

0010178c <pic_init>:

/* pic_init - initialize the 8259A interrupt controllers */
void
pic_init(void) {
  10178c:	f3 0f 1e fb          	endbr32 
  101790:	55                   	push   %ebp
  101791:	89 e5                	mov    %esp,%ebp
  101793:	83 ec 44             	sub    $0x44,%esp
    did_init = 1;
  101796:	c7 05 8c 00 11 00 01 	movl   $0x1,0x11008c
  10179d:	00 00 00 
  1017a0:	66 c7 45 ca 21 00    	movw   $0x21,-0x36(%ebp)
  1017a6:	c6 45 c9 ff          	movb   $0xff,-0x37(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1017aa:	0f b6 45 c9          	movzbl -0x37(%ebp),%eax
  1017ae:	0f b7 55 ca          	movzwl -0x36(%ebp),%edx
  1017b2:	ee                   	out    %al,(%dx)
}
  1017b3:	90                   	nop
  1017b4:	66 c7 45 ce a1 00    	movw   $0xa1,-0x32(%ebp)
  1017ba:	c6 45 cd ff          	movb   $0xff,-0x33(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1017be:	0f b6 45 cd          	movzbl -0x33(%ebp),%eax
  1017c2:	0f b7 55 ce          	movzwl -0x32(%ebp),%edx
  1017c6:	ee                   	out    %al,(%dx)
}
  1017c7:	90                   	nop
  1017c8:	66 c7 45 d2 20 00    	movw   $0x20,-0x2e(%ebp)
  1017ce:	c6 45 d1 11          	movb   $0x11,-0x2f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1017d2:	0f b6 45 d1          	movzbl -0x2f(%ebp),%eax
  1017d6:	0f b7 55 d2          	movzwl -0x2e(%ebp),%edx
  1017da:	ee                   	out    %al,(%dx)
}
  1017db:	90                   	nop
  1017dc:	66 c7 45 d6 21 00    	movw   $0x21,-0x2a(%ebp)
  1017e2:	c6 45 d5 20          	movb   $0x20,-0x2b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1017e6:	0f b6 45 d5          	movzbl -0x2b(%ebp),%eax
  1017ea:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
  1017ee:	ee                   	out    %al,(%dx)
}
  1017ef:	90                   	nop
  1017f0:	66 c7 45 da 21 00    	movw   $0x21,-0x26(%ebp)
  1017f6:	c6 45 d9 04          	movb   $0x4,-0x27(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1017fa:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
  1017fe:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  101802:	ee                   	out    %al,(%dx)
}
  101803:	90                   	nop
  101804:	66 c7 45 de 21 00    	movw   $0x21,-0x22(%ebp)
  10180a:	c6 45 dd 03          	movb   $0x3,-0x23(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10180e:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  101812:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  101816:	ee                   	out    %al,(%dx)
}
  101817:	90                   	nop
  101818:	66 c7 45 e2 a0 00    	movw   $0xa0,-0x1e(%ebp)
  10181e:	c6 45 e1 11          	movb   $0x11,-0x1f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101822:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  101826:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  10182a:	ee                   	out    %al,(%dx)
}
  10182b:	90                   	nop
  10182c:	66 c7 45 e6 a1 00    	movw   $0xa1,-0x1a(%ebp)
  101832:	c6 45 e5 28          	movb   $0x28,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101836:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  10183a:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  10183e:	ee                   	out    %al,(%dx)
}
  10183f:	90                   	nop
  101840:	66 c7 45 ea a1 00    	movw   $0xa1,-0x16(%ebp)
  101846:	c6 45 e9 02          	movb   $0x2,-0x17(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10184a:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  10184e:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  101852:	ee                   	out    %al,(%dx)
}
  101853:	90                   	nop
  101854:	66 c7 45 ee a1 00    	movw   $0xa1,-0x12(%ebp)
  10185a:	c6 45 ed 03          	movb   $0x3,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10185e:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  101862:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  101866:	ee                   	out    %al,(%dx)
}
  101867:	90                   	nop
  101868:	66 c7 45 f2 20 00    	movw   $0x20,-0xe(%ebp)
  10186e:	c6 45 f1 68          	movb   $0x68,-0xf(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101872:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  101876:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  10187a:	ee                   	out    %al,(%dx)
}
  10187b:	90                   	nop
  10187c:	66 c7 45 f6 20 00    	movw   $0x20,-0xa(%ebp)
  101882:	c6 45 f5 0a          	movb   $0xa,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101886:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  10188a:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  10188e:	ee                   	out    %al,(%dx)
}
  10188f:	90                   	nop
  101890:	66 c7 45 fa a0 00    	movw   $0xa0,-0x6(%ebp)
  101896:	c6 45 f9 68          	movb   $0x68,-0x7(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10189a:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  10189e:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  1018a2:	ee                   	out    %al,(%dx)
}
  1018a3:	90                   	nop
  1018a4:	66 c7 45 fe a0 00    	movw   $0xa0,-0x2(%ebp)
  1018aa:	c6 45 fd 0a          	movb   $0xa,-0x3(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1018ae:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  1018b2:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  1018b6:	ee                   	out    %al,(%dx)
}
  1018b7:	90                   	nop
    outb(IO_PIC1, 0x0a);    // read IRR by default

    outb(IO_PIC2, 0x68);    // OCW3
    outb(IO_PIC2, 0x0a);    // OCW3

    if (irq_mask != 0xFFFF) {
  1018b8:	0f b7 05 50 f5 10 00 	movzwl 0x10f550,%eax
  1018bf:	3d ff ff 00 00       	cmp    $0xffff,%eax
  1018c4:	74 0f                	je     1018d5 <pic_init+0x149>
        pic_setmask(irq_mask);
  1018c6:	0f b7 05 50 f5 10 00 	movzwl 0x10f550,%eax
  1018cd:	89 04 24             	mov    %eax,(%esp)
  1018d0:	e8 21 fe ff ff       	call   1016f6 <pic_setmask>
    }
}
  1018d5:	90                   	nop
  1018d6:	c9                   	leave  
  1018d7:	c3                   	ret    

001018d8 <intr_enable>:
#include <x86.h>
#include <intr.h>

/* intr_enable - enable irq interrupt */
void
intr_enable(void) {
  1018d8:	f3 0f 1e fb          	endbr32 
  1018dc:	55                   	push   %ebp
  1018dd:	89 e5                	mov    %esp,%ebp
    asm volatile ("lidt (%0)" :: "r" (pd));
}

static inline void
sti(void) {
    asm volatile ("sti");
  1018df:	fb                   	sti    
}
  1018e0:	90                   	nop
    sti();
}
  1018e1:	90                   	nop
  1018e2:	5d                   	pop    %ebp
  1018e3:	c3                   	ret    

001018e4 <intr_disable>:

/* intr_disable - disable irq interrupt */
void
intr_disable(void) {
  1018e4:	f3 0f 1e fb          	endbr32 
  1018e8:	55                   	push   %ebp
  1018e9:	89 e5                	mov    %esp,%ebp

static inline void
cli(void) {
    asm volatile ("cli");
  1018eb:	fa                   	cli    
}
  1018ec:	90                   	nop
    cli();
}
  1018ed:	90                   	nop
  1018ee:	5d                   	pop    %ebp
  1018ef:	c3                   	ret    

001018f0 <print_ticks>:
#include <console.h>
#include <kdebug.h>

#define TICK_NUM 100

static void print_ticks() {
  1018f0:	f3 0f 1e fb          	endbr32 
  1018f4:	55                   	push   %ebp
  1018f5:	89 e5                	mov    %esp,%ebp
  1018f7:	83 ec 18             	sub    $0x18,%esp
    cprintf("%d ticks\n",TICK_NUM);
  1018fa:	c7 44 24 04 64 00 00 	movl   $0x64,0x4(%esp)
  101901:	00 
  101902:	c7 04 24 60 39 10 00 	movl   $0x103960,(%esp)
  101909:	e8 76 e9 ff ff       	call   100284 <cprintf>
#ifdef DEBUG_GRADE
    cprintf("End of Test.\n");
  10190e:	c7 04 24 6a 39 10 00 	movl   $0x10396a,(%esp)
  101915:	e8 6a e9 ff ff       	call   100284 <cprintf>
    panic("EOT: kernel seems ok.");
  10191a:	c7 44 24 08 78 39 10 	movl   $0x103978,0x8(%esp)
  101921:	00 
  101922:	c7 44 24 04 12 00 00 	movl   $0x12,0x4(%esp)
  101929:	00 
  10192a:	c7 04 24 8e 39 10 00 	movl   $0x10398e,(%esp)
  101931:	e8 ba ea ff ff       	call   1003f0 <__panic>

00101936 <idt_init>:
    sizeof(idt) - 1, (uintptr_t)idt
};

/* idt_init - initialize IDT to each of the entry points in kern/trap/vectors.S */
void
idt_init(void) {
  101936:	f3 0f 1e fb          	endbr32 
  10193a:	55                   	push   %ebp
  10193b:	89 e5                	mov    %esp,%ebp
  10193d:	83 ec 10             	sub    $0x10,%esp
      *     You don't know the meaning of this instruction? just google it! and check the libs/x86.h to know more.
      *     Notice: the argument of lidt is idt_pd. try to find it!
      */
       extern uintptr_t __vectors[];
        int i;
        for (i = 0; i < sizeof(idt) / sizeof(struct gatedesc); i ++) {
  101940:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  101947:	e9 c4 00 00 00       	jmp    101a10 <idt_init+0xda>
            SETGATE(idt[i], 0, GD_KTEXT, __vectors[i], DPL_KERNEL);
  10194c:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10194f:	8b 04 85 e0 f5 10 00 	mov    0x10f5e0(,%eax,4),%eax
  101956:	0f b7 d0             	movzwl %ax,%edx
  101959:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10195c:	66 89 14 c5 a0 00 11 	mov    %dx,0x1100a0(,%eax,8)
  101963:	00 
  101964:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101967:	66 c7 04 c5 a2 00 11 	movw   $0x8,0x1100a2(,%eax,8)
  10196e:	00 08 00 
  101971:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101974:	0f b6 14 c5 a4 00 11 	movzbl 0x1100a4(,%eax,8),%edx
  10197b:	00 
  10197c:	80 e2 e0             	and    $0xe0,%dl
  10197f:	88 14 c5 a4 00 11 00 	mov    %dl,0x1100a4(,%eax,8)
  101986:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101989:	0f b6 14 c5 a4 00 11 	movzbl 0x1100a4(,%eax,8),%edx
  101990:	00 
  101991:	80 e2 1f             	and    $0x1f,%dl
  101994:	88 14 c5 a4 00 11 00 	mov    %dl,0x1100a4(,%eax,8)
  10199b:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10199e:	0f b6 14 c5 a5 00 11 	movzbl 0x1100a5(,%eax,8),%edx
  1019a5:	00 
  1019a6:	80 e2 f0             	and    $0xf0,%dl
  1019a9:	80 ca 0e             	or     $0xe,%dl
  1019ac:	88 14 c5 a5 00 11 00 	mov    %dl,0x1100a5(,%eax,8)
  1019b3:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1019b6:	0f b6 14 c5 a5 00 11 	movzbl 0x1100a5(,%eax,8),%edx
  1019bd:	00 
  1019be:	80 e2 ef             	and    $0xef,%dl
  1019c1:	88 14 c5 a5 00 11 00 	mov    %dl,0x1100a5(,%eax,8)
  1019c8:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1019cb:	0f b6 14 c5 a5 00 11 	movzbl 0x1100a5(,%eax,8),%edx
  1019d2:	00 
  1019d3:	80 e2 9f             	and    $0x9f,%dl
  1019d6:	88 14 c5 a5 00 11 00 	mov    %dl,0x1100a5(,%eax,8)
  1019dd:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1019e0:	0f b6 14 c5 a5 00 11 	movzbl 0x1100a5(,%eax,8),%edx
  1019e7:	00 
  1019e8:	80 ca 80             	or     $0x80,%dl
  1019eb:	88 14 c5 a5 00 11 00 	mov    %dl,0x1100a5(,%eax,8)
  1019f2:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1019f5:	8b 04 85 e0 f5 10 00 	mov    0x10f5e0(,%eax,4),%eax
  1019fc:	c1 e8 10             	shr    $0x10,%eax
  1019ff:	0f b7 d0             	movzwl %ax,%edx
  101a02:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101a05:	66 89 14 c5 a6 00 11 	mov    %dx,0x1100a6(,%eax,8)
  101a0c:	00 
        for (i = 0; i < sizeof(idt) / sizeof(struct gatedesc); i ++) {
  101a0d:	ff 45 fc             	incl   -0x4(%ebp)
  101a10:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101a13:	3d ff 00 00 00       	cmp    $0xff,%eax
  101a18:	0f 86 2e ff ff ff    	jbe    10194c <idt_init+0x16>
        }
        // set for switch from user to kernel
        SETGATE(idt[T_SWITCH_TOK], 0, GD_KTEXT, __vectors[T_SWITCH_TOK], DPL_USER);
  101a1e:	a1 c4 f7 10 00       	mov    0x10f7c4,%eax
  101a23:	0f b7 c0             	movzwl %ax,%eax
  101a26:	66 a3 68 04 11 00    	mov    %ax,0x110468
  101a2c:	66 c7 05 6a 04 11 00 	movw   $0x8,0x11046a
  101a33:	08 00 
  101a35:	0f b6 05 6c 04 11 00 	movzbl 0x11046c,%eax
  101a3c:	24 e0                	and    $0xe0,%al
  101a3e:	a2 6c 04 11 00       	mov    %al,0x11046c
  101a43:	0f b6 05 6c 04 11 00 	movzbl 0x11046c,%eax
  101a4a:	24 1f                	and    $0x1f,%al
  101a4c:	a2 6c 04 11 00       	mov    %al,0x11046c
  101a51:	0f b6 05 6d 04 11 00 	movzbl 0x11046d,%eax
  101a58:	24 f0                	and    $0xf0,%al
  101a5a:	0c 0e                	or     $0xe,%al
  101a5c:	a2 6d 04 11 00       	mov    %al,0x11046d
  101a61:	0f b6 05 6d 04 11 00 	movzbl 0x11046d,%eax
  101a68:	24 ef                	and    $0xef,%al
  101a6a:	a2 6d 04 11 00       	mov    %al,0x11046d
  101a6f:	0f b6 05 6d 04 11 00 	movzbl 0x11046d,%eax
  101a76:	0c 60                	or     $0x60,%al
  101a78:	a2 6d 04 11 00       	mov    %al,0x11046d
  101a7d:	0f b6 05 6d 04 11 00 	movzbl 0x11046d,%eax
  101a84:	0c 80                	or     $0x80,%al
  101a86:	a2 6d 04 11 00       	mov    %al,0x11046d
  101a8b:	a1 c4 f7 10 00       	mov    0x10f7c4,%eax
  101a90:	c1 e8 10             	shr    $0x10,%eax
  101a93:	0f b7 c0             	movzwl %ax,%eax
  101a96:	66 a3 6e 04 11 00    	mov    %ax,0x11046e
  101a9c:	c7 45 f8 60 f5 10 00 	movl   $0x10f560,-0x8(%ebp)
    asm volatile ("lidt (%0)" :: "r" (pd));
  101aa3:	8b 45 f8             	mov    -0x8(%ebp),%eax
  101aa6:	0f 01 18             	lidtl  (%eax)
}
  101aa9:	90                   	nop
        // load the IDT
        lidt(&idt_pd);
}
  101aaa:	90                   	nop
  101aab:	c9                   	leave  
  101aac:	c3                   	ret    

00101aad <trapname>:

static const char *
trapname(int trapno) {
  101aad:	f3 0f 1e fb          	endbr32 
  101ab1:	55                   	push   %ebp
  101ab2:	89 e5                	mov    %esp,%ebp
        "Alignment Check",
        "Machine-Check",
        "SIMD Floating-Point Exception"
    };

    if (trapno < sizeof(excnames)/sizeof(const char * const)) {
  101ab4:	8b 45 08             	mov    0x8(%ebp),%eax
  101ab7:	83 f8 13             	cmp    $0x13,%eax
  101aba:	77 0c                	ja     101ac8 <trapname+0x1b>
        return excnames[trapno];
  101abc:	8b 45 08             	mov    0x8(%ebp),%eax
  101abf:	8b 04 85 e0 3c 10 00 	mov    0x103ce0(,%eax,4),%eax
  101ac6:	eb 18                	jmp    101ae0 <trapname+0x33>
    }
    if (trapno >= IRQ_OFFSET && trapno < IRQ_OFFSET + 16) {
  101ac8:	83 7d 08 1f          	cmpl   $0x1f,0x8(%ebp)
  101acc:	7e 0d                	jle    101adb <trapname+0x2e>
  101ace:	83 7d 08 2f          	cmpl   $0x2f,0x8(%ebp)
  101ad2:	7f 07                	jg     101adb <trapname+0x2e>
        return "Hardware Interrupt";
  101ad4:	b8 9f 39 10 00       	mov    $0x10399f,%eax
  101ad9:	eb 05                	jmp    101ae0 <trapname+0x33>
    }
    return "(unknown trap)";
  101adb:	b8 b2 39 10 00       	mov    $0x1039b2,%eax
}
  101ae0:	5d                   	pop    %ebp
  101ae1:	c3                   	ret    

00101ae2 <trap_in_kernel>:

/* trap_in_kernel - test if trap happened in kernel */
bool
trap_in_kernel(struct trapframe *tf) {
  101ae2:	f3 0f 1e fb          	endbr32 
  101ae6:	55                   	push   %ebp
  101ae7:	89 e5                	mov    %esp,%ebp
    return (tf->tf_cs == (uint16_t)KERNEL_CS);
  101ae9:	8b 45 08             	mov    0x8(%ebp),%eax
  101aec:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101af0:	83 f8 08             	cmp    $0x8,%eax
  101af3:	0f 94 c0             	sete   %al
  101af6:	0f b6 c0             	movzbl %al,%eax
}
  101af9:	5d                   	pop    %ebp
  101afa:	c3                   	ret    

00101afb <print_trapframe>:
    "TF", "IF", "DF", "OF", NULL, NULL, "NT", NULL,
    "RF", "VM", "AC", "VIF", "VIP", "ID", NULL, NULL,
};

void
print_trapframe(struct trapframe *tf) {
  101afb:	f3 0f 1e fb          	endbr32 
  101aff:	55                   	push   %ebp
  101b00:	89 e5                	mov    %esp,%ebp
  101b02:	83 ec 28             	sub    $0x28,%esp
    cprintf("trapframe at %p\n", tf);
  101b05:	8b 45 08             	mov    0x8(%ebp),%eax
  101b08:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b0c:	c7 04 24 f3 39 10 00 	movl   $0x1039f3,(%esp)
  101b13:	e8 6c e7 ff ff       	call   100284 <cprintf>
    print_regs(&tf->tf_regs);
  101b18:	8b 45 08             	mov    0x8(%ebp),%eax
  101b1b:	89 04 24             	mov    %eax,(%esp)
  101b1e:	e8 8d 01 00 00       	call   101cb0 <print_regs>
    cprintf("  ds   0x----%04x\n", tf->tf_ds);
  101b23:	8b 45 08             	mov    0x8(%ebp),%eax
  101b26:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
  101b2a:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b2e:	c7 04 24 04 3a 10 00 	movl   $0x103a04,(%esp)
  101b35:	e8 4a e7 ff ff       	call   100284 <cprintf>
    cprintf("  es   0x----%04x\n", tf->tf_es);
  101b3a:	8b 45 08             	mov    0x8(%ebp),%eax
  101b3d:	0f b7 40 28          	movzwl 0x28(%eax),%eax
  101b41:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b45:	c7 04 24 17 3a 10 00 	movl   $0x103a17,(%esp)
  101b4c:	e8 33 e7 ff ff       	call   100284 <cprintf>
    cprintf("  fs   0x----%04x\n", tf->tf_fs);
  101b51:	8b 45 08             	mov    0x8(%ebp),%eax
  101b54:	0f b7 40 24          	movzwl 0x24(%eax),%eax
  101b58:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b5c:	c7 04 24 2a 3a 10 00 	movl   $0x103a2a,(%esp)
  101b63:	e8 1c e7 ff ff       	call   100284 <cprintf>
    cprintf("  gs   0x----%04x\n", tf->tf_gs);
  101b68:	8b 45 08             	mov    0x8(%ebp),%eax
  101b6b:	0f b7 40 20          	movzwl 0x20(%eax),%eax
  101b6f:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b73:	c7 04 24 3d 3a 10 00 	movl   $0x103a3d,(%esp)
  101b7a:	e8 05 e7 ff ff       	call   100284 <cprintf>
    cprintf("  trap 0x%08x %s\n", tf->tf_trapno, trapname(tf->tf_trapno));
  101b7f:	8b 45 08             	mov    0x8(%ebp),%eax
  101b82:	8b 40 30             	mov    0x30(%eax),%eax
  101b85:	89 04 24             	mov    %eax,(%esp)
  101b88:	e8 20 ff ff ff       	call   101aad <trapname>
  101b8d:	8b 55 08             	mov    0x8(%ebp),%edx
  101b90:	8b 52 30             	mov    0x30(%edx),%edx
  101b93:	89 44 24 08          	mov    %eax,0x8(%esp)
  101b97:	89 54 24 04          	mov    %edx,0x4(%esp)
  101b9b:	c7 04 24 50 3a 10 00 	movl   $0x103a50,(%esp)
  101ba2:	e8 dd e6 ff ff       	call   100284 <cprintf>
    cprintf("  err  0x%08x\n", tf->tf_err);
  101ba7:	8b 45 08             	mov    0x8(%ebp),%eax
  101baa:	8b 40 34             	mov    0x34(%eax),%eax
  101bad:	89 44 24 04          	mov    %eax,0x4(%esp)
  101bb1:	c7 04 24 62 3a 10 00 	movl   $0x103a62,(%esp)
  101bb8:	e8 c7 e6 ff ff       	call   100284 <cprintf>
    cprintf("  eip  0x%08x\n", tf->tf_eip);
  101bbd:	8b 45 08             	mov    0x8(%ebp),%eax
  101bc0:	8b 40 38             	mov    0x38(%eax),%eax
  101bc3:	89 44 24 04          	mov    %eax,0x4(%esp)
  101bc7:	c7 04 24 71 3a 10 00 	movl   $0x103a71,(%esp)
  101bce:	e8 b1 e6 ff ff       	call   100284 <cprintf>
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
  101bd3:	8b 45 08             	mov    0x8(%ebp),%eax
  101bd6:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101bda:	89 44 24 04          	mov    %eax,0x4(%esp)
  101bde:	c7 04 24 80 3a 10 00 	movl   $0x103a80,(%esp)
  101be5:	e8 9a e6 ff ff       	call   100284 <cprintf>
    cprintf("  flag 0x%08x ", tf->tf_eflags);
  101bea:	8b 45 08             	mov    0x8(%ebp),%eax
  101bed:	8b 40 40             	mov    0x40(%eax),%eax
  101bf0:	89 44 24 04          	mov    %eax,0x4(%esp)
  101bf4:	c7 04 24 93 3a 10 00 	movl   $0x103a93,(%esp)
  101bfb:	e8 84 e6 ff ff       	call   100284 <cprintf>

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101c00:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  101c07:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  101c0e:	eb 3d                	jmp    101c4d <print_trapframe+0x152>
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL) {
  101c10:	8b 45 08             	mov    0x8(%ebp),%eax
  101c13:	8b 50 40             	mov    0x40(%eax),%edx
  101c16:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101c19:	21 d0                	and    %edx,%eax
  101c1b:	85 c0                	test   %eax,%eax
  101c1d:	74 28                	je     101c47 <print_trapframe+0x14c>
  101c1f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101c22:	8b 04 85 80 f5 10 00 	mov    0x10f580(,%eax,4),%eax
  101c29:	85 c0                	test   %eax,%eax
  101c2b:	74 1a                	je     101c47 <print_trapframe+0x14c>
            cprintf("%s,", IA32flags[i]);
  101c2d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101c30:	8b 04 85 80 f5 10 00 	mov    0x10f580(,%eax,4),%eax
  101c37:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c3b:	c7 04 24 a2 3a 10 00 	movl   $0x103aa2,(%esp)
  101c42:	e8 3d e6 ff ff       	call   100284 <cprintf>
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101c47:	ff 45 f4             	incl   -0xc(%ebp)
  101c4a:	d1 65 f0             	shll   -0x10(%ebp)
  101c4d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101c50:	83 f8 17             	cmp    $0x17,%eax
  101c53:	76 bb                	jbe    101c10 <print_trapframe+0x115>
        }
    }
    cprintf("IOPL=%d\n", (tf->tf_eflags & FL_IOPL_MASK) >> 12);
  101c55:	8b 45 08             	mov    0x8(%ebp),%eax
  101c58:	8b 40 40             	mov    0x40(%eax),%eax
  101c5b:	c1 e8 0c             	shr    $0xc,%eax
  101c5e:	83 e0 03             	and    $0x3,%eax
  101c61:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c65:	c7 04 24 a6 3a 10 00 	movl   $0x103aa6,(%esp)
  101c6c:	e8 13 e6 ff ff       	call   100284 <cprintf>

    if (!trap_in_kernel(tf)) {
  101c71:	8b 45 08             	mov    0x8(%ebp),%eax
  101c74:	89 04 24             	mov    %eax,(%esp)
  101c77:	e8 66 fe ff ff       	call   101ae2 <trap_in_kernel>
  101c7c:	85 c0                	test   %eax,%eax
  101c7e:	75 2d                	jne    101cad <print_trapframe+0x1b2>
        cprintf("  esp  0x%08x\n", tf->tf_esp);
  101c80:	8b 45 08             	mov    0x8(%ebp),%eax
  101c83:	8b 40 44             	mov    0x44(%eax),%eax
  101c86:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c8a:	c7 04 24 af 3a 10 00 	movl   $0x103aaf,(%esp)
  101c91:	e8 ee e5 ff ff       	call   100284 <cprintf>
        cprintf("  ss   0x----%04x\n", tf->tf_ss);
  101c96:	8b 45 08             	mov    0x8(%ebp),%eax
  101c99:	0f b7 40 48          	movzwl 0x48(%eax),%eax
  101c9d:	89 44 24 04          	mov    %eax,0x4(%esp)
  101ca1:	c7 04 24 be 3a 10 00 	movl   $0x103abe,(%esp)
  101ca8:	e8 d7 e5 ff ff       	call   100284 <cprintf>
    }
}
  101cad:	90                   	nop
  101cae:	c9                   	leave  
  101caf:	c3                   	ret    

00101cb0 <print_regs>:

void
print_regs(struct pushregs *regs) {
  101cb0:	f3 0f 1e fb          	endbr32 
  101cb4:	55                   	push   %ebp
  101cb5:	89 e5                	mov    %esp,%ebp
  101cb7:	83 ec 18             	sub    $0x18,%esp
    cprintf("  edi  0x%08x\n", regs->reg_edi);
  101cba:	8b 45 08             	mov    0x8(%ebp),%eax
  101cbd:	8b 00                	mov    (%eax),%eax
  101cbf:	89 44 24 04          	mov    %eax,0x4(%esp)
  101cc3:	c7 04 24 d1 3a 10 00 	movl   $0x103ad1,(%esp)
  101cca:	e8 b5 e5 ff ff       	call   100284 <cprintf>
    cprintf("  esi  0x%08x\n", regs->reg_esi);
  101ccf:	8b 45 08             	mov    0x8(%ebp),%eax
  101cd2:	8b 40 04             	mov    0x4(%eax),%eax
  101cd5:	89 44 24 04          	mov    %eax,0x4(%esp)
  101cd9:	c7 04 24 e0 3a 10 00 	movl   $0x103ae0,(%esp)
  101ce0:	e8 9f e5 ff ff       	call   100284 <cprintf>
    cprintf("  ebp  0x%08x\n", regs->reg_ebp);
  101ce5:	8b 45 08             	mov    0x8(%ebp),%eax
  101ce8:	8b 40 08             	mov    0x8(%eax),%eax
  101ceb:	89 44 24 04          	mov    %eax,0x4(%esp)
  101cef:	c7 04 24 ef 3a 10 00 	movl   $0x103aef,(%esp)
  101cf6:	e8 89 e5 ff ff       	call   100284 <cprintf>
    cprintf("  oesp 0x%08x\n", regs->reg_oesp);
  101cfb:	8b 45 08             	mov    0x8(%ebp),%eax
  101cfe:	8b 40 0c             	mov    0xc(%eax),%eax
  101d01:	89 44 24 04          	mov    %eax,0x4(%esp)
  101d05:	c7 04 24 fe 3a 10 00 	movl   $0x103afe,(%esp)
  101d0c:	e8 73 e5 ff ff       	call   100284 <cprintf>
    cprintf("  ebx  0x%08x\n", regs->reg_ebx);
  101d11:	8b 45 08             	mov    0x8(%ebp),%eax
  101d14:	8b 40 10             	mov    0x10(%eax),%eax
  101d17:	89 44 24 04          	mov    %eax,0x4(%esp)
  101d1b:	c7 04 24 0d 3b 10 00 	movl   $0x103b0d,(%esp)
  101d22:	e8 5d e5 ff ff       	call   100284 <cprintf>
    cprintf("  edx  0x%08x\n", regs->reg_edx);
  101d27:	8b 45 08             	mov    0x8(%ebp),%eax
  101d2a:	8b 40 14             	mov    0x14(%eax),%eax
  101d2d:	89 44 24 04          	mov    %eax,0x4(%esp)
  101d31:	c7 04 24 1c 3b 10 00 	movl   $0x103b1c,(%esp)
  101d38:	e8 47 e5 ff ff       	call   100284 <cprintf>
    cprintf("  ecx  0x%08x\n", regs->reg_ecx);
  101d3d:	8b 45 08             	mov    0x8(%ebp),%eax
  101d40:	8b 40 18             	mov    0x18(%eax),%eax
  101d43:	89 44 24 04          	mov    %eax,0x4(%esp)
  101d47:	c7 04 24 2b 3b 10 00 	movl   $0x103b2b,(%esp)
  101d4e:	e8 31 e5 ff ff       	call   100284 <cprintf>
    cprintf("  eax  0x%08x\n", regs->reg_eax);
  101d53:	8b 45 08             	mov    0x8(%ebp),%eax
  101d56:	8b 40 1c             	mov    0x1c(%eax),%eax
  101d59:	89 44 24 04          	mov    %eax,0x4(%esp)
  101d5d:	c7 04 24 3a 3b 10 00 	movl   $0x103b3a,(%esp)
  101d64:	e8 1b e5 ff ff       	call   100284 <cprintf>
}
  101d69:	90                   	nop
  101d6a:	c9                   	leave  
  101d6b:	c3                   	ret    

00101d6c <trap_dispatch>:

/* trap_dispatch - dispatch based on what type of trap occurred */
static void
trap_dispatch(struct trapframe *tf) {
  101d6c:	f3 0f 1e fb          	endbr32 
  101d70:	55                   	push   %ebp
  101d71:	89 e5                	mov    %esp,%ebp
  101d73:	83 ec 28             	sub    $0x28,%esp
    char c;

    switch (tf->tf_trapno) {
  101d76:	8b 45 08             	mov    0x8(%ebp),%eax
  101d79:	8b 40 30             	mov    0x30(%eax),%eax
  101d7c:	83 f8 79             	cmp    $0x79,%eax
  101d7f:	0f 87 e6 00 00 00    	ja     101e6b <trap_dispatch+0xff>
  101d85:	83 f8 78             	cmp    $0x78,%eax
  101d88:	0f 83 c1 00 00 00    	jae    101e4f <trap_dispatch+0xe3>
  101d8e:	83 f8 2f             	cmp    $0x2f,%eax
  101d91:	0f 87 d4 00 00 00    	ja     101e6b <trap_dispatch+0xff>
  101d97:	83 f8 2e             	cmp    $0x2e,%eax
  101d9a:	0f 83 00 01 00 00    	jae    101ea0 <trap_dispatch+0x134>
  101da0:	83 f8 24             	cmp    $0x24,%eax
  101da3:	74 5e                	je     101e03 <trap_dispatch+0x97>
  101da5:	83 f8 24             	cmp    $0x24,%eax
  101da8:	0f 87 bd 00 00 00    	ja     101e6b <trap_dispatch+0xff>
  101dae:	83 f8 20             	cmp    $0x20,%eax
  101db1:	74 0a                	je     101dbd <trap_dispatch+0x51>
  101db3:	83 f8 21             	cmp    $0x21,%eax
  101db6:	74 71                	je     101e29 <trap_dispatch+0xbd>
  101db8:	e9 ae 00 00 00       	jmp    101e6b <trap_dispatch+0xff>
        /* handle the timer interrupt */
        /* (1) After a timer interrupt, you should record this event using a global variable (increase it), such as ticks in kern/driver/clock.c
         * (2) Every TICK_NUM cycle, you can print some info using a funciton, such as print_ticks().
         * (3) Too Simple? Yes, I think so!
         */
         ticks ++;
  101dbd:	a1 08 09 11 00       	mov    0x110908,%eax
  101dc2:	40                   	inc    %eax
  101dc3:	a3 08 09 11 00       	mov    %eax,0x110908
        if (ticks % TICK_NUM == 0) {
  101dc8:	8b 0d 08 09 11 00    	mov    0x110908,%ecx
  101dce:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
  101dd3:	89 c8                	mov    %ecx,%eax
  101dd5:	f7 e2                	mul    %edx
  101dd7:	c1 ea 05             	shr    $0x5,%edx
  101dda:	89 d0                	mov    %edx,%eax
  101ddc:	c1 e0 02             	shl    $0x2,%eax
  101ddf:	01 d0                	add    %edx,%eax
  101de1:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  101de8:	01 d0                	add    %edx,%eax
  101dea:	c1 e0 02             	shl    $0x2,%eax
  101ded:	29 c1                	sub    %eax,%ecx
  101def:	89 ca                	mov    %ecx,%edx
  101df1:	85 d2                	test   %edx,%edx
  101df3:	0f 85 aa 00 00 00    	jne    101ea3 <trap_dispatch+0x137>
            print_ticks();
  101df9:	e8 f2 fa ff ff       	call   1018f0 <print_ticks>
        }
        break;
  101dfe:	e9 a0 00 00 00       	jmp    101ea3 <trap_dispatch+0x137>
    case IRQ_OFFSET + IRQ_COM1:
        c = cons_getc();
  101e03:	e8 8e f8 ff ff       	call   101696 <cons_getc>
  101e08:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("serial [%03d] %c\n", c, c);
  101e0b:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  101e0f:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  101e13:	89 54 24 08          	mov    %edx,0x8(%esp)
  101e17:	89 44 24 04          	mov    %eax,0x4(%esp)
  101e1b:	c7 04 24 49 3b 10 00 	movl   $0x103b49,(%esp)
  101e22:	e8 5d e4 ff ff       	call   100284 <cprintf>
        break;
  101e27:	eb 7b                	jmp    101ea4 <trap_dispatch+0x138>
    case IRQ_OFFSET + IRQ_KBD:
        c = cons_getc();
  101e29:	e8 68 f8 ff ff       	call   101696 <cons_getc>
  101e2e:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("kbd [%03d] %c\n", c, c);
  101e31:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  101e35:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  101e39:	89 54 24 08          	mov    %edx,0x8(%esp)
  101e3d:	89 44 24 04          	mov    %eax,0x4(%esp)
  101e41:	c7 04 24 5b 3b 10 00 	movl   $0x103b5b,(%esp)
  101e48:	e8 37 e4 ff ff       	call   100284 <cprintf>
        break;
  101e4d:	eb 55                	jmp    101ea4 <trap_dispatch+0x138>
    //LAB1 CHALLENGE 1 : YOUR CODE you should modify below codes.
    case T_SWITCH_TOU:
    case T_SWITCH_TOK:
        panic("T_SWITCH_** ??\n");
  101e4f:	c7 44 24 08 6a 3b 10 	movl   $0x103b6a,0x8(%esp)
  101e56:	00 
  101e57:	c7 44 24 04 af 00 00 	movl   $0xaf,0x4(%esp)
  101e5e:	00 
  101e5f:	c7 04 24 8e 39 10 00 	movl   $0x10398e,(%esp)
  101e66:	e8 85 e5 ff ff       	call   1003f0 <__panic>
    case IRQ_OFFSET + IRQ_IDE2:
        /* do nothing */
        break;
    default:
        // in kernel, it must be a mistake
        if ((tf->tf_cs & 3) == 0) {
  101e6b:	8b 45 08             	mov    0x8(%ebp),%eax
  101e6e:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101e72:	83 e0 03             	and    $0x3,%eax
  101e75:	85 c0                	test   %eax,%eax
  101e77:	75 2b                	jne    101ea4 <trap_dispatch+0x138>
            print_trapframe(tf);
  101e79:	8b 45 08             	mov    0x8(%ebp),%eax
  101e7c:	89 04 24             	mov    %eax,(%esp)
  101e7f:	e8 77 fc ff ff       	call   101afb <print_trapframe>
            panic("unexpected trap in kernel.\n");
  101e84:	c7 44 24 08 7a 3b 10 	movl   $0x103b7a,0x8(%esp)
  101e8b:	00 
  101e8c:	c7 44 24 04 b9 00 00 	movl   $0xb9,0x4(%esp)
  101e93:	00 
  101e94:	c7 04 24 8e 39 10 00 	movl   $0x10398e,(%esp)
  101e9b:	e8 50 e5 ff ff       	call   1003f0 <__panic>
        break;
  101ea0:	90                   	nop
  101ea1:	eb 01                	jmp    101ea4 <trap_dispatch+0x138>
        break;
  101ea3:	90                   	nop
        }
    }
}
  101ea4:	90                   	nop
  101ea5:	c9                   	leave  
  101ea6:	c3                   	ret    

00101ea7 <trap>:
 * trap - handles or dispatches an exception/interrupt. if and when trap() returns,
 * the code in kern/trap/trapentry.S restores the old CPU state saved in the
 * trapframe and then uses the iret instruction to return from the exception.
 * */
void
trap(struct trapframe *tf) {
  101ea7:	f3 0f 1e fb          	endbr32 
  101eab:	55                   	push   %ebp
  101eac:	89 e5                	mov    %esp,%ebp
  101eae:	83 ec 18             	sub    $0x18,%esp
    // dispatch based on what type of trap occurred
    trap_dispatch(tf);
  101eb1:	8b 45 08             	mov    0x8(%ebp),%eax
  101eb4:	89 04 24             	mov    %eax,(%esp)
  101eb7:	e8 b0 fe ff ff       	call   101d6c <trap_dispatch>
}
  101ebc:	90                   	nop
  101ebd:	c9                   	leave  
  101ebe:	c3                   	ret    

00101ebf <vector0>:
# handler
.text
.globl __alltraps
.globl vector0
vector0:
  pushl $0
  101ebf:	6a 00                	push   $0x0
  pushl $0
  101ec1:	6a 00                	push   $0x0
  jmp __alltraps
  101ec3:	e9 69 0a 00 00       	jmp    102931 <__alltraps>

00101ec8 <vector1>:
.globl vector1
vector1:
  pushl $0
  101ec8:	6a 00                	push   $0x0
  pushl $1
  101eca:	6a 01                	push   $0x1
  jmp __alltraps
  101ecc:	e9 60 0a 00 00       	jmp    102931 <__alltraps>

00101ed1 <vector2>:
.globl vector2
vector2:
  pushl $0
  101ed1:	6a 00                	push   $0x0
  pushl $2
  101ed3:	6a 02                	push   $0x2
  jmp __alltraps
  101ed5:	e9 57 0a 00 00       	jmp    102931 <__alltraps>

00101eda <vector3>:
.globl vector3
vector3:
  pushl $0
  101eda:	6a 00                	push   $0x0
  pushl $3
  101edc:	6a 03                	push   $0x3
  jmp __alltraps
  101ede:	e9 4e 0a 00 00       	jmp    102931 <__alltraps>

00101ee3 <vector4>:
.globl vector4
vector4:
  pushl $0
  101ee3:	6a 00                	push   $0x0
  pushl $4
  101ee5:	6a 04                	push   $0x4
  jmp __alltraps
  101ee7:	e9 45 0a 00 00       	jmp    102931 <__alltraps>

00101eec <vector5>:
.globl vector5
vector5:
  pushl $0
  101eec:	6a 00                	push   $0x0
  pushl $5
  101eee:	6a 05                	push   $0x5
  jmp __alltraps
  101ef0:	e9 3c 0a 00 00       	jmp    102931 <__alltraps>

00101ef5 <vector6>:
.globl vector6
vector6:
  pushl $0
  101ef5:	6a 00                	push   $0x0
  pushl $6
  101ef7:	6a 06                	push   $0x6
  jmp __alltraps
  101ef9:	e9 33 0a 00 00       	jmp    102931 <__alltraps>

00101efe <vector7>:
.globl vector7
vector7:
  pushl $0
  101efe:	6a 00                	push   $0x0
  pushl $7
  101f00:	6a 07                	push   $0x7
  jmp __alltraps
  101f02:	e9 2a 0a 00 00       	jmp    102931 <__alltraps>

00101f07 <vector8>:
.globl vector8
vector8:
  pushl $8
  101f07:	6a 08                	push   $0x8
  jmp __alltraps
  101f09:	e9 23 0a 00 00       	jmp    102931 <__alltraps>

00101f0e <vector9>:
.globl vector9
vector9:
  pushl $0
  101f0e:	6a 00                	push   $0x0
  pushl $9
  101f10:	6a 09                	push   $0x9
  jmp __alltraps
  101f12:	e9 1a 0a 00 00       	jmp    102931 <__alltraps>

00101f17 <vector10>:
.globl vector10
vector10:
  pushl $10
  101f17:	6a 0a                	push   $0xa
  jmp __alltraps
  101f19:	e9 13 0a 00 00       	jmp    102931 <__alltraps>

00101f1e <vector11>:
.globl vector11
vector11:
  pushl $11
  101f1e:	6a 0b                	push   $0xb
  jmp __alltraps
  101f20:	e9 0c 0a 00 00       	jmp    102931 <__alltraps>

00101f25 <vector12>:
.globl vector12
vector12:
  pushl $12
  101f25:	6a 0c                	push   $0xc
  jmp __alltraps
  101f27:	e9 05 0a 00 00       	jmp    102931 <__alltraps>

00101f2c <vector13>:
.globl vector13
vector13:
  pushl $13
  101f2c:	6a 0d                	push   $0xd
  jmp __alltraps
  101f2e:	e9 fe 09 00 00       	jmp    102931 <__alltraps>

00101f33 <vector14>:
.globl vector14
vector14:
  pushl $14
  101f33:	6a 0e                	push   $0xe
  jmp __alltraps
  101f35:	e9 f7 09 00 00       	jmp    102931 <__alltraps>

00101f3a <vector15>:
.globl vector15
vector15:
  pushl $0
  101f3a:	6a 00                	push   $0x0
  pushl $15
  101f3c:	6a 0f                	push   $0xf
  jmp __alltraps
  101f3e:	e9 ee 09 00 00       	jmp    102931 <__alltraps>

00101f43 <vector16>:
.globl vector16
vector16:
  pushl $0
  101f43:	6a 00                	push   $0x0
  pushl $16
  101f45:	6a 10                	push   $0x10
  jmp __alltraps
  101f47:	e9 e5 09 00 00       	jmp    102931 <__alltraps>

00101f4c <vector17>:
.globl vector17
vector17:
  pushl $17
  101f4c:	6a 11                	push   $0x11
  jmp __alltraps
  101f4e:	e9 de 09 00 00       	jmp    102931 <__alltraps>

00101f53 <vector18>:
.globl vector18
vector18:
  pushl $0
  101f53:	6a 00                	push   $0x0
  pushl $18
  101f55:	6a 12                	push   $0x12
  jmp __alltraps
  101f57:	e9 d5 09 00 00       	jmp    102931 <__alltraps>

00101f5c <vector19>:
.globl vector19
vector19:
  pushl $0
  101f5c:	6a 00                	push   $0x0
  pushl $19
  101f5e:	6a 13                	push   $0x13
  jmp __alltraps
  101f60:	e9 cc 09 00 00       	jmp    102931 <__alltraps>

00101f65 <vector20>:
.globl vector20
vector20:
  pushl $0
  101f65:	6a 00                	push   $0x0
  pushl $20
  101f67:	6a 14                	push   $0x14
  jmp __alltraps
  101f69:	e9 c3 09 00 00       	jmp    102931 <__alltraps>

00101f6e <vector21>:
.globl vector21
vector21:
  pushl $0
  101f6e:	6a 00                	push   $0x0
  pushl $21
  101f70:	6a 15                	push   $0x15
  jmp __alltraps
  101f72:	e9 ba 09 00 00       	jmp    102931 <__alltraps>

00101f77 <vector22>:
.globl vector22
vector22:
  pushl $0
  101f77:	6a 00                	push   $0x0
  pushl $22
  101f79:	6a 16                	push   $0x16
  jmp __alltraps
  101f7b:	e9 b1 09 00 00       	jmp    102931 <__alltraps>

00101f80 <vector23>:
.globl vector23
vector23:
  pushl $0
  101f80:	6a 00                	push   $0x0
  pushl $23
  101f82:	6a 17                	push   $0x17
  jmp __alltraps
  101f84:	e9 a8 09 00 00       	jmp    102931 <__alltraps>

00101f89 <vector24>:
.globl vector24
vector24:
  pushl $0
  101f89:	6a 00                	push   $0x0
  pushl $24
  101f8b:	6a 18                	push   $0x18
  jmp __alltraps
  101f8d:	e9 9f 09 00 00       	jmp    102931 <__alltraps>

00101f92 <vector25>:
.globl vector25
vector25:
  pushl $0
  101f92:	6a 00                	push   $0x0
  pushl $25
  101f94:	6a 19                	push   $0x19
  jmp __alltraps
  101f96:	e9 96 09 00 00       	jmp    102931 <__alltraps>

00101f9b <vector26>:
.globl vector26
vector26:
  pushl $0
  101f9b:	6a 00                	push   $0x0
  pushl $26
  101f9d:	6a 1a                	push   $0x1a
  jmp __alltraps
  101f9f:	e9 8d 09 00 00       	jmp    102931 <__alltraps>

00101fa4 <vector27>:
.globl vector27
vector27:
  pushl $0
  101fa4:	6a 00                	push   $0x0
  pushl $27
  101fa6:	6a 1b                	push   $0x1b
  jmp __alltraps
  101fa8:	e9 84 09 00 00       	jmp    102931 <__alltraps>

00101fad <vector28>:
.globl vector28
vector28:
  pushl $0
  101fad:	6a 00                	push   $0x0
  pushl $28
  101faf:	6a 1c                	push   $0x1c
  jmp __alltraps
  101fb1:	e9 7b 09 00 00       	jmp    102931 <__alltraps>

00101fb6 <vector29>:
.globl vector29
vector29:
  pushl $0
  101fb6:	6a 00                	push   $0x0
  pushl $29
  101fb8:	6a 1d                	push   $0x1d
  jmp __alltraps
  101fba:	e9 72 09 00 00       	jmp    102931 <__alltraps>

00101fbf <vector30>:
.globl vector30
vector30:
  pushl $0
  101fbf:	6a 00                	push   $0x0
  pushl $30
  101fc1:	6a 1e                	push   $0x1e
  jmp __alltraps
  101fc3:	e9 69 09 00 00       	jmp    102931 <__alltraps>

00101fc8 <vector31>:
.globl vector31
vector31:
  pushl $0
  101fc8:	6a 00                	push   $0x0
  pushl $31
  101fca:	6a 1f                	push   $0x1f
  jmp __alltraps
  101fcc:	e9 60 09 00 00       	jmp    102931 <__alltraps>

00101fd1 <vector32>:
.globl vector32
vector32:
  pushl $0
  101fd1:	6a 00                	push   $0x0
  pushl $32
  101fd3:	6a 20                	push   $0x20
  jmp __alltraps
  101fd5:	e9 57 09 00 00       	jmp    102931 <__alltraps>

00101fda <vector33>:
.globl vector33
vector33:
  pushl $0
  101fda:	6a 00                	push   $0x0
  pushl $33
  101fdc:	6a 21                	push   $0x21
  jmp __alltraps
  101fde:	e9 4e 09 00 00       	jmp    102931 <__alltraps>

00101fe3 <vector34>:
.globl vector34
vector34:
  pushl $0
  101fe3:	6a 00                	push   $0x0
  pushl $34
  101fe5:	6a 22                	push   $0x22
  jmp __alltraps
  101fe7:	e9 45 09 00 00       	jmp    102931 <__alltraps>

00101fec <vector35>:
.globl vector35
vector35:
  pushl $0
  101fec:	6a 00                	push   $0x0
  pushl $35
  101fee:	6a 23                	push   $0x23
  jmp __alltraps
  101ff0:	e9 3c 09 00 00       	jmp    102931 <__alltraps>

00101ff5 <vector36>:
.globl vector36
vector36:
  pushl $0
  101ff5:	6a 00                	push   $0x0
  pushl $36
  101ff7:	6a 24                	push   $0x24
  jmp __alltraps
  101ff9:	e9 33 09 00 00       	jmp    102931 <__alltraps>

00101ffe <vector37>:
.globl vector37
vector37:
  pushl $0
  101ffe:	6a 00                	push   $0x0
  pushl $37
  102000:	6a 25                	push   $0x25
  jmp __alltraps
  102002:	e9 2a 09 00 00       	jmp    102931 <__alltraps>

00102007 <vector38>:
.globl vector38
vector38:
  pushl $0
  102007:	6a 00                	push   $0x0
  pushl $38
  102009:	6a 26                	push   $0x26
  jmp __alltraps
  10200b:	e9 21 09 00 00       	jmp    102931 <__alltraps>

00102010 <vector39>:
.globl vector39
vector39:
  pushl $0
  102010:	6a 00                	push   $0x0
  pushl $39
  102012:	6a 27                	push   $0x27
  jmp __alltraps
  102014:	e9 18 09 00 00       	jmp    102931 <__alltraps>

00102019 <vector40>:
.globl vector40
vector40:
  pushl $0
  102019:	6a 00                	push   $0x0
  pushl $40
  10201b:	6a 28                	push   $0x28
  jmp __alltraps
  10201d:	e9 0f 09 00 00       	jmp    102931 <__alltraps>

00102022 <vector41>:
.globl vector41
vector41:
  pushl $0
  102022:	6a 00                	push   $0x0
  pushl $41
  102024:	6a 29                	push   $0x29
  jmp __alltraps
  102026:	e9 06 09 00 00       	jmp    102931 <__alltraps>

0010202b <vector42>:
.globl vector42
vector42:
  pushl $0
  10202b:	6a 00                	push   $0x0
  pushl $42
  10202d:	6a 2a                	push   $0x2a
  jmp __alltraps
  10202f:	e9 fd 08 00 00       	jmp    102931 <__alltraps>

00102034 <vector43>:
.globl vector43
vector43:
  pushl $0
  102034:	6a 00                	push   $0x0
  pushl $43
  102036:	6a 2b                	push   $0x2b
  jmp __alltraps
  102038:	e9 f4 08 00 00       	jmp    102931 <__alltraps>

0010203d <vector44>:
.globl vector44
vector44:
  pushl $0
  10203d:	6a 00                	push   $0x0
  pushl $44
  10203f:	6a 2c                	push   $0x2c
  jmp __alltraps
  102041:	e9 eb 08 00 00       	jmp    102931 <__alltraps>

00102046 <vector45>:
.globl vector45
vector45:
  pushl $0
  102046:	6a 00                	push   $0x0
  pushl $45
  102048:	6a 2d                	push   $0x2d
  jmp __alltraps
  10204a:	e9 e2 08 00 00       	jmp    102931 <__alltraps>

0010204f <vector46>:
.globl vector46
vector46:
  pushl $0
  10204f:	6a 00                	push   $0x0
  pushl $46
  102051:	6a 2e                	push   $0x2e
  jmp __alltraps
  102053:	e9 d9 08 00 00       	jmp    102931 <__alltraps>

00102058 <vector47>:
.globl vector47
vector47:
  pushl $0
  102058:	6a 00                	push   $0x0
  pushl $47
  10205a:	6a 2f                	push   $0x2f
  jmp __alltraps
  10205c:	e9 d0 08 00 00       	jmp    102931 <__alltraps>

00102061 <vector48>:
.globl vector48
vector48:
  pushl $0
  102061:	6a 00                	push   $0x0
  pushl $48
  102063:	6a 30                	push   $0x30
  jmp __alltraps
  102065:	e9 c7 08 00 00       	jmp    102931 <__alltraps>

0010206a <vector49>:
.globl vector49
vector49:
  pushl $0
  10206a:	6a 00                	push   $0x0
  pushl $49
  10206c:	6a 31                	push   $0x31
  jmp __alltraps
  10206e:	e9 be 08 00 00       	jmp    102931 <__alltraps>

00102073 <vector50>:
.globl vector50
vector50:
  pushl $0
  102073:	6a 00                	push   $0x0
  pushl $50
  102075:	6a 32                	push   $0x32
  jmp __alltraps
  102077:	e9 b5 08 00 00       	jmp    102931 <__alltraps>

0010207c <vector51>:
.globl vector51
vector51:
  pushl $0
  10207c:	6a 00                	push   $0x0
  pushl $51
  10207e:	6a 33                	push   $0x33
  jmp __alltraps
  102080:	e9 ac 08 00 00       	jmp    102931 <__alltraps>

00102085 <vector52>:
.globl vector52
vector52:
  pushl $0
  102085:	6a 00                	push   $0x0
  pushl $52
  102087:	6a 34                	push   $0x34
  jmp __alltraps
  102089:	e9 a3 08 00 00       	jmp    102931 <__alltraps>

0010208e <vector53>:
.globl vector53
vector53:
  pushl $0
  10208e:	6a 00                	push   $0x0
  pushl $53
  102090:	6a 35                	push   $0x35
  jmp __alltraps
  102092:	e9 9a 08 00 00       	jmp    102931 <__alltraps>

00102097 <vector54>:
.globl vector54
vector54:
  pushl $0
  102097:	6a 00                	push   $0x0
  pushl $54
  102099:	6a 36                	push   $0x36
  jmp __alltraps
  10209b:	e9 91 08 00 00       	jmp    102931 <__alltraps>

001020a0 <vector55>:
.globl vector55
vector55:
  pushl $0
  1020a0:	6a 00                	push   $0x0
  pushl $55
  1020a2:	6a 37                	push   $0x37
  jmp __alltraps
  1020a4:	e9 88 08 00 00       	jmp    102931 <__alltraps>

001020a9 <vector56>:
.globl vector56
vector56:
  pushl $0
  1020a9:	6a 00                	push   $0x0
  pushl $56
  1020ab:	6a 38                	push   $0x38
  jmp __alltraps
  1020ad:	e9 7f 08 00 00       	jmp    102931 <__alltraps>

001020b2 <vector57>:
.globl vector57
vector57:
  pushl $0
  1020b2:	6a 00                	push   $0x0
  pushl $57
  1020b4:	6a 39                	push   $0x39
  jmp __alltraps
  1020b6:	e9 76 08 00 00       	jmp    102931 <__alltraps>

001020bb <vector58>:
.globl vector58
vector58:
  pushl $0
  1020bb:	6a 00                	push   $0x0
  pushl $58
  1020bd:	6a 3a                	push   $0x3a
  jmp __alltraps
  1020bf:	e9 6d 08 00 00       	jmp    102931 <__alltraps>

001020c4 <vector59>:
.globl vector59
vector59:
  pushl $0
  1020c4:	6a 00                	push   $0x0
  pushl $59
  1020c6:	6a 3b                	push   $0x3b
  jmp __alltraps
  1020c8:	e9 64 08 00 00       	jmp    102931 <__alltraps>

001020cd <vector60>:
.globl vector60
vector60:
  pushl $0
  1020cd:	6a 00                	push   $0x0
  pushl $60
  1020cf:	6a 3c                	push   $0x3c
  jmp __alltraps
  1020d1:	e9 5b 08 00 00       	jmp    102931 <__alltraps>

001020d6 <vector61>:
.globl vector61
vector61:
  pushl $0
  1020d6:	6a 00                	push   $0x0
  pushl $61
  1020d8:	6a 3d                	push   $0x3d
  jmp __alltraps
  1020da:	e9 52 08 00 00       	jmp    102931 <__alltraps>

001020df <vector62>:
.globl vector62
vector62:
  pushl $0
  1020df:	6a 00                	push   $0x0
  pushl $62
  1020e1:	6a 3e                	push   $0x3e
  jmp __alltraps
  1020e3:	e9 49 08 00 00       	jmp    102931 <__alltraps>

001020e8 <vector63>:
.globl vector63
vector63:
  pushl $0
  1020e8:	6a 00                	push   $0x0
  pushl $63
  1020ea:	6a 3f                	push   $0x3f
  jmp __alltraps
  1020ec:	e9 40 08 00 00       	jmp    102931 <__alltraps>

001020f1 <vector64>:
.globl vector64
vector64:
  pushl $0
  1020f1:	6a 00                	push   $0x0
  pushl $64
  1020f3:	6a 40                	push   $0x40
  jmp __alltraps
  1020f5:	e9 37 08 00 00       	jmp    102931 <__alltraps>

001020fa <vector65>:
.globl vector65
vector65:
  pushl $0
  1020fa:	6a 00                	push   $0x0
  pushl $65
  1020fc:	6a 41                	push   $0x41
  jmp __alltraps
  1020fe:	e9 2e 08 00 00       	jmp    102931 <__alltraps>

00102103 <vector66>:
.globl vector66
vector66:
  pushl $0
  102103:	6a 00                	push   $0x0
  pushl $66
  102105:	6a 42                	push   $0x42
  jmp __alltraps
  102107:	e9 25 08 00 00       	jmp    102931 <__alltraps>

0010210c <vector67>:
.globl vector67
vector67:
  pushl $0
  10210c:	6a 00                	push   $0x0
  pushl $67
  10210e:	6a 43                	push   $0x43
  jmp __alltraps
  102110:	e9 1c 08 00 00       	jmp    102931 <__alltraps>

00102115 <vector68>:
.globl vector68
vector68:
  pushl $0
  102115:	6a 00                	push   $0x0
  pushl $68
  102117:	6a 44                	push   $0x44
  jmp __alltraps
  102119:	e9 13 08 00 00       	jmp    102931 <__alltraps>

0010211e <vector69>:
.globl vector69
vector69:
  pushl $0
  10211e:	6a 00                	push   $0x0
  pushl $69
  102120:	6a 45                	push   $0x45
  jmp __alltraps
  102122:	e9 0a 08 00 00       	jmp    102931 <__alltraps>

00102127 <vector70>:
.globl vector70
vector70:
  pushl $0
  102127:	6a 00                	push   $0x0
  pushl $70
  102129:	6a 46                	push   $0x46
  jmp __alltraps
  10212b:	e9 01 08 00 00       	jmp    102931 <__alltraps>

00102130 <vector71>:
.globl vector71
vector71:
  pushl $0
  102130:	6a 00                	push   $0x0
  pushl $71
  102132:	6a 47                	push   $0x47
  jmp __alltraps
  102134:	e9 f8 07 00 00       	jmp    102931 <__alltraps>

00102139 <vector72>:
.globl vector72
vector72:
  pushl $0
  102139:	6a 00                	push   $0x0
  pushl $72
  10213b:	6a 48                	push   $0x48
  jmp __alltraps
  10213d:	e9 ef 07 00 00       	jmp    102931 <__alltraps>

00102142 <vector73>:
.globl vector73
vector73:
  pushl $0
  102142:	6a 00                	push   $0x0
  pushl $73
  102144:	6a 49                	push   $0x49
  jmp __alltraps
  102146:	e9 e6 07 00 00       	jmp    102931 <__alltraps>

0010214b <vector74>:
.globl vector74
vector74:
  pushl $0
  10214b:	6a 00                	push   $0x0
  pushl $74
  10214d:	6a 4a                	push   $0x4a
  jmp __alltraps
  10214f:	e9 dd 07 00 00       	jmp    102931 <__alltraps>

00102154 <vector75>:
.globl vector75
vector75:
  pushl $0
  102154:	6a 00                	push   $0x0
  pushl $75
  102156:	6a 4b                	push   $0x4b
  jmp __alltraps
  102158:	e9 d4 07 00 00       	jmp    102931 <__alltraps>

0010215d <vector76>:
.globl vector76
vector76:
  pushl $0
  10215d:	6a 00                	push   $0x0
  pushl $76
  10215f:	6a 4c                	push   $0x4c
  jmp __alltraps
  102161:	e9 cb 07 00 00       	jmp    102931 <__alltraps>

00102166 <vector77>:
.globl vector77
vector77:
  pushl $0
  102166:	6a 00                	push   $0x0
  pushl $77
  102168:	6a 4d                	push   $0x4d
  jmp __alltraps
  10216a:	e9 c2 07 00 00       	jmp    102931 <__alltraps>

0010216f <vector78>:
.globl vector78
vector78:
  pushl $0
  10216f:	6a 00                	push   $0x0
  pushl $78
  102171:	6a 4e                	push   $0x4e
  jmp __alltraps
  102173:	e9 b9 07 00 00       	jmp    102931 <__alltraps>

00102178 <vector79>:
.globl vector79
vector79:
  pushl $0
  102178:	6a 00                	push   $0x0
  pushl $79
  10217a:	6a 4f                	push   $0x4f
  jmp __alltraps
  10217c:	e9 b0 07 00 00       	jmp    102931 <__alltraps>

00102181 <vector80>:
.globl vector80
vector80:
  pushl $0
  102181:	6a 00                	push   $0x0
  pushl $80
  102183:	6a 50                	push   $0x50
  jmp __alltraps
  102185:	e9 a7 07 00 00       	jmp    102931 <__alltraps>

0010218a <vector81>:
.globl vector81
vector81:
  pushl $0
  10218a:	6a 00                	push   $0x0
  pushl $81
  10218c:	6a 51                	push   $0x51
  jmp __alltraps
  10218e:	e9 9e 07 00 00       	jmp    102931 <__alltraps>

00102193 <vector82>:
.globl vector82
vector82:
  pushl $0
  102193:	6a 00                	push   $0x0
  pushl $82
  102195:	6a 52                	push   $0x52
  jmp __alltraps
  102197:	e9 95 07 00 00       	jmp    102931 <__alltraps>

0010219c <vector83>:
.globl vector83
vector83:
  pushl $0
  10219c:	6a 00                	push   $0x0
  pushl $83
  10219e:	6a 53                	push   $0x53
  jmp __alltraps
  1021a0:	e9 8c 07 00 00       	jmp    102931 <__alltraps>

001021a5 <vector84>:
.globl vector84
vector84:
  pushl $0
  1021a5:	6a 00                	push   $0x0
  pushl $84
  1021a7:	6a 54                	push   $0x54
  jmp __alltraps
  1021a9:	e9 83 07 00 00       	jmp    102931 <__alltraps>

001021ae <vector85>:
.globl vector85
vector85:
  pushl $0
  1021ae:	6a 00                	push   $0x0
  pushl $85
  1021b0:	6a 55                	push   $0x55
  jmp __alltraps
  1021b2:	e9 7a 07 00 00       	jmp    102931 <__alltraps>

001021b7 <vector86>:
.globl vector86
vector86:
  pushl $0
  1021b7:	6a 00                	push   $0x0
  pushl $86
  1021b9:	6a 56                	push   $0x56
  jmp __alltraps
  1021bb:	e9 71 07 00 00       	jmp    102931 <__alltraps>

001021c0 <vector87>:
.globl vector87
vector87:
  pushl $0
  1021c0:	6a 00                	push   $0x0
  pushl $87
  1021c2:	6a 57                	push   $0x57
  jmp __alltraps
  1021c4:	e9 68 07 00 00       	jmp    102931 <__alltraps>

001021c9 <vector88>:
.globl vector88
vector88:
  pushl $0
  1021c9:	6a 00                	push   $0x0
  pushl $88
  1021cb:	6a 58                	push   $0x58
  jmp __alltraps
  1021cd:	e9 5f 07 00 00       	jmp    102931 <__alltraps>

001021d2 <vector89>:
.globl vector89
vector89:
  pushl $0
  1021d2:	6a 00                	push   $0x0
  pushl $89
  1021d4:	6a 59                	push   $0x59
  jmp __alltraps
  1021d6:	e9 56 07 00 00       	jmp    102931 <__alltraps>

001021db <vector90>:
.globl vector90
vector90:
  pushl $0
  1021db:	6a 00                	push   $0x0
  pushl $90
  1021dd:	6a 5a                	push   $0x5a
  jmp __alltraps
  1021df:	e9 4d 07 00 00       	jmp    102931 <__alltraps>

001021e4 <vector91>:
.globl vector91
vector91:
  pushl $0
  1021e4:	6a 00                	push   $0x0
  pushl $91
  1021e6:	6a 5b                	push   $0x5b
  jmp __alltraps
  1021e8:	e9 44 07 00 00       	jmp    102931 <__alltraps>

001021ed <vector92>:
.globl vector92
vector92:
  pushl $0
  1021ed:	6a 00                	push   $0x0
  pushl $92
  1021ef:	6a 5c                	push   $0x5c
  jmp __alltraps
  1021f1:	e9 3b 07 00 00       	jmp    102931 <__alltraps>

001021f6 <vector93>:
.globl vector93
vector93:
  pushl $0
  1021f6:	6a 00                	push   $0x0
  pushl $93
  1021f8:	6a 5d                	push   $0x5d
  jmp __alltraps
  1021fa:	e9 32 07 00 00       	jmp    102931 <__alltraps>

001021ff <vector94>:
.globl vector94
vector94:
  pushl $0
  1021ff:	6a 00                	push   $0x0
  pushl $94
  102201:	6a 5e                	push   $0x5e
  jmp __alltraps
  102203:	e9 29 07 00 00       	jmp    102931 <__alltraps>

00102208 <vector95>:
.globl vector95
vector95:
  pushl $0
  102208:	6a 00                	push   $0x0
  pushl $95
  10220a:	6a 5f                	push   $0x5f
  jmp __alltraps
  10220c:	e9 20 07 00 00       	jmp    102931 <__alltraps>

00102211 <vector96>:
.globl vector96
vector96:
  pushl $0
  102211:	6a 00                	push   $0x0
  pushl $96
  102213:	6a 60                	push   $0x60
  jmp __alltraps
  102215:	e9 17 07 00 00       	jmp    102931 <__alltraps>

0010221a <vector97>:
.globl vector97
vector97:
  pushl $0
  10221a:	6a 00                	push   $0x0
  pushl $97
  10221c:	6a 61                	push   $0x61
  jmp __alltraps
  10221e:	e9 0e 07 00 00       	jmp    102931 <__alltraps>

00102223 <vector98>:
.globl vector98
vector98:
  pushl $0
  102223:	6a 00                	push   $0x0
  pushl $98
  102225:	6a 62                	push   $0x62
  jmp __alltraps
  102227:	e9 05 07 00 00       	jmp    102931 <__alltraps>

0010222c <vector99>:
.globl vector99
vector99:
  pushl $0
  10222c:	6a 00                	push   $0x0
  pushl $99
  10222e:	6a 63                	push   $0x63
  jmp __alltraps
  102230:	e9 fc 06 00 00       	jmp    102931 <__alltraps>

00102235 <vector100>:
.globl vector100
vector100:
  pushl $0
  102235:	6a 00                	push   $0x0
  pushl $100
  102237:	6a 64                	push   $0x64
  jmp __alltraps
  102239:	e9 f3 06 00 00       	jmp    102931 <__alltraps>

0010223e <vector101>:
.globl vector101
vector101:
  pushl $0
  10223e:	6a 00                	push   $0x0
  pushl $101
  102240:	6a 65                	push   $0x65
  jmp __alltraps
  102242:	e9 ea 06 00 00       	jmp    102931 <__alltraps>

00102247 <vector102>:
.globl vector102
vector102:
  pushl $0
  102247:	6a 00                	push   $0x0
  pushl $102
  102249:	6a 66                	push   $0x66
  jmp __alltraps
  10224b:	e9 e1 06 00 00       	jmp    102931 <__alltraps>

00102250 <vector103>:
.globl vector103
vector103:
  pushl $0
  102250:	6a 00                	push   $0x0
  pushl $103
  102252:	6a 67                	push   $0x67
  jmp __alltraps
  102254:	e9 d8 06 00 00       	jmp    102931 <__alltraps>

00102259 <vector104>:
.globl vector104
vector104:
  pushl $0
  102259:	6a 00                	push   $0x0
  pushl $104
  10225b:	6a 68                	push   $0x68
  jmp __alltraps
  10225d:	e9 cf 06 00 00       	jmp    102931 <__alltraps>

00102262 <vector105>:
.globl vector105
vector105:
  pushl $0
  102262:	6a 00                	push   $0x0
  pushl $105
  102264:	6a 69                	push   $0x69
  jmp __alltraps
  102266:	e9 c6 06 00 00       	jmp    102931 <__alltraps>

0010226b <vector106>:
.globl vector106
vector106:
  pushl $0
  10226b:	6a 00                	push   $0x0
  pushl $106
  10226d:	6a 6a                	push   $0x6a
  jmp __alltraps
  10226f:	e9 bd 06 00 00       	jmp    102931 <__alltraps>

00102274 <vector107>:
.globl vector107
vector107:
  pushl $0
  102274:	6a 00                	push   $0x0
  pushl $107
  102276:	6a 6b                	push   $0x6b
  jmp __alltraps
  102278:	e9 b4 06 00 00       	jmp    102931 <__alltraps>

0010227d <vector108>:
.globl vector108
vector108:
  pushl $0
  10227d:	6a 00                	push   $0x0
  pushl $108
  10227f:	6a 6c                	push   $0x6c
  jmp __alltraps
  102281:	e9 ab 06 00 00       	jmp    102931 <__alltraps>

00102286 <vector109>:
.globl vector109
vector109:
  pushl $0
  102286:	6a 00                	push   $0x0
  pushl $109
  102288:	6a 6d                	push   $0x6d
  jmp __alltraps
  10228a:	e9 a2 06 00 00       	jmp    102931 <__alltraps>

0010228f <vector110>:
.globl vector110
vector110:
  pushl $0
  10228f:	6a 00                	push   $0x0
  pushl $110
  102291:	6a 6e                	push   $0x6e
  jmp __alltraps
  102293:	e9 99 06 00 00       	jmp    102931 <__alltraps>

00102298 <vector111>:
.globl vector111
vector111:
  pushl $0
  102298:	6a 00                	push   $0x0
  pushl $111
  10229a:	6a 6f                	push   $0x6f
  jmp __alltraps
  10229c:	e9 90 06 00 00       	jmp    102931 <__alltraps>

001022a1 <vector112>:
.globl vector112
vector112:
  pushl $0
  1022a1:	6a 00                	push   $0x0
  pushl $112
  1022a3:	6a 70                	push   $0x70
  jmp __alltraps
  1022a5:	e9 87 06 00 00       	jmp    102931 <__alltraps>

001022aa <vector113>:
.globl vector113
vector113:
  pushl $0
  1022aa:	6a 00                	push   $0x0
  pushl $113
  1022ac:	6a 71                	push   $0x71
  jmp __alltraps
  1022ae:	e9 7e 06 00 00       	jmp    102931 <__alltraps>

001022b3 <vector114>:
.globl vector114
vector114:
  pushl $0
  1022b3:	6a 00                	push   $0x0
  pushl $114
  1022b5:	6a 72                	push   $0x72
  jmp __alltraps
  1022b7:	e9 75 06 00 00       	jmp    102931 <__alltraps>

001022bc <vector115>:
.globl vector115
vector115:
  pushl $0
  1022bc:	6a 00                	push   $0x0
  pushl $115
  1022be:	6a 73                	push   $0x73
  jmp __alltraps
  1022c0:	e9 6c 06 00 00       	jmp    102931 <__alltraps>

001022c5 <vector116>:
.globl vector116
vector116:
  pushl $0
  1022c5:	6a 00                	push   $0x0
  pushl $116
  1022c7:	6a 74                	push   $0x74
  jmp __alltraps
  1022c9:	e9 63 06 00 00       	jmp    102931 <__alltraps>

001022ce <vector117>:
.globl vector117
vector117:
  pushl $0
  1022ce:	6a 00                	push   $0x0
  pushl $117
  1022d0:	6a 75                	push   $0x75
  jmp __alltraps
  1022d2:	e9 5a 06 00 00       	jmp    102931 <__alltraps>

001022d7 <vector118>:
.globl vector118
vector118:
  pushl $0
  1022d7:	6a 00                	push   $0x0
  pushl $118
  1022d9:	6a 76                	push   $0x76
  jmp __alltraps
  1022db:	e9 51 06 00 00       	jmp    102931 <__alltraps>

001022e0 <vector119>:
.globl vector119
vector119:
  pushl $0
  1022e0:	6a 00                	push   $0x0
  pushl $119
  1022e2:	6a 77                	push   $0x77
  jmp __alltraps
  1022e4:	e9 48 06 00 00       	jmp    102931 <__alltraps>

001022e9 <vector120>:
.globl vector120
vector120:
  pushl $0
  1022e9:	6a 00                	push   $0x0
  pushl $120
  1022eb:	6a 78                	push   $0x78
  jmp __alltraps
  1022ed:	e9 3f 06 00 00       	jmp    102931 <__alltraps>

001022f2 <vector121>:
.globl vector121
vector121:
  pushl $0
  1022f2:	6a 00                	push   $0x0
  pushl $121
  1022f4:	6a 79                	push   $0x79
  jmp __alltraps
  1022f6:	e9 36 06 00 00       	jmp    102931 <__alltraps>

001022fb <vector122>:
.globl vector122
vector122:
  pushl $0
  1022fb:	6a 00                	push   $0x0
  pushl $122
  1022fd:	6a 7a                	push   $0x7a
  jmp __alltraps
  1022ff:	e9 2d 06 00 00       	jmp    102931 <__alltraps>

00102304 <vector123>:
.globl vector123
vector123:
  pushl $0
  102304:	6a 00                	push   $0x0
  pushl $123
  102306:	6a 7b                	push   $0x7b
  jmp __alltraps
  102308:	e9 24 06 00 00       	jmp    102931 <__alltraps>

0010230d <vector124>:
.globl vector124
vector124:
  pushl $0
  10230d:	6a 00                	push   $0x0
  pushl $124
  10230f:	6a 7c                	push   $0x7c
  jmp __alltraps
  102311:	e9 1b 06 00 00       	jmp    102931 <__alltraps>

00102316 <vector125>:
.globl vector125
vector125:
  pushl $0
  102316:	6a 00                	push   $0x0
  pushl $125
  102318:	6a 7d                	push   $0x7d
  jmp __alltraps
  10231a:	e9 12 06 00 00       	jmp    102931 <__alltraps>

0010231f <vector126>:
.globl vector126
vector126:
  pushl $0
  10231f:	6a 00                	push   $0x0
  pushl $126
  102321:	6a 7e                	push   $0x7e
  jmp __alltraps
  102323:	e9 09 06 00 00       	jmp    102931 <__alltraps>

00102328 <vector127>:
.globl vector127
vector127:
  pushl $0
  102328:	6a 00                	push   $0x0
  pushl $127
  10232a:	6a 7f                	push   $0x7f
  jmp __alltraps
  10232c:	e9 00 06 00 00       	jmp    102931 <__alltraps>

00102331 <vector128>:
.globl vector128
vector128:
  pushl $0
  102331:	6a 00                	push   $0x0
  pushl $128
  102333:	68 80 00 00 00       	push   $0x80
  jmp __alltraps
  102338:	e9 f4 05 00 00       	jmp    102931 <__alltraps>

0010233d <vector129>:
.globl vector129
vector129:
  pushl $0
  10233d:	6a 00                	push   $0x0
  pushl $129
  10233f:	68 81 00 00 00       	push   $0x81
  jmp __alltraps
  102344:	e9 e8 05 00 00       	jmp    102931 <__alltraps>

00102349 <vector130>:
.globl vector130
vector130:
  pushl $0
  102349:	6a 00                	push   $0x0
  pushl $130
  10234b:	68 82 00 00 00       	push   $0x82
  jmp __alltraps
  102350:	e9 dc 05 00 00       	jmp    102931 <__alltraps>

00102355 <vector131>:
.globl vector131
vector131:
  pushl $0
  102355:	6a 00                	push   $0x0
  pushl $131
  102357:	68 83 00 00 00       	push   $0x83
  jmp __alltraps
  10235c:	e9 d0 05 00 00       	jmp    102931 <__alltraps>

00102361 <vector132>:
.globl vector132
vector132:
  pushl $0
  102361:	6a 00                	push   $0x0
  pushl $132
  102363:	68 84 00 00 00       	push   $0x84
  jmp __alltraps
  102368:	e9 c4 05 00 00       	jmp    102931 <__alltraps>

0010236d <vector133>:
.globl vector133
vector133:
  pushl $0
  10236d:	6a 00                	push   $0x0
  pushl $133
  10236f:	68 85 00 00 00       	push   $0x85
  jmp __alltraps
  102374:	e9 b8 05 00 00       	jmp    102931 <__alltraps>

00102379 <vector134>:
.globl vector134
vector134:
  pushl $0
  102379:	6a 00                	push   $0x0
  pushl $134
  10237b:	68 86 00 00 00       	push   $0x86
  jmp __alltraps
  102380:	e9 ac 05 00 00       	jmp    102931 <__alltraps>

00102385 <vector135>:
.globl vector135
vector135:
  pushl $0
  102385:	6a 00                	push   $0x0
  pushl $135
  102387:	68 87 00 00 00       	push   $0x87
  jmp __alltraps
  10238c:	e9 a0 05 00 00       	jmp    102931 <__alltraps>

00102391 <vector136>:
.globl vector136
vector136:
  pushl $0
  102391:	6a 00                	push   $0x0
  pushl $136
  102393:	68 88 00 00 00       	push   $0x88
  jmp __alltraps
  102398:	e9 94 05 00 00       	jmp    102931 <__alltraps>

0010239d <vector137>:
.globl vector137
vector137:
  pushl $0
  10239d:	6a 00                	push   $0x0
  pushl $137
  10239f:	68 89 00 00 00       	push   $0x89
  jmp __alltraps
  1023a4:	e9 88 05 00 00       	jmp    102931 <__alltraps>

001023a9 <vector138>:
.globl vector138
vector138:
  pushl $0
  1023a9:	6a 00                	push   $0x0
  pushl $138
  1023ab:	68 8a 00 00 00       	push   $0x8a
  jmp __alltraps
  1023b0:	e9 7c 05 00 00       	jmp    102931 <__alltraps>

001023b5 <vector139>:
.globl vector139
vector139:
  pushl $0
  1023b5:	6a 00                	push   $0x0
  pushl $139
  1023b7:	68 8b 00 00 00       	push   $0x8b
  jmp __alltraps
  1023bc:	e9 70 05 00 00       	jmp    102931 <__alltraps>

001023c1 <vector140>:
.globl vector140
vector140:
  pushl $0
  1023c1:	6a 00                	push   $0x0
  pushl $140
  1023c3:	68 8c 00 00 00       	push   $0x8c
  jmp __alltraps
  1023c8:	e9 64 05 00 00       	jmp    102931 <__alltraps>

001023cd <vector141>:
.globl vector141
vector141:
  pushl $0
  1023cd:	6a 00                	push   $0x0
  pushl $141
  1023cf:	68 8d 00 00 00       	push   $0x8d
  jmp __alltraps
  1023d4:	e9 58 05 00 00       	jmp    102931 <__alltraps>

001023d9 <vector142>:
.globl vector142
vector142:
  pushl $0
  1023d9:	6a 00                	push   $0x0
  pushl $142
  1023db:	68 8e 00 00 00       	push   $0x8e
  jmp __alltraps
  1023e0:	e9 4c 05 00 00       	jmp    102931 <__alltraps>

001023e5 <vector143>:
.globl vector143
vector143:
  pushl $0
  1023e5:	6a 00                	push   $0x0
  pushl $143
  1023e7:	68 8f 00 00 00       	push   $0x8f
  jmp __alltraps
  1023ec:	e9 40 05 00 00       	jmp    102931 <__alltraps>

001023f1 <vector144>:
.globl vector144
vector144:
  pushl $0
  1023f1:	6a 00                	push   $0x0
  pushl $144
  1023f3:	68 90 00 00 00       	push   $0x90
  jmp __alltraps
  1023f8:	e9 34 05 00 00       	jmp    102931 <__alltraps>

001023fd <vector145>:
.globl vector145
vector145:
  pushl $0
  1023fd:	6a 00                	push   $0x0
  pushl $145
  1023ff:	68 91 00 00 00       	push   $0x91
  jmp __alltraps
  102404:	e9 28 05 00 00       	jmp    102931 <__alltraps>

00102409 <vector146>:
.globl vector146
vector146:
  pushl $0
  102409:	6a 00                	push   $0x0
  pushl $146
  10240b:	68 92 00 00 00       	push   $0x92
  jmp __alltraps
  102410:	e9 1c 05 00 00       	jmp    102931 <__alltraps>

00102415 <vector147>:
.globl vector147
vector147:
  pushl $0
  102415:	6a 00                	push   $0x0
  pushl $147
  102417:	68 93 00 00 00       	push   $0x93
  jmp __alltraps
  10241c:	e9 10 05 00 00       	jmp    102931 <__alltraps>

00102421 <vector148>:
.globl vector148
vector148:
  pushl $0
  102421:	6a 00                	push   $0x0
  pushl $148
  102423:	68 94 00 00 00       	push   $0x94
  jmp __alltraps
  102428:	e9 04 05 00 00       	jmp    102931 <__alltraps>

0010242d <vector149>:
.globl vector149
vector149:
  pushl $0
  10242d:	6a 00                	push   $0x0
  pushl $149
  10242f:	68 95 00 00 00       	push   $0x95
  jmp __alltraps
  102434:	e9 f8 04 00 00       	jmp    102931 <__alltraps>

00102439 <vector150>:
.globl vector150
vector150:
  pushl $0
  102439:	6a 00                	push   $0x0
  pushl $150
  10243b:	68 96 00 00 00       	push   $0x96
  jmp __alltraps
  102440:	e9 ec 04 00 00       	jmp    102931 <__alltraps>

00102445 <vector151>:
.globl vector151
vector151:
  pushl $0
  102445:	6a 00                	push   $0x0
  pushl $151
  102447:	68 97 00 00 00       	push   $0x97
  jmp __alltraps
  10244c:	e9 e0 04 00 00       	jmp    102931 <__alltraps>

00102451 <vector152>:
.globl vector152
vector152:
  pushl $0
  102451:	6a 00                	push   $0x0
  pushl $152
  102453:	68 98 00 00 00       	push   $0x98
  jmp __alltraps
  102458:	e9 d4 04 00 00       	jmp    102931 <__alltraps>

0010245d <vector153>:
.globl vector153
vector153:
  pushl $0
  10245d:	6a 00                	push   $0x0
  pushl $153
  10245f:	68 99 00 00 00       	push   $0x99
  jmp __alltraps
  102464:	e9 c8 04 00 00       	jmp    102931 <__alltraps>

00102469 <vector154>:
.globl vector154
vector154:
  pushl $0
  102469:	6a 00                	push   $0x0
  pushl $154
  10246b:	68 9a 00 00 00       	push   $0x9a
  jmp __alltraps
  102470:	e9 bc 04 00 00       	jmp    102931 <__alltraps>

00102475 <vector155>:
.globl vector155
vector155:
  pushl $0
  102475:	6a 00                	push   $0x0
  pushl $155
  102477:	68 9b 00 00 00       	push   $0x9b
  jmp __alltraps
  10247c:	e9 b0 04 00 00       	jmp    102931 <__alltraps>

00102481 <vector156>:
.globl vector156
vector156:
  pushl $0
  102481:	6a 00                	push   $0x0
  pushl $156
  102483:	68 9c 00 00 00       	push   $0x9c
  jmp __alltraps
  102488:	e9 a4 04 00 00       	jmp    102931 <__alltraps>

0010248d <vector157>:
.globl vector157
vector157:
  pushl $0
  10248d:	6a 00                	push   $0x0
  pushl $157
  10248f:	68 9d 00 00 00       	push   $0x9d
  jmp __alltraps
  102494:	e9 98 04 00 00       	jmp    102931 <__alltraps>

00102499 <vector158>:
.globl vector158
vector158:
  pushl $0
  102499:	6a 00                	push   $0x0
  pushl $158
  10249b:	68 9e 00 00 00       	push   $0x9e
  jmp __alltraps
  1024a0:	e9 8c 04 00 00       	jmp    102931 <__alltraps>

001024a5 <vector159>:
.globl vector159
vector159:
  pushl $0
  1024a5:	6a 00                	push   $0x0
  pushl $159
  1024a7:	68 9f 00 00 00       	push   $0x9f
  jmp __alltraps
  1024ac:	e9 80 04 00 00       	jmp    102931 <__alltraps>

001024b1 <vector160>:
.globl vector160
vector160:
  pushl $0
  1024b1:	6a 00                	push   $0x0
  pushl $160
  1024b3:	68 a0 00 00 00       	push   $0xa0
  jmp __alltraps
  1024b8:	e9 74 04 00 00       	jmp    102931 <__alltraps>

001024bd <vector161>:
.globl vector161
vector161:
  pushl $0
  1024bd:	6a 00                	push   $0x0
  pushl $161
  1024bf:	68 a1 00 00 00       	push   $0xa1
  jmp __alltraps
  1024c4:	e9 68 04 00 00       	jmp    102931 <__alltraps>

001024c9 <vector162>:
.globl vector162
vector162:
  pushl $0
  1024c9:	6a 00                	push   $0x0
  pushl $162
  1024cb:	68 a2 00 00 00       	push   $0xa2
  jmp __alltraps
  1024d0:	e9 5c 04 00 00       	jmp    102931 <__alltraps>

001024d5 <vector163>:
.globl vector163
vector163:
  pushl $0
  1024d5:	6a 00                	push   $0x0
  pushl $163
  1024d7:	68 a3 00 00 00       	push   $0xa3
  jmp __alltraps
  1024dc:	e9 50 04 00 00       	jmp    102931 <__alltraps>

001024e1 <vector164>:
.globl vector164
vector164:
  pushl $0
  1024e1:	6a 00                	push   $0x0
  pushl $164
  1024e3:	68 a4 00 00 00       	push   $0xa4
  jmp __alltraps
  1024e8:	e9 44 04 00 00       	jmp    102931 <__alltraps>

001024ed <vector165>:
.globl vector165
vector165:
  pushl $0
  1024ed:	6a 00                	push   $0x0
  pushl $165
  1024ef:	68 a5 00 00 00       	push   $0xa5
  jmp __alltraps
  1024f4:	e9 38 04 00 00       	jmp    102931 <__alltraps>

001024f9 <vector166>:
.globl vector166
vector166:
  pushl $0
  1024f9:	6a 00                	push   $0x0
  pushl $166
  1024fb:	68 a6 00 00 00       	push   $0xa6
  jmp __alltraps
  102500:	e9 2c 04 00 00       	jmp    102931 <__alltraps>

00102505 <vector167>:
.globl vector167
vector167:
  pushl $0
  102505:	6a 00                	push   $0x0
  pushl $167
  102507:	68 a7 00 00 00       	push   $0xa7
  jmp __alltraps
  10250c:	e9 20 04 00 00       	jmp    102931 <__alltraps>

00102511 <vector168>:
.globl vector168
vector168:
  pushl $0
  102511:	6a 00                	push   $0x0
  pushl $168
  102513:	68 a8 00 00 00       	push   $0xa8
  jmp __alltraps
  102518:	e9 14 04 00 00       	jmp    102931 <__alltraps>

0010251d <vector169>:
.globl vector169
vector169:
  pushl $0
  10251d:	6a 00                	push   $0x0
  pushl $169
  10251f:	68 a9 00 00 00       	push   $0xa9
  jmp __alltraps
  102524:	e9 08 04 00 00       	jmp    102931 <__alltraps>

00102529 <vector170>:
.globl vector170
vector170:
  pushl $0
  102529:	6a 00                	push   $0x0
  pushl $170
  10252b:	68 aa 00 00 00       	push   $0xaa
  jmp __alltraps
  102530:	e9 fc 03 00 00       	jmp    102931 <__alltraps>

00102535 <vector171>:
.globl vector171
vector171:
  pushl $0
  102535:	6a 00                	push   $0x0
  pushl $171
  102537:	68 ab 00 00 00       	push   $0xab
  jmp __alltraps
  10253c:	e9 f0 03 00 00       	jmp    102931 <__alltraps>

00102541 <vector172>:
.globl vector172
vector172:
  pushl $0
  102541:	6a 00                	push   $0x0
  pushl $172
  102543:	68 ac 00 00 00       	push   $0xac
  jmp __alltraps
  102548:	e9 e4 03 00 00       	jmp    102931 <__alltraps>

0010254d <vector173>:
.globl vector173
vector173:
  pushl $0
  10254d:	6a 00                	push   $0x0
  pushl $173
  10254f:	68 ad 00 00 00       	push   $0xad
  jmp __alltraps
  102554:	e9 d8 03 00 00       	jmp    102931 <__alltraps>

00102559 <vector174>:
.globl vector174
vector174:
  pushl $0
  102559:	6a 00                	push   $0x0
  pushl $174
  10255b:	68 ae 00 00 00       	push   $0xae
  jmp __alltraps
  102560:	e9 cc 03 00 00       	jmp    102931 <__alltraps>

00102565 <vector175>:
.globl vector175
vector175:
  pushl $0
  102565:	6a 00                	push   $0x0
  pushl $175
  102567:	68 af 00 00 00       	push   $0xaf
  jmp __alltraps
  10256c:	e9 c0 03 00 00       	jmp    102931 <__alltraps>

00102571 <vector176>:
.globl vector176
vector176:
  pushl $0
  102571:	6a 00                	push   $0x0
  pushl $176
  102573:	68 b0 00 00 00       	push   $0xb0
  jmp __alltraps
  102578:	e9 b4 03 00 00       	jmp    102931 <__alltraps>

0010257d <vector177>:
.globl vector177
vector177:
  pushl $0
  10257d:	6a 00                	push   $0x0
  pushl $177
  10257f:	68 b1 00 00 00       	push   $0xb1
  jmp __alltraps
  102584:	e9 a8 03 00 00       	jmp    102931 <__alltraps>

00102589 <vector178>:
.globl vector178
vector178:
  pushl $0
  102589:	6a 00                	push   $0x0
  pushl $178
  10258b:	68 b2 00 00 00       	push   $0xb2
  jmp __alltraps
  102590:	e9 9c 03 00 00       	jmp    102931 <__alltraps>

00102595 <vector179>:
.globl vector179
vector179:
  pushl $0
  102595:	6a 00                	push   $0x0
  pushl $179
  102597:	68 b3 00 00 00       	push   $0xb3
  jmp __alltraps
  10259c:	e9 90 03 00 00       	jmp    102931 <__alltraps>

001025a1 <vector180>:
.globl vector180
vector180:
  pushl $0
  1025a1:	6a 00                	push   $0x0
  pushl $180
  1025a3:	68 b4 00 00 00       	push   $0xb4
  jmp __alltraps
  1025a8:	e9 84 03 00 00       	jmp    102931 <__alltraps>

001025ad <vector181>:
.globl vector181
vector181:
  pushl $0
  1025ad:	6a 00                	push   $0x0
  pushl $181
  1025af:	68 b5 00 00 00       	push   $0xb5
  jmp __alltraps
  1025b4:	e9 78 03 00 00       	jmp    102931 <__alltraps>

001025b9 <vector182>:
.globl vector182
vector182:
  pushl $0
  1025b9:	6a 00                	push   $0x0
  pushl $182
  1025bb:	68 b6 00 00 00       	push   $0xb6
  jmp __alltraps
  1025c0:	e9 6c 03 00 00       	jmp    102931 <__alltraps>

001025c5 <vector183>:
.globl vector183
vector183:
  pushl $0
  1025c5:	6a 00                	push   $0x0
  pushl $183
  1025c7:	68 b7 00 00 00       	push   $0xb7
  jmp __alltraps
  1025cc:	e9 60 03 00 00       	jmp    102931 <__alltraps>

001025d1 <vector184>:
.globl vector184
vector184:
  pushl $0
  1025d1:	6a 00                	push   $0x0
  pushl $184
  1025d3:	68 b8 00 00 00       	push   $0xb8
  jmp __alltraps
  1025d8:	e9 54 03 00 00       	jmp    102931 <__alltraps>

001025dd <vector185>:
.globl vector185
vector185:
  pushl $0
  1025dd:	6a 00                	push   $0x0
  pushl $185
  1025df:	68 b9 00 00 00       	push   $0xb9
  jmp __alltraps
  1025e4:	e9 48 03 00 00       	jmp    102931 <__alltraps>

001025e9 <vector186>:
.globl vector186
vector186:
  pushl $0
  1025e9:	6a 00                	push   $0x0
  pushl $186
  1025eb:	68 ba 00 00 00       	push   $0xba
  jmp __alltraps
  1025f0:	e9 3c 03 00 00       	jmp    102931 <__alltraps>

001025f5 <vector187>:
.globl vector187
vector187:
  pushl $0
  1025f5:	6a 00                	push   $0x0
  pushl $187
  1025f7:	68 bb 00 00 00       	push   $0xbb
  jmp __alltraps
  1025fc:	e9 30 03 00 00       	jmp    102931 <__alltraps>

00102601 <vector188>:
.globl vector188
vector188:
  pushl $0
  102601:	6a 00                	push   $0x0
  pushl $188
  102603:	68 bc 00 00 00       	push   $0xbc
  jmp __alltraps
  102608:	e9 24 03 00 00       	jmp    102931 <__alltraps>

0010260d <vector189>:
.globl vector189
vector189:
  pushl $0
  10260d:	6a 00                	push   $0x0
  pushl $189
  10260f:	68 bd 00 00 00       	push   $0xbd
  jmp __alltraps
  102614:	e9 18 03 00 00       	jmp    102931 <__alltraps>

00102619 <vector190>:
.globl vector190
vector190:
  pushl $0
  102619:	6a 00                	push   $0x0
  pushl $190
  10261b:	68 be 00 00 00       	push   $0xbe
  jmp __alltraps
  102620:	e9 0c 03 00 00       	jmp    102931 <__alltraps>

00102625 <vector191>:
.globl vector191
vector191:
  pushl $0
  102625:	6a 00                	push   $0x0
  pushl $191
  102627:	68 bf 00 00 00       	push   $0xbf
  jmp __alltraps
  10262c:	e9 00 03 00 00       	jmp    102931 <__alltraps>

00102631 <vector192>:
.globl vector192
vector192:
  pushl $0
  102631:	6a 00                	push   $0x0
  pushl $192
  102633:	68 c0 00 00 00       	push   $0xc0
  jmp __alltraps
  102638:	e9 f4 02 00 00       	jmp    102931 <__alltraps>

0010263d <vector193>:
.globl vector193
vector193:
  pushl $0
  10263d:	6a 00                	push   $0x0
  pushl $193
  10263f:	68 c1 00 00 00       	push   $0xc1
  jmp __alltraps
  102644:	e9 e8 02 00 00       	jmp    102931 <__alltraps>

00102649 <vector194>:
.globl vector194
vector194:
  pushl $0
  102649:	6a 00                	push   $0x0
  pushl $194
  10264b:	68 c2 00 00 00       	push   $0xc2
  jmp __alltraps
  102650:	e9 dc 02 00 00       	jmp    102931 <__alltraps>

00102655 <vector195>:
.globl vector195
vector195:
  pushl $0
  102655:	6a 00                	push   $0x0
  pushl $195
  102657:	68 c3 00 00 00       	push   $0xc3
  jmp __alltraps
  10265c:	e9 d0 02 00 00       	jmp    102931 <__alltraps>

00102661 <vector196>:
.globl vector196
vector196:
  pushl $0
  102661:	6a 00                	push   $0x0
  pushl $196
  102663:	68 c4 00 00 00       	push   $0xc4
  jmp __alltraps
  102668:	e9 c4 02 00 00       	jmp    102931 <__alltraps>

0010266d <vector197>:
.globl vector197
vector197:
  pushl $0
  10266d:	6a 00                	push   $0x0
  pushl $197
  10266f:	68 c5 00 00 00       	push   $0xc5
  jmp __alltraps
  102674:	e9 b8 02 00 00       	jmp    102931 <__alltraps>

00102679 <vector198>:
.globl vector198
vector198:
  pushl $0
  102679:	6a 00                	push   $0x0
  pushl $198
  10267b:	68 c6 00 00 00       	push   $0xc6
  jmp __alltraps
  102680:	e9 ac 02 00 00       	jmp    102931 <__alltraps>

00102685 <vector199>:
.globl vector199
vector199:
  pushl $0
  102685:	6a 00                	push   $0x0
  pushl $199
  102687:	68 c7 00 00 00       	push   $0xc7
  jmp __alltraps
  10268c:	e9 a0 02 00 00       	jmp    102931 <__alltraps>

00102691 <vector200>:
.globl vector200
vector200:
  pushl $0
  102691:	6a 00                	push   $0x0
  pushl $200
  102693:	68 c8 00 00 00       	push   $0xc8
  jmp __alltraps
  102698:	e9 94 02 00 00       	jmp    102931 <__alltraps>

0010269d <vector201>:
.globl vector201
vector201:
  pushl $0
  10269d:	6a 00                	push   $0x0
  pushl $201
  10269f:	68 c9 00 00 00       	push   $0xc9
  jmp __alltraps
  1026a4:	e9 88 02 00 00       	jmp    102931 <__alltraps>

001026a9 <vector202>:
.globl vector202
vector202:
  pushl $0
  1026a9:	6a 00                	push   $0x0
  pushl $202
  1026ab:	68 ca 00 00 00       	push   $0xca
  jmp __alltraps
  1026b0:	e9 7c 02 00 00       	jmp    102931 <__alltraps>

001026b5 <vector203>:
.globl vector203
vector203:
  pushl $0
  1026b5:	6a 00                	push   $0x0
  pushl $203
  1026b7:	68 cb 00 00 00       	push   $0xcb
  jmp __alltraps
  1026bc:	e9 70 02 00 00       	jmp    102931 <__alltraps>

001026c1 <vector204>:
.globl vector204
vector204:
  pushl $0
  1026c1:	6a 00                	push   $0x0
  pushl $204
  1026c3:	68 cc 00 00 00       	push   $0xcc
  jmp __alltraps
  1026c8:	e9 64 02 00 00       	jmp    102931 <__alltraps>

001026cd <vector205>:
.globl vector205
vector205:
  pushl $0
  1026cd:	6a 00                	push   $0x0
  pushl $205
  1026cf:	68 cd 00 00 00       	push   $0xcd
  jmp __alltraps
  1026d4:	e9 58 02 00 00       	jmp    102931 <__alltraps>

001026d9 <vector206>:
.globl vector206
vector206:
  pushl $0
  1026d9:	6a 00                	push   $0x0
  pushl $206
  1026db:	68 ce 00 00 00       	push   $0xce
  jmp __alltraps
  1026e0:	e9 4c 02 00 00       	jmp    102931 <__alltraps>

001026e5 <vector207>:
.globl vector207
vector207:
  pushl $0
  1026e5:	6a 00                	push   $0x0
  pushl $207
  1026e7:	68 cf 00 00 00       	push   $0xcf
  jmp __alltraps
  1026ec:	e9 40 02 00 00       	jmp    102931 <__alltraps>

001026f1 <vector208>:
.globl vector208
vector208:
  pushl $0
  1026f1:	6a 00                	push   $0x0
  pushl $208
  1026f3:	68 d0 00 00 00       	push   $0xd0
  jmp __alltraps
  1026f8:	e9 34 02 00 00       	jmp    102931 <__alltraps>

001026fd <vector209>:
.globl vector209
vector209:
  pushl $0
  1026fd:	6a 00                	push   $0x0
  pushl $209
  1026ff:	68 d1 00 00 00       	push   $0xd1
  jmp __alltraps
  102704:	e9 28 02 00 00       	jmp    102931 <__alltraps>

00102709 <vector210>:
.globl vector210
vector210:
  pushl $0
  102709:	6a 00                	push   $0x0
  pushl $210
  10270b:	68 d2 00 00 00       	push   $0xd2
  jmp __alltraps
  102710:	e9 1c 02 00 00       	jmp    102931 <__alltraps>

00102715 <vector211>:
.globl vector211
vector211:
  pushl $0
  102715:	6a 00                	push   $0x0
  pushl $211
  102717:	68 d3 00 00 00       	push   $0xd3
  jmp __alltraps
  10271c:	e9 10 02 00 00       	jmp    102931 <__alltraps>

00102721 <vector212>:
.globl vector212
vector212:
  pushl $0
  102721:	6a 00                	push   $0x0
  pushl $212
  102723:	68 d4 00 00 00       	push   $0xd4
  jmp __alltraps
  102728:	e9 04 02 00 00       	jmp    102931 <__alltraps>

0010272d <vector213>:
.globl vector213
vector213:
  pushl $0
  10272d:	6a 00                	push   $0x0
  pushl $213
  10272f:	68 d5 00 00 00       	push   $0xd5
  jmp __alltraps
  102734:	e9 f8 01 00 00       	jmp    102931 <__alltraps>

00102739 <vector214>:
.globl vector214
vector214:
  pushl $0
  102739:	6a 00                	push   $0x0
  pushl $214
  10273b:	68 d6 00 00 00       	push   $0xd6
  jmp __alltraps
  102740:	e9 ec 01 00 00       	jmp    102931 <__alltraps>

00102745 <vector215>:
.globl vector215
vector215:
  pushl $0
  102745:	6a 00                	push   $0x0
  pushl $215
  102747:	68 d7 00 00 00       	push   $0xd7
  jmp __alltraps
  10274c:	e9 e0 01 00 00       	jmp    102931 <__alltraps>

00102751 <vector216>:
.globl vector216
vector216:
  pushl $0
  102751:	6a 00                	push   $0x0
  pushl $216
  102753:	68 d8 00 00 00       	push   $0xd8
  jmp __alltraps
  102758:	e9 d4 01 00 00       	jmp    102931 <__alltraps>

0010275d <vector217>:
.globl vector217
vector217:
  pushl $0
  10275d:	6a 00                	push   $0x0
  pushl $217
  10275f:	68 d9 00 00 00       	push   $0xd9
  jmp __alltraps
  102764:	e9 c8 01 00 00       	jmp    102931 <__alltraps>

00102769 <vector218>:
.globl vector218
vector218:
  pushl $0
  102769:	6a 00                	push   $0x0
  pushl $218
  10276b:	68 da 00 00 00       	push   $0xda
  jmp __alltraps
  102770:	e9 bc 01 00 00       	jmp    102931 <__alltraps>

00102775 <vector219>:
.globl vector219
vector219:
  pushl $0
  102775:	6a 00                	push   $0x0
  pushl $219
  102777:	68 db 00 00 00       	push   $0xdb
  jmp __alltraps
  10277c:	e9 b0 01 00 00       	jmp    102931 <__alltraps>

00102781 <vector220>:
.globl vector220
vector220:
  pushl $0
  102781:	6a 00                	push   $0x0
  pushl $220
  102783:	68 dc 00 00 00       	push   $0xdc
  jmp __alltraps
  102788:	e9 a4 01 00 00       	jmp    102931 <__alltraps>

0010278d <vector221>:
.globl vector221
vector221:
  pushl $0
  10278d:	6a 00                	push   $0x0
  pushl $221
  10278f:	68 dd 00 00 00       	push   $0xdd
  jmp __alltraps
  102794:	e9 98 01 00 00       	jmp    102931 <__alltraps>

00102799 <vector222>:
.globl vector222
vector222:
  pushl $0
  102799:	6a 00                	push   $0x0
  pushl $222
  10279b:	68 de 00 00 00       	push   $0xde
  jmp __alltraps
  1027a0:	e9 8c 01 00 00       	jmp    102931 <__alltraps>

001027a5 <vector223>:
.globl vector223
vector223:
  pushl $0
  1027a5:	6a 00                	push   $0x0
  pushl $223
  1027a7:	68 df 00 00 00       	push   $0xdf
  jmp __alltraps
  1027ac:	e9 80 01 00 00       	jmp    102931 <__alltraps>

001027b1 <vector224>:
.globl vector224
vector224:
  pushl $0
  1027b1:	6a 00                	push   $0x0
  pushl $224
  1027b3:	68 e0 00 00 00       	push   $0xe0
  jmp __alltraps
  1027b8:	e9 74 01 00 00       	jmp    102931 <__alltraps>

001027bd <vector225>:
.globl vector225
vector225:
  pushl $0
  1027bd:	6a 00                	push   $0x0
  pushl $225
  1027bf:	68 e1 00 00 00       	push   $0xe1
  jmp __alltraps
  1027c4:	e9 68 01 00 00       	jmp    102931 <__alltraps>

001027c9 <vector226>:
.globl vector226
vector226:
  pushl $0
  1027c9:	6a 00                	push   $0x0
  pushl $226
  1027cb:	68 e2 00 00 00       	push   $0xe2
  jmp __alltraps
  1027d0:	e9 5c 01 00 00       	jmp    102931 <__alltraps>

001027d5 <vector227>:
.globl vector227
vector227:
  pushl $0
  1027d5:	6a 00                	push   $0x0
  pushl $227
  1027d7:	68 e3 00 00 00       	push   $0xe3
  jmp __alltraps
  1027dc:	e9 50 01 00 00       	jmp    102931 <__alltraps>

001027e1 <vector228>:
.globl vector228
vector228:
  pushl $0
  1027e1:	6a 00                	push   $0x0
  pushl $228
  1027e3:	68 e4 00 00 00       	push   $0xe4
  jmp __alltraps
  1027e8:	e9 44 01 00 00       	jmp    102931 <__alltraps>

001027ed <vector229>:
.globl vector229
vector229:
  pushl $0
  1027ed:	6a 00                	push   $0x0
  pushl $229
  1027ef:	68 e5 00 00 00       	push   $0xe5
  jmp __alltraps
  1027f4:	e9 38 01 00 00       	jmp    102931 <__alltraps>

001027f9 <vector230>:
.globl vector230
vector230:
  pushl $0
  1027f9:	6a 00                	push   $0x0
  pushl $230
  1027fb:	68 e6 00 00 00       	push   $0xe6
  jmp __alltraps
  102800:	e9 2c 01 00 00       	jmp    102931 <__alltraps>

00102805 <vector231>:
.globl vector231
vector231:
  pushl $0
  102805:	6a 00                	push   $0x0
  pushl $231
  102807:	68 e7 00 00 00       	push   $0xe7
  jmp __alltraps
  10280c:	e9 20 01 00 00       	jmp    102931 <__alltraps>

00102811 <vector232>:
.globl vector232
vector232:
  pushl $0
  102811:	6a 00                	push   $0x0
  pushl $232
  102813:	68 e8 00 00 00       	push   $0xe8
  jmp __alltraps
  102818:	e9 14 01 00 00       	jmp    102931 <__alltraps>

0010281d <vector233>:
.globl vector233
vector233:
  pushl $0
  10281d:	6a 00                	push   $0x0
  pushl $233
  10281f:	68 e9 00 00 00       	push   $0xe9
  jmp __alltraps
  102824:	e9 08 01 00 00       	jmp    102931 <__alltraps>

00102829 <vector234>:
.globl vector234
vector234:
  pushl $0
  102829:	6a 00                	push   $0x0
  pushl $234
  10282b:	68 ea 00 00 00       	push   $0xea
  jmp __alltraps
  102830:	e9 fc 00 00 00       	jmp    102931 <__alltraps>

00102835 <vector235>:
.globl vector235
vector235:
  pushl $0
  102835:	6a 00                	push   $0x0
  pushl $235
  102837:	68 eb 00 00 00       	push   $0xeb
  jmp __alltraps
  10283c:	e9 f0 00 00 00       	jmp    102931 <__alltraps>

00102841 <vector236>:
.globl vector236
vector236:
  pushl $0
  102841:	6a 00                	push   $0x0
  pushl $236
  102843:	68 ec 00 00 00       	push   $0xec
  jmp __alltraps
  102848:	e9 e4 00 00 00       	jmp    102931 <__alltraps>

0010284d <vector237>:
.globl vector237
vector237:
  pushl $0
  10284d:	6a 00                	push   $0x0
  pushl $237
  10284f:	68 ed 00 00 00       	push   $0xed
  jmp __alltraps
  102854:	e9 d8 00 00 00       	jmp    102931 <__alltraps>

00102859 <vector238>:
.globl vector238
vector238:
  pushl $0
  102859:	6a 00                	push   $0x0
  pushl $238
  10285b:	68 ee 00 00 00       	push   $0xee
  jmp __alltraps
  102860:	e9 cc 00 00 00       	jmp    102931 <__alltraps>

00102865 <vector239>:
.globl vector239
vector239:
  pushl $0
  102865:	6a 00                	push   $0x0
  pushl $239
  102867:	68 ef 00 00 00       	push   $0xef
  jmp __alltraps
  10286c:	e9 c0 00 00 00       	jmp    102931 <__alltraps>

00102871 <vector240>:
.globl vector240
vector240:
  pushl $0
  102871:	6a 00                	push   $0x0
  pushl $240
  102873:	68 f0 00 00 00       	push   $0xf0
  jmp __alltraps
  102878:	e9 b4 00 00 00       	jmp    102931 <__alltraps>

0010287d <vector241>:
.globl vector241
vector241:
  pushl $0
  10287d:	6a 00                	push   $0x0
  pushl $241
  10287f:	68 f1 00 00 00       	push   $0xf1
  jmp __alltraps
  102884:	e9 a8 00 00 00       	jmp    102931 <__alltraps>

00102889 <vector242>:
.globl vector242
vector242:
  pushl $0
  102889:	6a 00                	push   $0x0
  pushl $242
  10288b:	68 f2 00 00 00       	push   $0xf2
  jmp __alltraps
  102890:	e9 9c 00 00 00       	jmp    102931 <__alltraps>

00102895 <vector243>:
.globl vector243
vector243:
  pushl $0
  102895:	6a 00                	push   $0x0
  pushl $243
  102897:	68 f3 00 00 00       	push   $0xf3
  jmp __alltraps
  10289c:	e9 90 00 00 00       	jmp    102931 <__alltraps>

001028a1 <vector244>:
.globl vector244
vector244:
  pushl $0
  1028a1:	6a 00                	push   $0x0
  pushl $244
  1028a3:	68 f4 00 00 00       	push   $0xf4
  jmp __alltraps
  1028a8:	e9 84 00 00 00       	jmp    102931 <__alltraps>

001028ad <vector245>:
.globl vector245
vector245:
  pushl $0
  1028ad:	6a 00                	push   $0x0
  pushl $245
  1028af:	68 f5 00 00 00       	push   $0xf5
  jmp __alltraps
  1028b4:	e9 78 00 00 00       	jmp    102931 <__alltraps>

001028b9 <vector246>:
.globl vector246
vector246:
  pushl $0
  1028b9:	6a 00                	push   $0x0
  pushl $246
  1028bb:	68 f6 00 00 00       	push   $0xf6
  jmp __alltraps
  1028c0:	e9 6c 00 00 00       	jmp    102931 <__alltraps>

001028c5 <vector247>:
.globl vector247
vector247:
  pushl $0
  1028c5:	6a 00                	push   $0x0
  pushl $247
  1028c7:	68 f7 00 00 00       	push   $0xf7
  jmp __alltraps
  1028cc:	e9 60 00 00 00       	jmp    102931 <__alltraps>

001028d1 <vector248>:
.globl vector248
vector248:
  pushl $0
  1028d1:	6a 00                	push   $0x0
  pushl $248
  1028d3:	68 f8 00 00 00       	push   $0xf8
  jmp __alltraps
  1028d8:	e9 54 00 00 00       	jmp    102931 <__alltraps>

001028dd <vector249>:
.globl vector249
vector249:
  pushl $0
  1028dd:	6a 00                	push   $0x0
  pushl $249
  1028df:	68 f9 00 00 00       	push   $0xf9
  jmp __alltraps
  1028e4:	e9 48 00 00 00       	jmp    102931 <__alltraps>

001028e9 <vector250>:
.globl vector250
vector250:
  pushl $0
  1028e9:	6a 00                	push   $0x0
  pushl $250
  1028eb:	68 fa 00 00 00       	push   $0xfa
  jmp __alltraps
  1028f0:	e9 3c 00 00 00       	jmp    102931 <__alltraps>

001028f5 <vector251>:
.globl vector251
vector251:
  pushl $0
  1028f5:	6a 00                	push   $0x0
  pushl $251
  1028f7:	68 fb 00 00 00       	push   $0xfb
  jmp __alltraps
  1028fc:	e9 30 00 00 00       	jmp    102931 <__alltraps>

00102901 <vector252>:
.globl vector252
vector252:
  pushl $0
  102901:	6a 00                	push   $0x0
  pushl $252
  102903:	68 fc 00 00 00       	push   $0xfc
  jmp __alltraps
  102908:	e9 24 00 00 00       	jmp    102931 <__alltraps>

0010290d <vector253>:
.globl vector253
vector253:
  pushl $0
  10290d:	6a 00                	push   $0x0
  pushl $253
  10290f:	68 fd 00 00 00       	push   $0xfd
  jmp __alltraps
  102914:	e9 18 00 00 00       	jmp    102931 <__alltraps>

00102919 <vector254>:
.globl vector254
vector254:
  pushl $0
  102919:	6a 00                	push   $0x0
  pushl $254
  10291b:	68 fe 00 00 00       	push   $0xfe
  jmp __alltraps
  102920:	e9 0c 00 00 00       	jmp    102931 <__alltraps>

00102925 <vector255>:
.globl vector255
vector255:
  pushl $0
  102925:	6a 00                	push   $0x0
  pushl $255
  102927:	68 ff 00 00 00       	push   $0xff
  jmp __alltraps
  10292c:	e9 00 00 00 00       	jmp    102931 <__alltraps>

00102931 <__alltraps>:
.text
.globl __alltraps
__alltraps:
    # push registers to build a trap frame
    # therefore make the stack look like a struct trapframe
    pushl %ds
  102931:	1e                   	push   %ds
    pushl %es
  102932:	06                   	push   %es
    pushl %fs
  102933:	0f a0                	push   %fs
    pushl %gs
  102935:	0f a8                	push   %gs
    pushal
  102937:	60                   	pusha  

    # load GD_KDATA into %ds and %es to set up data segments for kernel
    movl $GD_KDATA, %eax
  102938:	b8 10 00 00 00       	mov    $0x10,%eax
    movw %ax, %ds
  10293d:	8e d8                	mov    %eax,%ds
    movw %ax, %es
  10293f:	8e c0                	mov    %eax,%es

    # push %esp to pass a pointer to the trapframe as an argument to trap()
    pushl %esp
  102941:	54                   	push   %esp

    # call trap(tf), where tf=%esp
    call trap
  102942:	e8 60 f5 ff ff       	call   101ea7 <trap>

    # pop the pushed stack pointer
    popl %esp
  102947:	5c                   	pop    %esp

00102948 <__trapret>:

    # return falls through to trapret...
.globl __trapret
__trapret:
    # restore registers from stack
    popal
  102948:	61                   	popa   

    # restore %ds, %es, %fs and %gs
    popl %gs
  102949:	0f a9                	pop    %gs
    popl %fs
  10294b:	0f a1                	pop    %fs
    popl %es
  10294d:	07                   	pop    %es
    popl %ds
  10294e:	1f                   	pop    %ds

    # get rid of the trap number and error code
    addl $0x8, %esp
  10294f:	83 c4 08             	add    $0x8,%esp
    iret
  102952:	cf                   	iret   

00102953 <lgdt>:
/* *
 * lgdt - load the global descriptor table register and reset the
 * data/code segement registers for kernel.
 * */
static inline void
lgdt(struct pseudodesc *pd) {
  102953:	55                   	push   %ebp
  102954:	89 e5                	mov    %esp,%ebp
    asm volatile ("lgdt (%0)" :: "r" (pd));
  102956:	8b 45 08             	mov    0x8(%ebp),%eax
  102959:	0f 01 10             	lgdtl  (%eax)
    asm volatile ("movw %%ax, %%gs" :: "a" (USER_DS));
  10295c:	b8 23 00 00 00       	mov    $0x23,%eax
  102961:	8e e8                	mov    %eax,%gs
    asm volatile ("movw %%ax, %%fs" :: "a" (USER_DS));
  102963:	b8 23 00 00 00       	mov    $0x23,%eax
  102968:	8e e0                	mov    %eax,%fs
    asm volatile ("movw %%ax, %%es" :: "a" (KERNEL_DS));
  10296a:	b8 10 00 00 00       	mov    $0x10,%eax
  10296f:	8e c0                	mov    %eax,%es
    asm volatile ("movw %%ax, %%ds" :: "a" (KERNEL_DS));
  102971:	b8 10 00 00 00       	mov    $0x10,%eax
  102976:	8e d8                	mov    %eax,%ds
    asm volatile ("movw %%ax, %%ss" :: "a" (KERNEL_DS));
  102978:	b8 10 00 00 00       	mov    $0x10,%eax
  10297d:	8e d0                	mov    %eax,%ss
    // reload cs
    asm volatile ("ljmp %0, $1f\n 1:\n" :: "i" (KERNEL_CS));
  10297f:	ea 86 29 10 00 08 00 	ljmp   $0x8,$0x102986
}
  102986:	90                   	nop
  102987:	5d                   	pop    %ebp
  102988:	c3                   	ret    

00102989 <gdt_init>:
/* temporary kernel stack */
uint8_t stack0[1024];

/* gdt_init - initialize the default GDT and TSS */
static void
gdt_init(void) {
  102989:	f3 0f 1e fb          	endbr32 
  10298d:	55                   	push   %ebp
  10298e:	89 e5                	mov    %esp,%ebp
  102990:	83 ec 14             	sub    $0x14,%esp
    // Setup a TSS so that we can get the right stack when we trap from
    // user to the kernel. But not safe here, it's only a temporary value,
    // it will be set to KSTACKTOP in lab2.
    ts.ts_esp0 = (uint32_t)&stack0 + sizeof(stack0);
  102993:	b8 20 09 11 00       	mov    $0x110920,%eax
  102998:	05 00 04 00 00       	add    $0x400,%eax
  10299d:	a3 a4 08 11 00       	mov    %eax,0x1108a4
    ts.ts_ss0 = KERNEL_DS;
  1029a2:	66 c7 05 a8 08 11 00 	movw   $0x10,0x1108a8
  1029a9:	10 00 

    // initialize the TSS filed of the gdt
    gdt[SEG_TSS] = SEG16(STS_T32A, (uint32_t)&ts, sizeof(ts), DPL_KERNEL);
  1029ab:	66 c7 05 08 fa 10 00 	movw   $0x68,0x10fa08
  1029b2:	68 00 
  1029b4:	b8 a0 08 11 00       	mov    $0x1108a0,%eax
  1029b9:	0f b7 c0             	movzwl %ax,%eax
  1029bc:	66 a3 0a fa 10 00    	mov    %ax,0x10fa0a
  1029c2:	b8 a0 08 11 00       	mov    $0x1108a0,%eax
  1029c7:	c1 e8 10             	shr    $0x10,%eax
  1029ca:	a2 0c fa 10 00       	mov    %al,0x10fa0c
  1029cf:	0f b6 05 0d fa 10 00 	movzbl 0x10fa0d,%eax
  1029d6:	24 f0                	and    $0xf0,%al
  1029d8:	0c 09                	or     $0x9,%al
  1029da:	a2 0d fa 10 00       	mov    %al,0x10fa0d
  1029df:	0f b6 05 0d fa 10 00 	movzbl 0x10fa0d,%eax
  1029e6:	0c 10                	or     $0x10,%al
  1029e8:	a2 0d fa 10 00       	mov    %al,0x10fa0d
  1029ed:	0f b6 05 0d fa 10 00 	movzbl 0x10fa0d,%eax
  1029f4:	24 9f                	and    $0x9f,%al
  1029f6:	a2 0d fa 10 00       	mov    %al,0x10fa0d
  1029fb:	0f b6 05 0d fa 10 00 	movzbl 0x10fa0d,%eax
  102a02:	0c 80                	or     $0x80,%al
  102a04:	a2 0d fa 10 00       	mov    %al,0x10fa0d
  102a09:	0f b6 05 0e fa 10 00 	movzbl 0x10fa0e,%eax
  102a10:	24 f0                	and    $0xf0,%al
  102a12:	a2 0e fa 10 00       	mov    %al,0x10fa0e
  102a17:	0f b6 05 0e fa 10 00 	movzbl 0x10fa0e,%eax
  102a1e:	24 ef                	and    $0xef,%al
  102a20:	a2 0e fa 10 00       	mov    %al,0x10fa0e
  102a25:	0f b6 05 0e fa 10 00 	movzbl 0x10fa0e,%eax
  102a2c:	24 df                	and    $0xdf,%al
  102a2e:	a2 0e fa 10 00       	mov    %al,0x10fa0e
  102a33:	0f b6 05 0e fa 10 00 	movzbl 0x10fa0e,%eax
  102a3a:	0c 40                	or     $0x40,%al
  102a3c:	a2 0e fa 10 00       	mov    %al,0x10fa0e
  102a41:	0f b6 05 0e fa 10 00 	movzbl 0x10fa0e,%eax
  102a48:	24 7f                	and    $0x7f,%al
  102a4a:	a2 0e fa 10 00       	mov    %al,0x10fa0e
  102a4f:	b8 a0 08 11 00       	mov    $0x1108a0,%eax
  102a54:	c1 e8 18             	shr    $0x18,%eax
  102a57:	a2 0f fa 10 00       	mov    %al,0x10fa0f
    gdt[SEG_TSS].sd_s = 0;
  102a5c:	0f b6 05 0d fa 10 00 	movzbl 0x10fa0d,%eax
  102a63:	24 ef                	and    $0xef,%al
  102a65:	a2 0d fa 10 00       	mov    %al,0x10fa0d

    // reload all segment registers
    lgdt(&gdt_pd);
  102a6a:	c7 04 24 10 fa 10 00 	movl   $0x10fa10,(%esp)
  102a71:	e8 dd fe ff ff       	call   102953 <lgdt>
  102a76:	66 c7 45 fe 28 00    	movw   $0x28,-0x2(%ebp)

static inline void
ltr(uint16_t sel) {
    asm volatile ("ltr %0" :: "r" (sel));
  102a7c:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  102a80:	0f 00 d8             	ltr    %ax
}
  102a83:	90                   	nop

    // load the TSS
    ltr(GD_TSS);
}
  102a84:	90                   	nop
  102a85:	c9                   	leave  
  102a86:	c3                   	ret    

00102a87 <pmm_init>:

/* pmm_init - initialize the physical memory management */
void
pmm_init(void) {
  102a87:	f3 0f 1e fb          	endbr32 
  102a8b:	55                   	push   %ebp
  102a8c:	89 e5                	mov    %esp,%ebp
    gdt_init();
  102a8e:	e8 f6 fe ff ff       	call   102989 <gdt_init>
}
  102a93:	90                   	nop
  102a94:	5d                   	pop    %ebp
  102a95:	c3                   	ret    

00102a96 <strlen>:
 * @s:        the input string
 *
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
  102a96:	f3 0f 1e fb          	endbr32 
  102a9a:	55                   	push   %ebp
  102a9b:	89 e5                	mov    %esp,%ebp
  102a9d:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  102aa0:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (*s ++ != '\0') {
  102aa7:	eb 03                	jmp    102aac <strlen+0x16>
        cnt ++;
  102aa9:	ff 45 fc             	incl   -0x4(%ebp)
    while (*s ++ != '\0') {
  102aac:	8b 45 08             	mov    0x8(%ebp),%eax
  102aaf:	8d 50 01             	lea    0x1(%eax),%edx
  102ab2:	89 55 08             	mov    %edx,0x8(%ebp)
  102ab5:	0f b6 00             	movzbl (%eax),%eax
  102ab8:	84 c0                	test   %al,%al
  102aba:	75 ed                	jne    102aa9 <strlen+0x13>
    }
    return cnt;
  102abc:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  102abf:	c9                   	leave  
  102ac0:	c3                   	ret    

00102ac1 <strnlen>:
 * The return value is strlen(s), if that is less than @len, or
 * @len if there is no '\0' character among the first @len characters
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
  102ac1:	f3 0f 1e fb          	endbr32 
  102ac5:	55                   	push   %ebp
  102ac6:	89 e5                	mov    %esp,%ebp
  102ac8:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  102acb:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  102ad2:	eb 03                	jmp    102ad7 <strnlen+0x16>
        cnt ++;
  102ad4:	ff 45 fc             	incl   -0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  102ad7:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102ada:	3b 45 0c             	cmp    0xc(%ebp),%eax
  102add:	73 10                	jae    102aef <strnlen+0x2e>
  102adf:	8b 45 08             	mov    0x8(%ebp),%eax
  102ae2:	8d 50 01             	lea    0x1(%eax),%edx
  102ae5:	89 55 08             	mov    %edx,0x8(%ebp)
  102ae8:	0f b6 00             	movzbl (%eax),%eax
  102aeb:	84 c0                	test   %al,%al
  102aed:	75 e5                	jne    102ad4 <strnlen+0x13>
    }
    return cnt;
  102aef:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  102af2:	c9                   	leave  
  102af3:	c3                   	ret    

00102af4 <strcpy>:
 * To avoid overflows, the size of array pointed by @dst should be long enough to
 * contain the same string as @src (including the terminating null character), and
 * should not overlap in memory with @src.
 * */
char *
strcpy(char *dst, const char *src) {
  102af4:	f3 0f 1e fb          	endbr32 
  102af8:	55                   	push   %ebp
  102af9:	89 e5                	mov    %esp,%ebp
  102afb:	57                   	push   %edi
  102afc:	56                   	push   %esi
  102afd:	83 ec 20             	sub    $0x20,%esp
  102b00:	8b 45 08             	mov    0x8(%ebp),%eax
  102b03:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102b06:	8b 45 0c             	mov    0xc(%ebp),%eax
  102b09:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_STRCPY
#define __HAVE_ARCH_STRCPY
static inline char *
__strcpy(char *dst, const char *src) {
    int d0, d1, d2;
    asm volatile (
  102b0c:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102b0f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102b12:	89 d1                	mov    %edx,%ecx
  102b14:	89 c2                	mov    %eax,%edx
  102b16:	89 ce                	mov    %ecx,%esi
  102b18:	89 d7                	mov    %edx,%edi
  102b1a:	ac                   	lods   %ds:(%esi),%al
  102b1b:	aa                   	stos   %al,%es:(%edi)
  102b1c:	84 c0                	test   %al,%al
  102b1e:	75 fa                	jne    102b1a <strcpy+0x26>
  102b20:	89 fa                	mov    %edi,%edx
  102b22:	89 f1                	mov    %esi,%ecx
  102b24:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  102b27:	89 55 e8             	mov    %edx,-0x18(%ebp)
  102b2a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            "stosb;"
            "testb %%al, %%al;"
            "jne 1b;"
            : "=&S" (d0), "=&D" (d1), "=&a" (d2)
            : "0" (src), "1" (dst) : "memory");
    return dst;
  102b2d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    char *p = dst;
    while ((*p ++ = *src ++) != '\0')
        /* nothing */;
    return dst;
#endif /* __HAVE_ARCH_STRCPY */
}
  102b30:	83 c4 20             	add    $0x20,%esp
  102b33:	5e                   	pop    %esi
  102b34:	5f                   	pop    %edi
  102b35:	5d                   	pop    %ebp
  102b36:	c3                   	ret    

00102b37 <strncpy>:
 * @len:    maximum number of characters to be copied from @src
 *
 * The return value is @dst
 * */
char *
strncpy(char *dst, const char *src, size_t len) {
  102b37:	f3 0f 1e fb          	endbr32 
  102b3b:	55                   	push   %ebp
  102b3c:	89 e5                	mov    %esp,%ebp
  102b3e:	83 ec 10             	sub    $0x10,%esp
    char *p = dst;
  102b41:	8b 45 08             	mov    0x8(%ebp),%eax
  102b44:	89 45 fc             	mov    %eax,-0x4(%ebp)
    while (len > 0) {
  102b47:	eb 1e                	jmp    102b67 <strncpy+0x30>
        if ((*p = *src) != '\0') {
  102b49:	8b 45 0c             	mov    0xc(%ebp),%eax
  102b4c:	0f b6 10             	movzbl (%eax),%edx
  102b4f:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102b52:	88 10                	mov    %dl,(%eax)
  102b54:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102b57:	0f b6 00             	movzbl (%eax),%eax
  102b5a:	84 c0                	test   %al,%al
  102b5c:	74 03                	je     102b61 <strncpy+0x2a>
            src ++;
  102b5e:	ff 45 0c             	incl   0xc(%ebp)
        }
        p ++, len --;
  102b61:	ff 45 fc             	incl   -0x4(%ebp)
  102b64:	ff 4d 10             	decl   0x10(%ebp)
    while (len > 0) {
  102b67:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102b6b:	75 dc                	jne    102b49 <strncpy+0x12>
    }
    return dst;
  102b6d:	8b 45 08             	mov    0x8(%ebp),%eax
}
  102b70:	c9                   	leave  
  102b71:	c3                   	ret    

00102b72 <strcmp>:
 * - A value greater than zero indicates that the first character that does
 *   not match has a greater value in @s1 than in @s2;
 * - And a value less than zero indicates the opposite.
 * */
int
strcmp(const char *s1, const char *s2) {
  102b72:	f3 0f 1e fb          	endbr32 
  102b76:	55                   	push   %ebp
  102b77:	89 e5                	mov    %esp,%ebp
  102b79:	57                   	push   %edi
  102b7a:	56                   	push   %esi
  102b7b:	83 ec 20             	sub    $0x20,%esp
  102b7e:	8b 45 08             	mov    0x8(%ebp),%eax
  102b81:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102b84:	8b 45 0c             	mov    0xc(%ebp),%eax
  102b87:	89 45 f0             	mov    %eax,-0x10(%ebp)
    asm volatile (
  102b8a:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102b8d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102b90:	89 d1                	mov    %edx,%ecx
  102b92:	89 c2                	mov    %eax,%edx
  102b94:	89 ce                	mov    %ecx,%esi
  102b96:	89 d7                	mov    %edx,%edi
  102b98:	ac                   	lods   %ds:(%esi),%al
  102b99:	ae                   	scas   %es:(%edi),%al
  102b9a:	75 08                	jne    102ba4 <strcmp+0x32>
  102b9c:	84 c0                	test   %al,%al
  102b9e:	75 f8                	jne    102b98 <strcmp+0x26>
  102ba0:	31 c0                	xor    %eax,%eax
  102ba2:	eb 04                	jmp    102ba8 <strcmp+0x36>
  102ba4:	19 c0                	sbb    %eax,%eax
  102ba6:	0c 01                	or     $0x1,%al
  102ba8:	89 fa                	mov    %edi,%edx
  102baa:	89 f1                	mov    %esi,%ecx
  102bac:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102baf:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  102bb2:	89 55 e4             	mov    %edx,-0x1c(%ebp)
    return ret;
  102bb5:	8b 45 ec             	mov    -0x14(%ebp),%eax
    while (*s1 != '\0' && *s1 == *s2) {
        s1 ++, s2 ++;
    }
    return (int)((unsigned char)*s1 - (unsigned char)*s2);
#endif /* __HAVE_ARCH_STRCMP */
}
  102bb8:	83 c4 20             	add    $0x20,%esp
  102bbb:	5e                   	pop    %esi
  102bbc:	5f                   	pop    %edi
  102bbd:	5d                   	pop    %ebp
  102bbe:	c3                   	ret    

00102bbf <strncmp>:
 * they are equal to each other, it continues with the following pairs until
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
  102bbf:	f3 0f 1e fb          	endbr32 
  102bc3:	55                   	push   %ebp
  102bc4:	89 e5                	mov    %esp,%ebp
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  102bc6:	eb 09                	jmp    102bd1 <strncmp+0x12>
        n --, s1 ++, s2 ++;
  102bc8:	ff 4d 10             	decl   0x10(%ebp)
  102bcb:	ff 45 08             	incl   0x8(%ebp)
  102bce:	ff 45 0c             	incl   0xc(%ebp)
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  102bd1:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102bd5:	74 1a                	je     102bf1 <strncmp+0x32>
  102bd7:	8b 45 08             	mov    0x8(%ebp),%eax
  102bda:	0f b6 00             	movzbl (%eax),%eax
  102bdd:	84 c0                	test   %al,%al
  102bdf:	74 10                	je     102bf1 <strncmp+0x32>
  102be1:	8b 45 08             	mov    0x8(%ebp),%eax
  102be4:	0f b6 10             	movzbl (%eax),%edx
  102be7:	8b 45 0c             	mov    0xc(%ebp),%eax
  102bea:	0f b6 00             	movzbl (%eax),%eax
  102bed:	38 c2                	cmp    %al,%dl
  102bef:	74 d7                	je     102bc8 <strncmp+0x9>
    }
    return (n == 0) ? 0 : (int)((unsigned char)*s1 - (unsigned char)*s2);
  102bf1:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102bf5:	74 18                	je     102c0f <strncmp+0x50>
  102bf7:	8b 45 08             	mov    0x8(%ebp),%eax
  102bfa:	0f b6 00             	movzbl (%eax),%eax
  102bfd:	0f b6 d0             	movzbl %al,%edx
  102c00:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c03:	0f b6 00             	movzbl (%eax),%eax
  102c06:	0f b6 c0             	movzbl %al,%eax
  102c09:	29 c2                	sub    %eax,%edx
  102c0b:	89 d0                	mov    %edx,%eax
  102c0d:	eb 05                	jmp    102c14 <strncmp+0x55>
  102c0f:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102c14:	5d                   	pop    %ebp
  102c15:	c3                   	ret    

00102c16 <strchr>:
 *
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
  102c16:	f3 0f 1e fb          	endbr32 
  102c1a:	55                   	push   %ebp
  102c1b:	89 e5                	mov    %esp,%ebp
  102c1d:	83 ec 04             	sub    $0x4,%esp
  102c20:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c23:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  102c26:	eb 13                	jmp    102c3b <strchr+0x25>
        if (*s == c) {
  102c28:	8b 45 08             	mov    0x8(%ebp),%eax
  102c2b:	0f b6 00             	movzbl (%eax),%eax
  102c2e:	38 45 fc             	cmp    %al,-0x4(%ebp)
  102c31:	75 05                	jne    102c38 <strchr+0x22>
            return (char *)s;
  102c33:	8b 45 08             	mov    0x8(%ebp),%eax
  102c36:	eb 12                	jmp    102c4a <strchr+0x34>
        }
        s ++;
  102c38:	ff 45 08             	incl   0x8(%ebp)
    while (*s != '\0') {
  102c3b:	8b 45 08             	mov    0x8(%ebp),%eax
  102c3e:	0f b6 00             	movzbl (%eax),%eax
  102c41:	84 c0                	test   %al,%al
  102c43:	75 e3                	jne    102c28 <strchr+0x12>
    }
    return NULL;
  102c45:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102c4a:	c9                   	leave  
  102c4b:	c3                   	ret    

00102c4c <strfind>:
 * The strfind() function is like strchr() except that if @c is
 * not found in @s, then it returns a pointer to the null byte at the
 * end of @s, rather than 'NULL'.
 * */
char *
strfind(const char *s, char c) {
  102c4c:	f3 0f 1e fb          	endbr32 
  102c50:	55                   	push   %ebp
  102c51:	89 e5                	mov    %esp,%ebp
  102c53:	83 ec 04             	sub    $0x4,%esp
  102c56:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c59:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  102c5c:	eb 0e                	jmp    102c6c <strfind+0x20>
        if (*s == c) {
  102c5e:	8b 45 08             	mov    0x8(%ebp),%eax
  102c61:	0f b6 00             	movzbl (%eax),%eax
  102c64:	38 45 fc             	cmp    %al,-0x4(%ebp)
  102c67:	74 0f                	je     102c78 <strfind+0x2c>
            break;
        }
        s ++;
  102c69:	ff 45 08             	incl   0x8(%ebp)
    while (*s != '\0') {
  102c6c:	8b 45 08             	mov    0x8(%ebp),%eax
  102c6f:	0f b6 00             	movzbl (%eax),%eax
  102c72:	84 c0                	test   %al,%al
  102c74:	75 e8                	jne    102c5e <strfind+0x12>
  102c76:	eb 01                	jmp    102c79 <strfind+0x2d>
            break;
  102c78:	90                   	nop
    }
    return (char *)s;
  102c79:	8b 45 08             	mov    0x8(%ebp),%eax
}
  102c7c:	c9                   	leave  
  102c7d:	c3                   	ret    

00102c7e <strtol>:
 * an optional "0x" or "0X" prefix.
 *
 * The strtol() function returns the converted integral number as a long int value.
 * */
long
strtol(const char *s, char **endptr, int base) {
  102c7e:	f3 0f 1e fb          	endbr32 
  102c82:	55                   	push   %ebp
  102c83:	89 e5                	mov    %esp,%ebp
  102c85:	83 ec 10             	sub    $0x10,%esp
    int neg = 0;
  102c88:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    long val = 0;
  102c8f:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t') {
  102c96:	eb 03                	jmp    102c9b <strtol+0x1d>
        s ++;
  102c98:	ff 45 08             	incl   0x8(%ebp)
    while (*s == ' ' || *s == '\t') {
  102c9b:	8b 45 08             	mov    0x8(%ebp),%eax
  102c9e:	0f b6 00             	movzbl (%eax),%eax
  102ca1:	3c 20                	cmp    $0x20,%al
  102ca3:	74 f3                	je     102c98 <strtol+0x1a>
  102ca5:	8b 45 08             	mov    0x8(%ebp),%eax
  102ca8:	0f b6 00             	movzbl (%eax),%eax
  102cab:	3c 09                	cmp    $0x9,%al
  102cad:	74 e9                	je     102c98 <strtol+0x1a>
    }

    // plus/minus sign
    if (*s == '+') {
  102caf:	8b 45 08             	mov    0x8(%ebp),%eax
  102cb2:	0f b6 00             	movzbl (%eax),%eax
  102cb5:	3c 2b                	cmp    $0x2b,%al
  102cb7:	75 05                	jne    102cbe <strtol+0x40>
        s ++;
  102cb9:	ff 45 08             	incl   0x8(%ebp)
  102cbc:	eb 14                	jmp    102cd2 <strtol+0x54>
    }
    else if (*s == '-') {
  102cbe:	8b 45 08             	mov    0x8(%ebp),%eax
  102cc1:	0f b6 00             	movzbl (%eax),%eax
  102cc4:	3c 2d                	cmp    $0x2d,%al
  102cc6:	75 0a                	jne    102cd2 <strtol+0x54>
        s ++, neg = 1;
  102cc8:	ff 45 08             	incl   0x8(%ebp)
  102ccb:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)
    }

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x')) {
  102cd2:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102cd6:	74 06                	je     102cde <strtol+0x60>
  102cd8:	83 7d 10 10          	cmpl   $0x10,0x10(%ebp)
  102cdc:	75 22                	jne    102d00 <strtol+0x82>
  102cde:	8b 45 08             	mov    0x8(%ebp),%eax
  102ce1:	0f b6 00             	movzbl (%eax),%eax
  102ce4:	3c 30                	cmp    $0x30,%al
  102ce6:	75 18                	jne    102d00 <strtol+0x82>
  102ce8:	8b 45 08             	mov    0x8(%ebp),%eax
  102ceb:	40                   	inc    %eax
  102cec:	0f b6 00             	movzbl (%eax),%eax
  102cef:	3c 78                	cmp    $0x78,%al
  102cf1:	75 0d                	jne    102d00 <strtol+0x82>
        s += 2, base = 16;
  102cf3:	83 45 08 02          	addl   $0x2,0x8(%ebp)
  102cf7:	c7 45 10 10 00 00 00 	movl   $0x10,0x10(%ebp)
  102cfe:	eb 29                	jmp    102d29 <strtol+0xab>
    }
    else if (base == 0 && s[0] == '0') {
  102d00:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102d04:	75 16                	jne    102d1c <strtol+0x9e>
  102d06:	8b 45 08             	mov    0x8(%ebp),%eax
  102d09:	0f b6 00             	movzbl (%eax),%eax
  102d0c:	3c 30                	cmp    $0x30,%al
  102d0e:	75 0c                	jne    102d1c <strtol+0x9e>
        s ++, base = 8;
  102d10:	ff 45 08             	incl   0x8(%ebp)
  102d13:	c7 45 10 08 00 00 00 	movl   $0x8,0x10(%ebp)
  102d1a:	eb 0d                	jmp    102d29 <strtol+0xab>
    }
    else if (base == 0) {
  102d1c:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102d20:	75 07                	jne    102d29 <strtol+0xab>
        base = 10;
  102d22:	c7 45 10 0a 00 00 00 	movl   $0xa,0x10(%ebp)

    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9') {
  102d29:	8b 45 08             	mov    0x8(%ebp),%eax
  102d2c:	0f b6 00             	movzbl (%eax),%eax
  102d2f:	3c 2f                	cmp    $0x2f,%al
  102d31:	7e 1b                	jle    102d4e <strtol+0xd0>
  102d33:	8b 45 08             	mov    0x8(%ebp),%eax
  102d36:	0f b6 00             	movzbl (%eax),%eax
  102d39:	3c 39                	cmp    $0x39,%al
  102d3b:	7f 11                	jg     102d4e <strtol+0xd0>
            dig = *s - '0';
  102d3d:	8b 45 08             	mov    0x8(%ebp),%eax
  102d40:	0f b6 00             	movzbl (%eax),%eax
  102d43:	0f be c0             	movsbl %al,%eax
  102d46:	83 e8 30             	sub    $0x30,%eax
  102d49:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102d4c:	eb 48                	jmp    102d96 <strtol+0x118>
        }
        else if (*s >= 'a' && *s <= 'z') {
  102d4e:	8b 45 08             	mov    0x8(%ebp),%eax
  102d51:	0f b6 00             	movzbl (%eax),%eax
  102d54:	3c 60                	cmp    $0x60,%al
  102d56:	7e 1b                	jle    102d73 <strtol+0xf5>
  102d58:	8b 45 08             	mov    0x8(%ebp),%eax
  102d5b:	0f b6 00             	movzbl (%eax),%eax
  102d5e:	3c 7a                	cmp    $0x7a,%al
  102d60:	7f 11                	jg     102d73 <strtol+0xf5>
            dig = *s - 'a' + 10;
  102d62:	8b 45 08             	mov    0x8(%ebp),%eax
  102d65:	0f b6 00             	movzbl (%eax),%eax
  102d68:	0f be c0             	movsbl %al,%eax
  102d6b:	83 e8 57             	sub    $0x57,%eax
  102d6e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102d71:	eb 23                	jmp    102d96 <strtol+0x118>
        }
        else if (*s >= 'A' && *s <= 'Z') {
  102d73:	8b 45 08             	mov    0x8(%ebp),%eax
  102d76:	0f b6 00             	movzbl (%eax),%eax
  102d79:	3c 40                	cmp    $0x40,%al
  102d7b:	7e 3b                	jle    102db8 <strtol+0x13a>
  102d7d:	8b 45 08             	mov    0x8(%ebp),%eax
  102d80:	0f b6 00             	movzbl (%eax),%eax
  102d83:	3c 5a                	cmp    $0x5a,%al
  102d85:	7f 31                	jg     102db8 <strtol+0x13a>
            dig = *s - 'A' + 10;
  102d87:	8b 45 08             	mov    0x8(%ebp),%eax
  102d8a:	0f b6 00             	movzbl (%eax),%eax
  102d8d:	0f be c0             	movsbl %al,%eax
  102d90:	83 e8 37             	sub    $0x37,%eax
  102d93:	89 45 f4             	mov    %eax,-0xc(%ebp)
        }
        else {
            break;
        }
        if (dig >= base) {
  102d96:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102d99:	3b 45 10             	cmp    0x10(%ebp),%eax
  102d9c:	7d 19                	jge    102db7 <strtol+0x139>
            break;
        }
        s ++, val = (val * base) + dig;
  102d9e:	ff 45 08             	incl   0x8(%ebp)
  102da1:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102da4:	0f af 45 10          	imul   0x10(%ebp),%eax
  102da8:	89 c2                	mov    %eax,%edx
  102daa:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102dad:	01 d0                	add    %edx,%eax
  102daf:	89 45 f8             	mov    %eax,-0x8(%ebp)
    while (1) {
  102db2:	e9 72 ff ff ff       	jmp    102d29 <strtol+0xab>
            break;
  102db7:	90                   	nop
        // we don't properly detect overflow!
    }

    if (endptr) {
  102db8:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102dbc:	74 08                	je     102dc6 <strtol+0x148>
        *endptr = (char *) s;
  102dbe:	8b 45 0c             	mov    0xc(%ebp),%eax
  102dc1:	8b 55 08             	mov    0x8(%ebp),%edx
  102dc4:	89 10                	mov    %edx,(%eax)
    }
    return (neg ? -val : val);
  102dc6:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
  102dca:	74 07                	je     102dd3 <strtol+0x155>
  102dcc:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102dcf:	f7 d8                	neg    %eax
  102dd1:	eb 03                	jmp    102dd6 <strtol+0x158>
  102dd3:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
  102dd6:	c9                   	leave  
  102dd7:	c3                   	ret    

00102dd8 <memset>:
 * @n:        number of bytes to be set to the value
 *
 * The memset() function returns @s.
 * */
void *
memset(void *s, char c, size_t n) {
  102dd8:	f3 0f 1e fb          	endbr32 
  102ddc:	55                   	push   %ebp
  102ddd:	89 e5                	mov    %esp,%ebp
  102ddf:	57                   	push   %edi
  102de0:	83 ec 24             	sub    $0x24,%esp
  102de3:	8b 45 0c             	mov    0xc(%ebp),%eax
  102de6:	88 45 d8             	mov    %al,-0x28(%ebp)
#ifdef __HAVE_ARCH_MEMSET
    return __memset(s, c, n);
  102de9:	0f be 55 d8          	movsbl -0x28(%ebp),%edx
  102ded:	8b 45 08             	mov    0x8(%ebp),%eax
  102df0:	89 45 f8             	mov    %eax,-0x8(%ebp)
  102df3:	88 55 f7             	mov    %dl,-0x9(%ebp)
  102df6:	8b 45 10             	mov    0x10(%ebp),%eax
  102df9:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_MEMSET
#define __HAVE_ARCH_MEMSET
static inline void *
__memset(void *s, char c, size_t n) {
    int d0, d1;
    asm volatile (
  102dfc:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  102dff:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  102e03:	8b 55 f8             	mov    -0x8(%ebp),%edx
  102e06:	89 d7                	mov    %edx,%edi
  102e08:	f3 aa                	rep stos %al,%es:(%edi)
  102e0a:	89 fa                	mov    %edi,%edx
  102e0c:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  102e0f:	89 55 e8             	mov    %edx,-0x18(%ebp)
            "rep; stosb;"
            : "=&c" (d0), "=&D" (d1)
            : "0" (n), "a" (c), "1" (s)
            : "memory");
    return s;
  102e12:	8b 45 f8             	mov    -0x8(%ebp),%eax
    while (n -- > 0) {
        *p ++ = c;
    }
    return s;
#endif /* __HAVE_ARCH_MEMSET */
}
  102e15:	83 c4 24             	add    $0x24,%esp
  102e18:	5f                   	pop    %edi
  102e19:	5d                   	pop    %ebp
  102e1a:	c3                   	ret    

00102e1b <memmove>:
 * @n:        number of bytes to copy
 *
 * The memmove() function returns @dst.
 * */
void *
memmove(void *dst, const void *src, size_t n) {
  102e1b:	f3 0f 1e fb          	endbr32 
  102e1f:	55                   	push   %ebp
  102e20:	89 e5                	mov    %esp,%ebp
  102e22:	57                   	push   %edi
  102e23:	56                   	push   %esi
  102e24:	53                   	push   %ebx
  102e25:	83 ec 30             	sub    $0x30,%esp
  102e28:	8b 45 08             	mov    0x8(%ebp),%eax
  102e2b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102e2e:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e31:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102e34:	8b 45 10             	mov    0x10(%ebp),%eax
  102e37:	89 45 e8             	mov    %eax,-0x18(%ebp)

#ifndef __HAVE_ARCH_MEMMOVE
#define __HAVE_ARCH_MEMMOVE
static inline void *
__memmove(void *dst, const void *src, size_t n) {
    if (dst < src) {
  102e3a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102e3d:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  102e40:	73 42                	jae    102e84 <memmove+0x69>
  102e42:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102e45:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  102e48:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102e4b:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102e4e:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102e51:	89 45 dc             	mov    %eax,-0x24(%ebp)
            "andl $3, %%ecx;"
            "jz 1f;"
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  102e54:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102e57:	c1 e8 02             	shr    $0x2,%eax
  102e5a:	89 c1                	mov    %eax,%ecx
    asm volatile (
  102e5c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  102e5f:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102e62:	89 d7                	mov    %edx,%edi
  102e64:	89 c6                	mov    %eax,%esi
  102e66:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  102e68:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  102e6b:	83 e1 03             	and    $0x3,%ecx
  102e6e:	74 02                	je     102e72 <memmove+0x57>
  102e70:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102e72:	89 f0                	mov    %esi,%eax
  102e74:	89 fa                	mov    %edi,%edx
  102e76:	89 4d d8             	mov    %ecx,-0x28(%ebp)
  102e79:	89 55 d4             	mov    %edx,-0x2c(%ebp)
  102e7c:	89 45 d0             	mov    %eax,-0x30(%ebp)
            : "memory");
    return dst;
  102e7f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
        return __memcpy(dst, src, n);
  102e82:	eb 36                	jmp    102eba <memmove+0x9f>
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
  102e84:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102e87:	8d 50 ff             	lea    -0x1(%eax),%edx
  102e8a:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102e8d:	01 c2                	add    %eax,%edx
  102e8f:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102e92:	8d 48 ff             	lea    -0x1(%eax),%ecx
  102e95:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102e98:	8d 1c 01             	lea    (%ecx,%eax,1),%ebx
    asm volatile (
  102e9b:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102e9e:	89 c1                	mov    %eax,%ecx
  102ea0:	89 d8                	mov    %ebx,%eax
  102ea2:	89 d6                	mov    %edx,%esi
  102ea4:	89 c7                	mov    %eax,%edi
  102ea6:	fd                   	std    
  102ea7:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102ea9:	fc                   	cld    
  102eaa:	89 f8                	mov    %edi,%eax
  102eac:	89 f2                	mov    %esi,%edx
  102eae:	89 4d cc             	mov    %ecx,-0x34(%ebp)
  102eb1:	89 55 c8             	mov    %edx,-0x38(%ebp)
  102eb4:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    return dst;
  102eb7:	8b 45 f0             	mov    -0x10(%ebp),%eax
            *d ++ = *s ++;
        }
    }
    return dst;
#endif /* __HAVE_ARCH_MEMMOVE */
}
  102eba:	83 c4 30             	add    $0x30,%esp
  102ebd:	5b                   	pop    %ebx
  102ebe:	5e                   	pop    %esi
  102ebf:	5f                   	pop    %edi
  102ec0:	5d                   	pop    %ebp
  102ec1:	c3                   	ret    

00102ec2 <memcpy>:
 * it always copies exactly @n bytes. To avoid overflows, the size of arrays pointed
 * by both @src and @dst, should be at least @n bytes, and should not overlap
 * (for overlapping memory area, memmove is a safer approach).
 * */
void *
memcpy(void *dst, const void *src, size_t n) {
  102ec2:	f3 0f 1e fb          	endbr32 
  102ec6:	55                   	push   %ebp
  102ec7:	89 e5                	mov    %esp,%ebp
  102ec9:	57                   	push   %edi
  102eca:	56                   	push   %esi
  102ecb:	83 ec 20             	sub    $0x20,%esp
  102ece:	8b 45 08             	mov    0x8(%ebp),%eax
  102ed1:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102ed4:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ed7:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102eda:	8b 45 10             	mov    0x10(%ebp),%eax
  102edd:	89 45 ec             	mov    %eax,-0x14(%ebp)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  102ee0:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102ee3:	c1 e8 02             	shr    $0x2,%eax
  102ee6:	89 c1                	mov    %eax,%ecx
    asm volatile (
  102ee8:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102eeb:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102eee:	89 d7                	mov    %edx,%edi
  102ef0:	89 c6                	mov    %eax,%esi
  102ef2:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  102ef4:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  102ef7:	83 e1 03             	and    $0x3,%ecx
  102efa:	74 02                	je     102efe <memcpy+0x3c>
  102efc:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102efe:	89 f0                	mov    %esi,%eax
  102f00:	89 fa                	mov    %edi,%edx
  102f02:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  102f05:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  102f08:	89 45 e0             	mov    %eax,-0x20(%ebp)
    return dst;
  102f0b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    while (n -- > 0) {
        *d ++ = *s ++;
    }
    return dst;
#endif /* __HAVE_ARCH_MEMCPY */
}
  102f0e:	83 c4 20             	add    $0x20,%esp
  102f11:	5e                   	pop    %esi
  102f12:	5f                   	pop    %edi
  102f13:	5d                   	pop    %ebp
  102f14:	c3                   	ret    

00102f15 <memcmp>:
 *   match in both memory blocks has a greater value in @v1 than in @v2
 *   as if evaluated as unsigned char values;
 * - And a value less than zero indicates the opposite.
 * */
int
memcmp(const void *v1, const void *v2, size_t n) {
  102f15:	f3 0f 1e fb          	endbr32 
  102f19:	55                   	push   %ebp
  102f1a:	89 e5                	mov    %esp,%ebp
  102f1c:	83 ec 10             	sub    $0x10,%esp
    const char *s1 = (const char *)v1;
  102f1f:	8b 45 08             	mov    0x8(%ebp),%eax
  102f22:	89 45 fc             	mov    %eax,-0x4(%ebp)
    const char *s2 = (const char *)v2;
  102f25:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f28:	89 45 f8             	mov    %eax,-0x8(%ebp)
    while (n -- > 0) {
  102f2b:	eb 2e                	jmp    102f5b <memcmp+0x46>
        if (*s1 != *s2) {
  102f2d:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102f30:	0f b6 10             	movzbl (%eax),%edx
  102f33:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102f36:	0f b6 00             	movzbl (%eax),%eax
  102f39:	38 c2                	cmp    %al,%dl
  102f3b:	74 18                	je     102f55 <memcmp+0x40>
            return (int)((unsigned char)*s1 - (unsigned char)*s2);
  102f3d:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102f40:	0f b6 00             	movzbl (%eax),%eax
  102f43:	0f b6 d0             	movzbl %al,%edx
  102f46:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102f49:	0f b6 00             	movzbl (%eax),%eax
  102f4c:	0f b6 c0             	movzbl %al,%eax
  102f4f:	29 c2                	sub    %eax,%edx
  102f51:	89 d0                	mov    %edx,%eax
  102f53:	eb 18                	jmp    102f6d <memcmp+0x58>
        }
        s1 ++, s2 ++;
  102f55:	ff 45 fc             	incl   -0x4(%ebp)
  102f58:	ff 45 f8             	incl   -0x8(%ebp)
    while (n -- > 0) {
  102f5b:	8b 45 10             	mov    0x10(%ebp),%eax
  102f5e:	8d 50 ff             	lea    -0x1(%eax),%edx
  102f61:	89 55 10             	mov    %edx,0x10(%ebp)
  102f64:	85 c0                	test   %eax,%eax
  102f66:	75 c5                	jne    102f2d <memcmp+0x18>
    }
    return 0;
  102f68:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102f6d:	c9                   	leave  
  102f6e:	c3                   	ret    

00102f6f <printnum>:
 * @width:         maximum number of digits, if the actual width is less than @width, use @padc instead
 * @padc:        character that padded on the left if the actual width is less than @width
 * */
static void
printnum(void (*putch)(int, void*), void *putdat,
        unsigned long long num, unsigned base, int width, int padc) {
  102f6f:	f3 0f 1e fb          	endbr32 
  102f73:	55                   	push   %ebp
  102f74:	89 e5                	mov    %esp,%ebp
  102f76:	83 ec 58             	sub    $0x58,%esp
  102f79:	8b 45 10             	mov    0x10(%ebp),%eax
  102f7c:	89 45 d0             	mov    %eax,-0x30(%ebp)
  102f7f:	8b 45 14             	mov    0x14(%ebp),%eax
  102f82:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    unsigned long long result = num;
  102f85:	8b 45 d0             	mov    -0x30(%ebp),%eax
  102f88:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  102f8b:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102f8e:	89 55 ec             	mov    %edx,-0x14(%ebp)
    unsigned mod = do_div(result, base);
  102f91:	8b 45 18             	mov    0x18(%ebp),%eax
  102f94:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  102f97:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102f9a:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102f9d:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102fa0:	89 55 f0             	mov    %edx,-0x10(%ebp)
  102fa3:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102fa6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102fa9:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  102fad:	74 1c                	je     102fcb <printnum+0x5c>
  102faf:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102fb2:	ba 00 00 00 00       	mov    $0x0,%edx
  102fb7:	f7 75 e4             	divl   -0x1c(%ebp)
  102fba:	89 55 f4             	mov    %edx,-0xc(%ebp)
  102fbd:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102fc0:	ba 00 00 00 00       	mov    $0x0,%edx
  102fc5:	f7 75 e4             	divl   -0x1c(%ebp)
  102fc8:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102fcb:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102fce:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102fd1:	f7 75 e4             	divl   -0x1c(%ebp)
  102fd4:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102fd7:	89 55 dc             	mov    %edx,-0x24(%ebp)
  102fda:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102fdd:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102fe0:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102fe3:	89 55 ec             	mov    %edx,-0x14(%ebp)
  102fe6:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102fe9:	89 45 d8             	mov    %eax,-0x28(%ebp)

    // first recursively print all preceding (more significant) digits
    if (num >= base) {
  102fec:	8b 45 18             	mov    0x18(%ebp),%eax
  102fef:	ba 00 00 00 00       	mov    $0x0,%edx
  102ff4:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
  102ff7:	39 45 d0             	cmp    %eax,-0x30(%ebp)
  102ffa:	19 d1                	sbb    %edx,%ecx
  102ffc:	72 4c                	jb     10304a <printnum+0xdb>
        printnum(putch, putdat, result, base, width - 1, padc);
  102ffe:	8b 45 1c             	mov    0x1c(%ebp),%eax
  103001:	8d 50 ff             	lea    -0x1(%eax),%edx
  103004:	8b 45 20             	mov    0x20(%ebp),%eax
  103007:	89 44 24 18          	mov    %eax,0x18(%esp)
  10300b:	89 54 24 14          	mov    %edx,0x14(%esp)
  10300f:	8b 45 18             	mov    0x18(%ebp),%eax
  103012:	89 44 24 10          	mov    %eax,0x10(%esp)
  103016:	8b 45 e8             	mov    -0x18(%ebp),%eax
  103019:	8b 55 ec             	mov    -0x14(%ebp),%edx
  10301c:	89 44 24 08          	mov    %eax,0x8(%esp)
  103020:	89 54 24 0c          	mov    %edx,0xc(%esp)
  103024:	8b 45 0c             	mov    0xc(%ebp),%eax
  103027:	89 44 24 04          	mov    %eax,0x4(%esp)
  10302b:	8b 45 08             	mov    0x8(%ebp),%eax
  10302e:	89 04 24             	mov    %eax,(%esp)
  103031:	e8 39 ff ff ff       	call   102f6f <printnum>
  103036:	eb 1b                	jmp    103053 <printnum+0xe4>
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
            putch(padc, putdat);
  103038:	8b 45 0c             	mov    0xc(%ebp),%eax
  10303b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10303f:	8b 45 20             	mov    0x20(%ebp),%eax
  103042:	89 04 24             	mov    %eax,(%esp)
  103045:	8b 45 08             	mov    0x8(%ebp),%eax
  103048:	ff d0                	call   *%eax
        while (-- width > 0)
  10304a:	ff 4d 1c             	decl   0x1c(%ebp)
  10304d:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
  103051:	7f e5                	jg     103038 <printnum+0xc9>
    }
    // then print this (the least significant) digit
    putch("0123456789abcdef"[mod], putdat);
  103053:	8b 45 d8             	mov    -0x28(%ebp),%eax
  103056:	05 b0 3d 10 00       	add    $0x103db0,%eax
  10305b:	0f b6 00             	movzbl (%eax),%eax
  10305e:	0f be c0             	movsbl %al,%eax
  103061:	8b 55 0c             	mov    0xc(%ebp),%edx
  103064:	89 54 24 04          	mov    %edx,0x4(%esp)
  103068:	89 04 24             	mov    %eax,(%esp)
  10306b:	8b 45 08             	mov    0x8(%ebp),%eax
  10306e:	ff d0                	call   *%eax
}
  103070:	90                   	nop
  103071:	c9                   	leave  
  103072:	c3                   	ret    

00103073 <getuint>:
 * getuint - get an unsigned int of various possible sizes from a varargs list
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static unsigned long long
getuint(va_list *ap, int lflag) {
  103073:	f3 0f 1e fb          	endbr32 
  103077:	55                   	push   %ebp
  103078:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  10307a:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  10307e:	7e 14                	jle    103094 <getuint+0x21>
        return va_arg(*ap, unsigned long long);
  103080:	8b 45 08             	mov    0x8(%ebp),%eax
  103083:	8b 00                	mov    (%eax),%eax
  103085:	8d 48 08             	lea    0x8(%eax),%ecx
  103088:	8b 55 08             	mov    0x8(%ebp),%edx
  10308b:	89 0a                	mov    %ecx,(%edx)
  10308d:	8b 50 04             	mov    0x4(%eax),%edx
  103090:	8b 00                	mov    (%eax),%eax
  103092:	eb 30                	jmp    1030c4 <getuint+0x51>
    }
    else if (lflag) {
  103094:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  103098:	74 16                	je     1030b0 <getuint+0x3d>
        return va_arg(*ap, unsigned long);
  10309a:	8b 45 08             	mov    0x8(%ebp),%eax
  10309d:	8b 00                	mov    (%eax),%eax
  10309f:	8d 48 04             	lea    0x4(%eax),%ecx
  1030a2:	8b 55 08             	mov    0x8(%ebp),%edx
  1030a5:	89 0a                	mov    %ecx,(%edx)
  1030a7:	8b 00                	mov    (%eax),%eax
  1030a9:	ba 00 00 00 00       	mov    $0x0,%edx
  1030ae:	eb 14                	jmp    1030c4 <getuint+0x51>
    }
    else {
        return va_arg(*ap, unsigned int);
  1030b0:	8b 45 08             	mov    0x8(%ebp),%eax
  1030b3:	8b 00                	mov    (%eax),%eax
  1030b5:	8d 48 04             	lea    0x4(%eax),%ecx
  1030b8:	8b 55 08             	mov    0x8(%ebp),%edx
  1030bb:	89 0a                	mov    %ecx,(%edx)
  1030bd:	8b 00                	mov    (%eax),%eax
  1030bf:	ba 00 00 00 00       	mov    $0x0,%edx
    }
}
  1030c4:	5d                   	pop    %ebp
  1030c5:	c3                   	ret    

001030c6 <getint>:
 * getint - same as getuint but signed, we can't use getuint because of sign extension
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static long long
getint(va_list *ap, int lflag) {
  1030c6:	f3 0f 1e fb          	endbr32 
  1030ca:	55                   	push   %ebp
  1030cb:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  1030cd:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  1030d1:	7e 14                	jle    1030e7 <getint+0x21>
        return va_arg(*ap, long long);
  1030d3:	8b 45 08             	mov    0x8(%ebp),%eax
  1030d6:	8b 00                	mov    (%eax),%eax
  1030d8:	8d 48 08             	lea    0x8(%eax),%ecx
  1030db:	8b 55 08             	mov    0x8(%ebp),%edx
  1030de:	89 0a                	mov    %ecx,(%edx)
  1030e0:	8b 50 04             	mov    0x4(%eax),%edx
  1030e3:	8b 00                	mov    (%eax),%eax
  1030e5:	eb 28                	jmp    10310f <getint+0x49>
    }
    else if (lflag) {
  1030e7:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  1030eb:	74 12                	je     1030ff <getint+0x39>
        return va_arg(*ap, long);
  1030ed:	8b 45 08             	mov    0x8(%ebp),%eax
  1030f0:	8b 00                	mov    (%eax),%eax
  1030f2:	8d 48 04             	lea    0x4(%eax),%ecx
  1030f5:	8b 55 08             	mov    0x8(%ebp),%edx
  1030f8:	89 0a                	mov    %ecx,(%edx)
  1030fa:	8b 00                	mov    (%eax),%eax
  1030fc:	99                   	cltd   
  1030fd:	eb 10                	jmp    10310f <getint+0x49>
    }
    else {
        return va_arg(*ap, int);
  1030ff:	8b 45 08             	mov    0x8(%ebp),%eax
  103102:	8b 00                	mov    (%eax),%eax
  103104:	8d 48 04             	lea    0x4(%eax),%ecx
  103107:	8b 55 08             	mov    0x8(%ebp),%edx
  10310a:	89 0a                	mov    %ecx,(%edx)
  10310c:	8b 00                	mov    (%eax),%eax
  10310e:	99                   	cltd   
    }
}
  10310f:	5d                   	pop    %ebp
  103110:	c3                   	ret    

00103111 <printfmt>:
 * @putch:        specified putch function, print a single character
 * @putdat:        used by @putch function
 * @fmt:        the format string to use
 * */
void
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...) {
  103111:	f3 0f 1e fb          	endbr32 
  103115:	55                   	push   %ebp
  103116:	89 e5                	mov    %esp,%ebp
  103118:	83 ec 28             	sub    $0x28,%esp
    va_list ap;

    va_start(ap, fmt);
  10311b:	8d 45 14             	lea    0x14(%ebp),%eax
  10311e:	89 45 f4             	mov    %eax,-0xc(%ebp)
    vprintfmt(putch, putdat, fmt, ap);
  103121:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103124:	89 44 24 0c          	mov    %eax,0xc(%esp)
  103128:	8b 45 10             	mov    0x10(%ebp),%eax
  10312b:	89 44 24 08          	mov    %eax,0x8(%esp)
  10312f:	8b 45 0c             	mov    0xc(%ebp),%eax
  103132:	89 44 24 04          	mov    %eax,0x4(%esp)
  103136:	8b 45 08             	mov    0x8(%ebp),%eax
  103139:	89 04 24             	mov    %eax,(%esp)
  10313c:	e8 03 00 00 00       	call   103144 <vprintfmt>
    va_end(ap);
}
  103141:	90                   	nop
  103142:	c9                   	leave  
  103143:	c3                   	ret    

00103144 <vprintfmt>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want printfmt() instead.
 * */
void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap) {
  103144:	f3 0f 1e fb          	endbr32 
  103148:	55                   	push   %ebp
  103149:	89 e5                	mov    %esp,%ebp
  10314b:	56                   	push   %esi
  10314c:	53                   	push   %ebx
  10314d:	83 ec 40             	sub    $0x40,%esp
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  103150:	eb 17                	jmp    103169 <vprintfmt+0x25>
            if (ch == '\0') {
  103152:	85 db                	test   %ebx,%ebx
  103154:	0f 84 c0 03 00 00    	je     10351a <vprintfmt+0x3d6>
                return;
            }
            putch(ch, putdat);
  10315a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10315d:	89 44 24 04          	mov    %eax,0x4(%esp)
  103161:	89 1c 24             	mov    %ebx,(%esp)
  103164:	8b 45 08             	mov    0x8(%ebp),%eax
  103167:	ff d0                	call   *%eax
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  103169:	8b 45 10             	mov    0x10(%ebp),%eax
  10316c:	8d 50 01             	lea    0x1(%eax),%edx
  10316f:	89 55 10             	mov    %edx,0x10(%ebp)
  103172:	0f b6 00             	movzbl (%eax),%eax
  103175:	0f b6 d8             	movzbl %al,%ebx
  103178:	83 fb 25             	cmp    $0x25,%ebx
  10317b:	75 d5                	jne    103152 <vprintfmt+0xe>
        }

        // Process a %-escape sequence
        char padc = ' ';
  10317d:	c6 45 db 20          	movb   $0x20,-0x25(%ebp)
        width = precision = -1;
  103181:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
  103188:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  10318b:	89 45 e8             	mov    %eax,-0x18(%ebp)
        lflag = altflag = 0;
  10318e:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  103195:	8b 45 dc             	mov    -0x24(%ebp),%eax
  103198:	89 45 e0             	mov    %eax,-0x20(%ebp)

    reswitch:
        switch (ch = *(unsigned char *)fmt ++) {
  10319b:	8b 45 10             	mov    0x10(%ebp),%eax
  10319e:	8d 50 01             	lea    0x1(%eax),%edx
  1031a1:	89 55 10             	mov    %edx,0x10(%ebp)
  1031a4:	0f b6 00             	movzbl (%eax),%eax
  1031a7:	0f b6 d8             	movzbl %al,%ebx
  1031aa:	8d 43 dd             	lea    -0x23(%ebx),%eax
  1031ad:	83 f8 55             	cmp    $0x55,%eax
  1031b0:	0f 87 38 03 00 00    	ja     1034ee <vprintfmt+0x3aa>
  1031b6:	8b 04 85 d4 3d 10 00 	mov    0x103dd4(,%eax,4),%eax
  1031bd:	3e ff e0             	notrack jmp *%eax

        // flag to pad on the right
        case '-':
            padc = '-';
  1031c0:	c6 45 db 2d          	movb   $0x2d,-0x25(%ebp)
            goto reswitch;
  1031c4:	eb d5                	jmp    10319b <vprintfmt+0x57>

        // flag to pad with 0's instead of spaces
        case '0':
            padc = '0';
  1031c6:	c6 45 db 30          	movb   $0x30,-0x25(%ebp)
            goto reswitch;
  1031ca:	eb cf                	jmp    10319b <vprintfmt+0x57>

        // width field
        case '1' ... '9':
            for (precision = 0; ; ++ fmt) {
  1031cc:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
                precision = precision * 10 + ch - '0';
  1031d3:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  1031d6:	89 d0                	mov    %edx,%eax
  1031d8:	c1 e0 02             	shl    $0x2,%eax
  1031db:	01 d0                	add    %edx,%eax
  1031dd:	01 c0                	add    %eax,%eax
  1031df:	01 d8                	add    %ebx,%eax
  1031e1:	83 e8 30             	sub    $0x30,%eax
  1031e4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
                ch = *fmt;
  1031e7:	8b 45 10             	mov    0x10(%ebp),%eax
  1031ea:	0f b6 00             	movzbl (%eax),%eax
  1031ed:	0f be d8             	movsbl %al,%ebx
                if (ch < '0' || ch > '9') {
  1031f0:	83 fb 2f             	cmp    $0x2f,%ebx
  1031f3:	7e 38                	jle    10322d <vprintfmt+0xe9>
  1031f5:	83 fb 39             	cmp    $0x39,%ebx
  1031f8:	7f 33                	jg     10322d <vprintfmt+0xe9>
            for (precision = 0; ; ++ fmt) {
  1031fa:	ff 45 10             	incl   0x10(%ebp)
                precision = precision * 10 + ch - '0';
  1031fd:	eb d4                	jmp    1031d3 <vprintfmt+0x8f>
                }
            }
            goto process_precision;

        case '*':
            precision = va_arg(ap, int);
  1031ff:	8b 45 14             	mov    0x14(%ebp),%eax
  103202:	8d 50 04             	lea    0x4(%eax),%edx
  103205:	89 55 14             	mov    %edx,0x14(%ebp)
  103208:	8b 00                	mov    (%eax),%eax
  10320a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            goto process_precision;
  10320d:	eb 1f                	jmp    10322e <vprintfmt+0xea>

        case '.':
            if (width < 0)
  10320f:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  103213:	79 86                	jns    10319b <vprintfmt+0x57>
                width = 0;
  103215:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
            goto reswitch;
  10321c:	e9 7a ff ff ff       	jmp    10319b <vprintfmt+0x57>

        case '#':
            altflag = 1;
  103221:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
            goto reswitch;
  103228:	e9 6e ff ff ff       	jmp    10319b <vprintfmt+0x57>
            goto process_precision;
  10322d:	90                   	nop

        process_precision:
            if (width < 0)
  10322e:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  103232:	0f 89 63 ff ff ff    	jns    10319b <vprintfmt+0x57>
                width = precision, precision = -1;
  103238:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  10323b:	89 45 e8             	mov    %eax,-0x18(%ebp)
  10323e:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
            goto reswitch;
  103245:	e9 51 ff ff ff       	jmp    10319b <vprintfmt+0x57>

        // long flag (doubled for long long)
        case 'l':
            lflag ++;
  10324a:	ff 45 e0             	incl   -0x20(%ebp)
            goto reswitch;
  10324d:	e9 49 ff ff ff       	jmp    10319b <vprintfmt+0x57>

        // character
        case 'c':
            putch(va_arg(ap, int), putdat);
  103252:	8b 45 14             	mov    0x14(%ebp),%eax
  103255:	8d 50 04             	lea    0x4(%eax),%edx
  103258:	89 55 14             	mov    %edx,0x14(%ebp)
  10325b:	8b 00                	mov    (%eax),%eax
  10325d:	8b 55 0c             	mov    0xc(%ebp),%edx
  103260:	89 54 24 04          	mov    %edx,0x4(%esp)
  103264:	89 04 24             	mov    %eax,(%esp)
  103267:	8b 45 08             	mov    0x8(%ebp),%eax
  10326a:	ff d0                	call   *%eax
            break;
  10326c:	e9 a4 02 00 00       	jmp    103515 <vprintfmt+0x3d1>

        // error message
        case 'e':
            err = va_arg(ap, int);
  103271:	8b 45 14             	mov    0x14(%ebp),%eax
  103274:	8d 50 04             	lea    0x4(%eax),%edx
  103277:	89 55 14             	mov    %edx,0x14(%ebp)
  10327a:	8b 18                	mov    (%eax),%ebx
            if (err < 0) {
  10327c:	85 db                	test   %ebx,%ebx
  10327e:	79 02                	jns    103282 <vprintfmt+0x13e>
                err = -err;
  103280:	f7 db                	neg    %ebx
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
  103282:	83 fb 06             	cmp    $0x6,%ebx
  103285:	7f 0b                	jg     103292 <vprintfmt+0x14e>
  103287:	8b 34 9d 94 3d 10 00 	mov    0x103d94(,%ebx,4),%esi
  10328e:	85 f6                	test   %esi,%esi
  103290:	75 23                	jne    1032b5 <vprintfmt+0x171>
                printfmt(putch, putdat, "error %d", err);
  103292:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  103296:	c7 44 24 08 c1 3d 10 	movl   $0x103dc1,0x8(%esp)
  10329d:	00 
  10329e:	8b 45 0c             	mov    0xc(%ebp),%eax
  1032a1:	89 44 24 04          	mov    %eax,0x4(%esp)
  1032a5:	8b 45 08             	mov    0x8(%ebp),%eax
  1032a8:	89 04 24             	mov    %eax,(%esp)
  1032ab:	e8 61 fe ff ff       	call   103111 <printfmt>
            }
            else {
                printfmt(putch, putdat, "%s", p);
            }
            break;
  1032b0:	e9 60 02 00 00       	jmp    103515 <vprintfmt+0x3d1>
                printfmt(putch, putdat, "%s", p);
  1032b5:	89 74 24 0c          	mov    %esi,0xc(%esp)
  1032b9:	c7 44 24 08 ca 3d 10 	movl   $0x103dca,0x8(%esp)
  1032c0:	00 
  1032c1:	8b 45 0c             	mov    0xc(%ebp),%eax
  1032c4:	89 44 24 04          	mov    %eax,0x4(%esp)
  1032c8:	8b 45 08             	mov    0x8(%ebp),%eax
  1032cb:	89 04 24             	mov    %eax,(%esp)
  1032ce:	e8 3e fe ff ff       	call   103111 <printfmt>
            break;
  1032d3:	e9 3d 02 00 00       	jmp    103515 <vprintfmt+0x3d1>

        // string
        case 's':
            if ((p = va_arg(ap, char *)) == NULL) {
  1032d8:	8b 45 14             	mov    0x14(%ebp),%eax
  1032db:	8d 50 04             	lea    0x4(%eax),%edx
  1032de:	89 55 14             	mov    %edx,0x14(%ebp)
  1032e1:	8b 30                	mov    (%eax),%esi
  1032e3:	85 f6                	test   %esi,%esi
  1032e5:	75 05                	jne    1032ec <vprintfmt+0x1a8>
                p = "(null)";
  1032e7:	be cd 3d 10 00       	mov    $0x103dcd,%esi
            }
            if (width > 0 && padc != '-') {
  1032ec:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  1032f0:	7e 76                	jle    103368 <vprintfmt+0x224>
  1032f2:	80 7d db 2d          	cmpb   $0x2d,-0x25(%ebp)
  1032f6:	74 70                	je     103368 <vprintfmt+0x224>
                for (width -= strnlen(p, precision); width > 0; width --) {
  1032f8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1032fb:	89 44 24 04          	mov    %eax,0x4(%esp)
  1032ff:	89 34 24             	mov    %esi,(%esp)
  103302:	e8 ba f7 ff ff       	call   102ac1 <strnlen>
  103307:	8b 55 e8             	mov    -0x18(%ebp),%edx
  10330a:	29 c2                	sub    %eax,%edx
  10330c:	89 d0                	mov    %edx,%eax
  10330e:	89 45 e8             	mov    %eax,-0x18(%ebp)
  103311:	eb 16                	jmp    103329 <vprintfmt+0x1e5>
                    putch(padc, putdat);
  103313:	0f be 45 db          	movsbl -0x25(%ebp),%eax
  103317:	8b 55 0c             	mov    0xc(%ebp),%edx
  10331a:	89 54 24 04          	mov    %edx,0x4(%esp)
  10331e:	89 04 24             	mov    %eax,(%esp)
  103321:	8b 45 08             	mov    0x8(%ebp),%eax
  103324:	ff d0                	call   *%eax
                for (width -= strnlen(p, precision); width > 0; width --) {
  103326:	ff 4d e8             	decl   -0x18(%ebp)
  103329:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  10332d:	7f e4                	jg     103313 <vprintfmt+0x1cf>
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  10332f:	eb 37                	jmp    103368 <vprintfmt+0x224>
                if (altflag && (ch < ' ' || ch > '~')) {
  103331:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
  103335:	74 1f                	je     103356 <vprintfmt+0x212>
  103337:	83 fb 1f             	cmp    $0x1f,%ebx
  10333a:	7e 05                	jle    103341 <vprintfmt+0x1fd>
  10333c:	83 fb 7e             	cmp    $0x7e,%ebx
  10333f:	7e 15                	jle    103356 <vprintfmt+0x212>
                    putch('?', putdat);
  103341:	8b 45 0c             	mov    0xc(%ebp),%eax
  103344:	89 44 24 04          	mov    %eax,0x4(%esp)
  103348:	c7 04 24 3f 00 00 00 	movl   $0x3f,(%esp)
  10334f:	8b 45 08             	mov    0x8(%ebp),%eax
  103352:	ff d0                	call   *%eax
  103354:	eb 0f                	jmp    103365 <vprintfmt+0x221>
                }
                else {
                    putch(ch, putdat);
  103356:	8b 45 0c             	mov    0xc(%ebp),%eax
  103359:	89 44 24 04          	mov    %eax,0x4(%esp)
  10335d:	89 1c 24             	mov    %ebx,(%esp)
  103360:	8b 45 08             	mov    0x8(%ebp),%eax
  103363:	ff d0                	call   *%eax
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  103365:	ff 4d e8             	decl   -0x18(%ebp)
  103368:	89 f0                	mov    %esi,%eax
  10336a:	8d 70 01             	lea    0x1(%eax),%esi
  10336d:	0f b6 00             	movzbl (%eax),%eax
  103370:	0f be d8             	movsbl %al,%ebx
  103373:	85 db                	test   %ebx,%ebx
  103375:	74 27                	je     10339e <vprintfmt+0x25a>
  103377:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  10337b:	78 b4                	js     103331 <vprintfmt+0x1ed>
  10337d:	ff 4d e4             	decl   -0x1c(%ebp)
  103380:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  103384:	79 ab                	jns    103331 <vprintfmt+0x1ed>
                }
            }
            for (; width > 0; width --) {
  103386:	eb 16                	jmp    10339e <vprintfmt+0x25a>
                putch(' ', putdat);
  103388:	8b 45 0c             	mov    0xc(%ebp),%eax
  10338b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10338f:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  103396:	8b 45 08             	mov    0x8(%ebp),%eax
  103399:	ff d0                	call   *%eax
            for (; width > 0; width --) {
  10339b:	ff 4d e8             	decl   -0x18(%ebp)
  10339e:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  1033a2:	7f e4                	jg     103388 <vprintfmt+0x244>
            }
            break;
  1033a4:	e9 6c 01 00 00       	jmp    103515 <vprintfmt+0x3d1>

        // (signed) decimal
        case 'd':
            num = getint(&ap, lflag);
  1033a9:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1033ac:	89 44 24 04          	mov    %eax,0x4(%esp)
  1033b0:	8d 45 14             	lea    0x14(%ebp),%eax
  1033b3:	89 04 24             	mov    %eax,(%esp)
  1033b6:	e8 0b fd ff ff       	call   1030c6 <getint>
  1033bb:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1033be:	89 55 f4             	mov    %edx,-0xc(%ebp)
            if ((long long)num < 0) {
  1033c1:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1033c4:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1033c7:	85 d2                	test   %edx,%edx
  1033c9:	79 26                	jns    1033f1 <vprintfmt+0x2ad>
                putch('-', putdat);
  1033cb:	8b 45 0c             	mov    0xc(%ebp),%eax
  1033ce:	89 44 24 04          	mov    %eax,0x4(%esp)
  1033d2:	c7 04 24 2d 00 00 00 	movl   $0x2d,(%esp)
  1033d9:	8b 45 08             	mov    0x8(%ebp),%eax
  1033dc:	ff d0                	call   *%eax
                num = -(long long)num;
  1033de:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1033e1:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1033e4:	f7 d8                	neg    %eax
  1033e6:	83 d2 00             	adc    $0x0,%edx
  1033e9:	f7 da                	neg    %edx
  1033eb:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1033ee:	89 55 f4             	mov    %edx,-0xc(%ebp)
            }
            base = 10;
  1033f1:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  1033f8:	e9 a8 00 00 00       	jmp    1034a5 <vprintfmt+0x361>

        // unsigned decimal
        case 'u':
            num = getuint(&ap, lflag);
  1033fd:	8b 45 e0             	mov    -0x20(%ebp),%eax
  103400:	89 44 24 04          	mov    %eax,0x4(%esp)
  103404:	8d 45 14             	lea    0x14(%ebp),%eax
  103407:	89 04 24             	mov    %eax,(%esp)
  10340a:	e8 64 fc ff ff       	call   103073 <getuint>
  10340f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103412:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 10;
  103415:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  10341c:	e9 84 00 00 00       	jmp    1034a5 <vprintfmt+0x361>

        // (unsigned) octal
        case 'o':
            num = getuint(&ap, lflag);
  103421:	8b 45 e0             	mov    -0x20(%ebp),%eax
  103424:	89 44 24 04          	mov    %eax,0x4(%esp)
  103428:	8d 45 14             	lea    0x14(%ebp),%eax
  10342b:	89 04 24             	mov    %eax,(%esp)
  10342e:	e8 40 fc ff ff       	call   103073 <getuint>
  103433:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103436:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 8;
  103439:	c7 45 ec 08 00 00 00 	movl   $0x8,-0x14(%ebp)
            goto number;
  103440:	eb 63                	jmp    1034a5 <vprintfmt+0x361>

        // pointer
        case 'p':
            putch('0', putdat);
  103442:	8b 45 0c             	mov    0xc(%ebp),%eax
  103445:	89 44 24 04          	mov    %eax,0x4(%esp)
  103449:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
  103450:	8b 45 08             	mov    0x8(%ebp),%eax
  103453:	ff d0                	call   *%eax
            putch('x', putdat);
  103455:	8b 45 0c             	mov    0xc(%ebp),%eax
  103458:	89 44 24 04          	mov    %eax,0x4(%esp)
  10345c:	c7 04 24 78 00 00 00 	movl   $0x78,(%esp)
  103463:	8b 45 08             	mov    0x8(%ebp),%eax
  103466:	ff d0                	call   *%eax
            num = (unsigned long long)(uintptr_t)va_arg(ap, void *);
  103468:	8b 45 14             	mov    0x14(%ebp),%eax
  10346b:	8d 50 04             	lea    0x4(%eax),%edx
  10346e:	89 55 14             	mov    %edx,0x14(%ebp)
  103471:	8b 00                	mov    (%eax),%eax
  103473:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103476:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            base = 16;
  10347d:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
            goto number;
  103484:	eb 1f                	jmp    1034a5 <vprintfmt+0x361>

        // (unsigned) hexadecimal
        case 'x':
            num = getuint(&ap, lflag);
  103486:	8b 45 e0             	mov    -0x20(%ebp),%eax
  103489:	89 44 24 04          	mov    %eax,0x4(%esp)
  10348d:	8d 45 14             	lea    0x14(%ebp),%eax
  103490:	89 04 24             	mov    %eax,(%esp)
  103493:	e8 db fb ff ff       	call   103073 <getuint>
  103498:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10349b:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 16;
  10349e:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
        number:
            printnum(putch, putdat, num, base, width, padc);
  1034a5:	0f be 55 db          	movsbl -0x25(%ebp),%edx
  1034a9:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1034ac:	89 54 24 18          	mov    %edx,0x18(%esp)
  1034b0:	8b 55 e8             	mov    -0x18(%ebp),%edx
  1034b3:	89 54 24 14          	mov    %edx,0x14(%esp)
  1034b7:	89 44 24 10          	mov    %eax,0x10(%esp)
  1034bb:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1034be:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1034c1:	89 44 24 08          	mov    %eax,0x8(%esp)
  1034c5:	89 54 24 0c          	mov    %edx,0xc(%esp)
  1034c9:	8b 45 0c             	mov    0xc(%ebp),%eax
  1034cc:	89 44 24 04          	mov    %eax,0x4(%esp)
  1034d0:	8b 45 08             	mov    0x8(%ebp),%eax
  1034d3:	89 04 24             	mov    %eax,(%esp)
  1034d6:	e8 94 fa ff ff       	call   102f6f <printnum>
            break;
  1034db:	eb 38                	jmp    103515 <vprintfmt+0x3d1>

        // escaped '%' character
        case '%':
            putch(ch, putdat);
  1034dd:	8b 45 0c             	mov    0xc(%ebp),%eax
  1034e0:	89 44 24 04          	mov    %eax,0x4(%esp)
  1034e4:	89 1c 24             	mov    %ebx,(%esp)
  1034e7:	8b 45 08             	mov    0x8(%ebp),%eax
  1034ea:	ff d0                	call   *%eax
            break;
  1034ec:	eb 27                	jmp    103515 <vprintfmt+0x3d1>

        // unrecognized escape sequence - just print it literally
        default:
            putch('%', putdat);
  1034ee:	8b 45 0c             	mov    0xc(%ebp),%eax
  1034f1:	89 44 24 04          	mov    %eax,0x4(%esp)
  1034f5:	c7 04 24 25 00 00 00 	movl   $0x25,(%esp)
  1034fc:	8b 45 08             	mov    0x8(%ebp),%eax
  1034ff:	ff d0                	call   *%eax
            for (fmt --; fmt[-1] != '%'; fmt --)
  103501:	ff 4d 10             	decl   0x10(%ebp)
  103504:	eb 03                	jmp    103509 <vprintfmt+0x3c5>
  103506:	ff 4d 10             	decl   0x10(%ebp)
  103509:	8b 45 10             	mov    0x10(%ebp),%eax
  10350c:	48                   	dec    %eax
  10350d:	0f b6 00             	movzbl (%eax),%eax
  103510:	3c 25                	cmp    $0x25,%al
  103512:	75 f2                	jne    103506 <vprintfmt+0x3c2>
                /* do nothing */;
            break;
  103514:	90                   	nop
    while (1) {
  103515:	e9 36 fc ff ff       	jmp    103150 <vprintfmt+0xc>
                return;
  10351a:	90                   	nop
        }
    }
}
  10351b:	83 c4 40             	add    $0x40,%esp
  10351e:	5b                   	pop    %ebx
  10351f:	5e                   	pop    %esi
  103520:	5d                   	pop    %ebp
  103521:	c3                   	ret    

00103522 <sprintputch>:
 * sprintputch - 'print' a single character in a buffer
 * @ch:            the character will be printed
 * @b:            the buffer to place the character @ch
 * */
static void
sprintputch(int ch, struct sprintbuf *b) {
  103522:	f3 0f 1e fb          	endbr32 
  103526:	55                   	push   %ebp
  103527:	89 e5                	mov    %esp,%ebp
    b->cnt ++;
  103529:	8b 45 0c             	mov    0xc(%ebp),%eax
  10352c:	8b 40 08             	mov    0x8(%eax),%eax
  10352f:	8d 50 01             	lea    0x1(%eax),%edx
  103532:	8b 45 0c             	mov    0xc(%ebp),%eax
  103535:	89 50 08             	mov    %edx,0x8(%eax)
    if (b->buf < b->ebuf) {
  103538:	8b 45 0c             	mov    0xc(%ebp),%eax
  10353b:	8b 10                	mov    (%eax),%edx
  10353d:	8b 45 0c             	mov    0xc(%ebp),%eax
  103540:	8b 40 04             	mov    0x4(%eax),%eax
  103543:	39 c2                	cmp    %eax,%edx
  103545:	73 12                	jae    103559 <sprintputch+0x37>
        *b->buf ++ = ch;
  103547:	8b 45 0c             	mov    0xc(%ebp),%eax
  10354a:	8b 00                	mov    (%eax),%eax
  10354c:	8d 48 01             	lea    0x1(%eax),%ecx
  10354f:	8b 55 0c             	mov    0xc(%ebp),%edx
  103552:	89 0a                	mov    %ecx,(%edx)
  103554:	8b 55 08             	mov    0x8(%ebp),%edx
  103557:	88 10                	mov    %dl,(%eax)
    }
}
  103559:	90                   	nop
  10355a:	5d                   	pop    %ebp
  10355b:	c3                   	ret    

0010355c <snprintf>:
 * @str:        the buffer to place the result into
 * @size:        the size of buffer, including the trailing null space
 * @fmt:        the format string to use
 * */
int
snprintf(char *str, size_t size, const char *fmt, ...) {
  10355c:	f3 0f 1e fb          	endbr32 
  103560:	55                   	push   %ebp
  103561:	89 e5                	mov    %esp,%ebp
  103563:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  103566:	8d 45 14             	lea    0x14(%ebp),%eax
  103569:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vsnprintf(str, size, fmt, ap);
  10356c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10356f:	89 44 24 0c          	mov    %eax,0xc(%esp)
  103573:	8b 45 10             	mov    0x10(%ebp),%eax
  103576:	89 44 24 08          	mov    %eax,0x8(%esp)
  10357a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10357d:	89 44 24 04          	mov    %eax,0x4(%esp)
  103581:	8b 45 08             	mov    0x8(%ebp),%eax
  103584:	89 04 24             	mov    %eax,(%esp)
  103587:	e8 08 00 00 00       	call   103594 <vsnprintf>
  10358c:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  10358f:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  103592:	c9                   	leave  
  103593:	c3                   	ret    

00103594 <vsnprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want snprintf() instead.
 * */
int
vsnprintf(char *str, size_t size, const char *fmt, va_list ap) {
  103594:	f3 0f 1e fb          	endbr32 
  103598:	55                   	push   %ebp
  103599:	89 e5                	mov    %esp,%ebp
  10359b:	83 ec 28             	sub    $0x28,%esp
    struct sprintbuf b = {str, str + size - 1, 0};
  10359e:	8b 45 08             	mov    0x8(%ebp),%eax
  1035a1:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1035a4:	8b 45 0c             	mov    0xc(%ebp),%eax
  1035a7:	8d 50 ff             	lea    -0x1(%eax),%edx
  1035aa:	8b 45 08             	mov    0x8(%ebp),%eax
  1035ad:	01 d0                	add    %edx,%eax
  1035af:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1035b2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    if (str == NULL || b.buf > b.ebuf) {
  1035b9:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  1035bd:	74 0a                	je     1035c9 <vsnprintf+0x35>
  1035bf:	8b 55 ec             	mov    -0x14(%ebp),%edx
  1035c2:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1035c5:	39 c2                	cmp    %eax,%edx
  1035c7:	76 07                	jbe    1035d0 <vsnprintf+0x3c>
        return -E_INVAL;
  1035c9:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  1035ce:	eb 2a                	jmp    1035fa <vsnprintf+0x66>
    }
    // print the string to the buffer
    vprintfmt((void*)sprintputch, &b, fmt, ap);
  1035d0:	8b 45 14             	mov    0x14(%ebp),%eax
  1035d3:	89 44 24 0c          	mov    %eax,0xc(%esp)
  1035d7:	8b 45 10             	mov    0x10(%ebp),%eax
  1035da:	89 44 24 08          	mov    %eax,0x8(%esp)
  1035de:	8d 45 ec             	lea    -0x14(%ebp),%eax
  1035e1:	89 44 24 04          	mov    %eax,0x4(%esp)
  1035e5:	c7 04 24 22 35 10 00 	movl   $0x103522,(%esp)
  1035ec:	e8 53 fb ff ff       	call   103144 <vprintfmt>
    // null terminate the buffer
    *b.buf = '\0';
  1035f1:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1035f4:	c6 00 00             	movb   $0x0,(%eax)
    return b.cnt;
  1035f7:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1035fa:	c9                   	leave  
  1035fb:	c3                   	ret    
