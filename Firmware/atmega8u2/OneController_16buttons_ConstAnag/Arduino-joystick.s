	.file	"Arduino-joystick.c"
__SREG__ = 0x3f
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__tmp_reg__ = 0
__zero_reg__ = 1
	.global __do_copy_data
	.global __do_clear_bss
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.text
.Ltext0:
	.section	.text.SetupHardware,"ax",@progbits
.global	SetupHardware
	.type	SetupHardware, @function
SetupHardware:
.LFB85:
.LSM0:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
.LSM1:
	in r24,84-0x20
	andi r24,lo8(-9)
	out 84-0x20,r24
.LSM2:
	ldi r18,lo8(24)
/* #APP */
 ;  116 "Arduino-joystick.c" 1
	in __tmp_reg__, __SREG__
	cli
	sts 96, r18
	sts 96, __zero_reg__
	out __SREG__,__tmp_reg__
	
 ;  0 "" 2
.LVL0:
/* #NOAPP */
.LBB99:
.LBB100:
.LSM3:
	ldi r24,lo8(16)
	ldi r25,hi8(16)
	sts 204+1,r25
	sts 204,r24
.LSM4:
	ldi r24,lo8(6)
	sts 202,r24
.LSM5:
	ldi r24,lo8(2)
	sts 200,r24
.LSM6:
	ldi r28,lo8(201)
	ldi r29,hi8(201)
	st Y,r18
.LSM7:
	sbi 42-0x20,3
.LSM8:
	sbi 43-0x20,2
.LBE100:
.LBE99:
.LBB101:
.LBB102:
.LSM9:
	in r24,42-0x20
	ori r24,lo8(48)
	out 42-0x20,r24
.LSM10:
	in r24,43-0x20
	ori r24,lo8(48)
	out 43-0x20,r24
.LBE102:
.LBE101:
.LSM11:
	call USB_Init
.LSM12:
	ldi r24,lo8(-104)
	st Y,r24
/* epilogue start */
.LSM13:
	pop r29
	pop r28
	ret
.LFE85:
	.size	SetupHardware, .-SetupHardware
	.section	.text.main,"ax",@progbits
.global	main
	.type	main, @function
main:
.LFB84:
.LSM14:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LSM15:
	call SetupHardware
.LVL1:
.LBB103:
.LBB104:
.LSM16:
	in r18,__SREG__
.LVL2:
.LBB105:
.LBB106:
.LSM17:
/* #APP */
 ;  50 "/usr/local/lib/gcc/avr/4.5.3/../../../../avr/include/util/atomic.h" 1
	cli
 ;  0 "" 2
.LVL3:
/* #NOAPP */
.LBE106:
.LBE105:
.LSM18:
	ldi r24,lo8(USARTtoUSB_Buffer)
	ldi r25,hi8(USARTtoUSB_Buffer)
	sts USARTtoUSB_Buffer+128+1,r25
	sts USARTtoUSB_Buffer+128,r24
.LSM19:
	sts USARTtoUSB_Buffer+130+1,r25
	sts USARTtoUSB_Buffer+130,r24
.LVL4:
.LBB107:
.LBB108:
.LSM20:
	out __SREG__,r18
.LSM21:
.LBE108:
.LBE107:
.LBE104:
.LBE103:
.LSM22:
/* #APP */
 ;  103 "Arduino-joystick.c" 1
	sei
 ;  0 "" 2
.LVL5:
/* #NOAPP */
.L3:
.LSM23:
	ldi r24,lo8(Joystick_HID_Interface)
	ldi r25,hi8(Joystick_HID_Interface)
	call HID_Device_USBTask
.LSM24:
	call USB_USBTask
	rjmp .L3
.LFE84:
	.size	main, .-main
	.section	.text.EVENT_USB_Device_Connect,"ax",@progbits
.global	EVENT_USB_Device_Connect
	.type	EVENT_USB_Device_Connect, @function
EVENT_USB_Device_Connect:
.LFB86:
.LSM25:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
/* epilogue start */
.LSM26:
	ret
.LFE86:
	.size	EVENT_USB_Device_Connect, .-EVENT_USB_Device_Connect
	.section	.text.EVENT_USB_Device_Disconnect,"ax",@progbits
.global	EVENT_USB_Device_Disconnect
	.type	EVENT_USB_Device_Disconnect, @function
EVENT_USB_Device_Disconnect:
.LFB87:
.LSM27:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
/* epilogue start */
.LSM28:
	ret
.LFE87:
	.size	EVENT_USB_Device_Disconnect, .-EVENT_USB_Device_Disconnect
	.section	.text.EVENT_USB_Device_ConfigurationChanged,"ax",@progbits
.global	EVENT_USB_Device_ConfigurationChanged
	.type	EVENT_USB_Device_ConfigurationChanged, @function
EVENT_USB_Device_ConfigurationChanged:
.LFB88:
.LSM29:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LSM30:
	ldi r24,lo8(Joystick_HID_Interface)
	ldi r25,hi8(Joystick_HID_Interface)
	call HID_Device_ConfigureEndpoints
.LBB109:
.LBB110:
.LSM31:
	ldi r30,lo8(226)
	ldi r31,hi8(226)
	ld r24,Z
	ori r24,lo8(4)
	st Z,r24
/* epilogue start */
.LBE110:
.LBE109:
.LSM32:
	ret
.LFE88:
	.size	EVENT_USB_Device_ConfigurationChanged, .-EVENT_USB_Device_ConfigurationChanged
	.section	.text.EVENT_USB_Device_UnhandledControlRequest,"ax",@progbits
.global	EVENT_USB_Device_UnhandledControlRequest
	.type	EVENT_USB_Device_UnhandledControlRequest, @function
EVENT_USB_Device_UnhandledControlRequest:
.LFB89:
.LSM33:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LSM34:
	ldi r24,lo8(Joystick_HID_Interface)
	ldi r25,hi8(Joystick_HID_Interface)
	call HID_Device_ProcessControlRequest
/* epilogue start */
.LSM35:
	ret
.LFE89:
	.size	EVENT_USB_Device_UnhandledControlRequest, .-EVENT_USB_Device_UnhandledControlRequest
	.section	.text.EVENT_USB_Device_StartOfFrame,"ax",@progbits
.global	EVENT_USB_Device_StartOfFrame
	.type	EVENT_USB_Device_StartOfFrame, @function
EVENT_USB_Device_StartOfFrame:
.LFB90:
.LSM36:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LVL6:
.LBB111:
.LBB112:
.LSM37:
	lds r24,Joystick_HID_Interface+11
	lds r25,Joystick_HID_Interface+11+1
	sbiw r24,0
	breq .L8
.LSM38:
	sbiw r24,1
	sts Joystick_HID_Interface+11+1,r25
	sts Joystick_HID_Interface+11,r24
.L8:
	ret
.LBE112:
.LBE111:
.LFE90:
	.size	EVENT_USB_Device_StartOfFrame, .-EVENT_USB_Device_StartOfFrame
	.section	.text.CALLBACK_HID_Device_CreateHIDReport,"ax",@progbits
.global	CALLBACK_HID_Device_CreateHIDReport
	.type	CALLBACK_HID_Device_CreateHIDReport, @function
CALLBACK_HID_Device_CreateHIDReport:
.LFB91:
.LSM39:
.LVL7:
	push r16
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 4 */
.L__stack_usage = 4
	movw r28,r16
.LBB113:
.LBB114:
.LBB115:
.LSM40:
	in r25,__SREG__
.LVL8:
.LBB116:
.LBB117:
.LSM41:
/* #APP */
 ;  50 "/usr/local/lib/gcc/avr/4.5.3/../../../../avr/include/util/atomic.h" 1
	cli
 ;  0 "" 2
.LVL9:
/* #NOAPP */
.LBE117:
.LBE116:
.LSM42:
	lds r24,USARTtoUSB_Buffer+132
.LVL10:
.LBB118:
.LBB119:
.LSM43:
	out __SREG__,r25
.LSM44:
.LBE119:
.LBE118:
.LBE115:
.LBE114:
.LBE113:
.LSM45:
	cpi r24,lo8(8)
	brlo .L11
	ldi r26,lo8(joyReport)
	ldi r27,hi8(joyReport)
.LBB120:
.LBB121:
.LBB122:
.LSM46:
	ldi r24,lo8(USARTtoUSB_Buffer)
	ldi r25,hi8(USARTtoUSB_Buffer)
.LVL11:
.L13:
.LSM47:
	lds r30,USARTtoUSB_Buffer+130
	lds r31,USARTtoUSB_Buffer+130+1
	ld r21,Z+
.LVL12:
.LSM48:
	sts USARTtoUSB_Buffer+130+1,r31
	sts USARTtoUSB_Buffer+130,r30
	ldi r20,hi8(USARTtoUSB_Buffer+128)
	cpi r30,lo8(USARTtoUSB_Buffer+128)
	cpc r31,r20
	brne .L12
.LSM49:
	sts USARTtoUSB_Buffer+130+1,r25
	sts USARTtoUSB_Buffer+130,r24
.L12:
.LBB123:
.LSM50:
	in r22,__SREG__
.LVL13:
.LBB124:
.LBB125:
.LSM51:
/* #APP */
 ;  50 "/usr/local/lib/gcc/avr/4.5.3/../../../../avr/include/util/atomic.h" 1
	cli
 ;  0 "" 2
.LVL14:
/* #NOAPP */
.LBE125:
.LBE124:
.LSM52:
	lds r20,USARTtoUSB_Buffer+132
	subi r20,lo8(-(-1))
	sts USARTtoUSB_Buffer+132,r20
.LVL15:
.LBB126:
.LBB127:
.LSM53:
	out __SREG__,r22
.LSM54:
.LBE127:
.LBE126:
.LBE123:
.LBE122:
.LBE121:
.LSM55:
	st X+,r21
.LSM56:
	ldi r20,hi8(joyReport+8)
	cpi r26,lo8(joyReport+8)
	cpc r27,r20
	brne .L13
.LVL16:
.L11:
.LBE120:
.LSM57:
	mov r24,r18
	mov r25,r19
.LVL17:
	movw r26,r24
	ldi r30,lo8(joyReport)
	ldi r31,hi8(joyReport)
	ldi r24,lo8(8)
.L14:
	ld r0,Z+
	st X+,r0
	subi r24,lo8(-(-1))
	brne .L14
.LSM58:
	ldi r24,lo8(8)
	ldi r25,hi8(8)
	std Y+1,r25
	st Y,r24
.LSM59:
	ldi r24,lo8(0)
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
.LVL18:
	ret
.LFE91:
	.size	CALLBACK_HID_Device_CreateHIDReport, .-CALLBACK_HID_Device_CreateHIDReport
	.section	.text.CALLBACK_HID_Device_ProcessHIDReport,"ax",@progbits
.global	CALLBACK_HID_Device_ProcessHIDReport
	.type	CALLBACK_HID_Device_ProcessHIDReport, @function
CALLBACK_HID_Device_ProcessHIDReport:
.LFB92:
.LSM60:
.LVL19:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
/* epilogue start */
.LSM61:
	ret
.LFE92:
	.size	CALLBACK_HID_Device_ProcessHIDReport, .-CALLBACK_HID_Device_ProcessHIDReport
	.section	.text.__vector_23,"ax",@progbits
.global	__vector_23
	.type	__vector_23, @function
__vector_23:
.LFB93:
.LSM62:
	push __zero_reg__
	push r0
	in r0,__SREG__
	push r0
	clr __zero_reg__
	push r18
	push r24
	push r25
	push r30
	push r31
/* prologue: Signal */
/* frame size = 0 */
/* stack size = 8 */
.L__stack_usage = 8
.LSM63:
	lds r24,206
.LVL20:
.LSM64:
	in r25,62-0x20
	cpi r25,lo8(4)
	brne .L18
.LBB128:
.LBB129:
.LBB130:
.LBB131:
.LSM65:
	in r18,__SREG__
.LVL21:
.LBB132:
.LBB133:
.LSM66:
/* #APP */
 ;  50 "/usr/local/lib/gcc/avr/4.5.3/../../../../avr/include/util/atomic.h" 1
	cli
 ;  0 "" 2
.LVL22:
/* #NOAPP */
.LBE133:
.LBE132:
.LSM67:
	lds r25,USARTtoUSB_Buffer+132
.LVL23:
.LBB134:
.LBB135:
.LSM68:
	out __SREG__,r18
.LSM69:
.LBE135:
.LBE134:
.LBE131:
.LBE130:
.LBE129:
.LBE128:
.LSM70:
	cpi r25,lo8(-128)
	breq .L18
.LVL24:
.LBB136:
.LBB137:
.LSM71:
	lds r30,USARTtoUSB_Buffer+128
	lds r31,USARTtoUSB_Buffer+128+1
	st Z,r24
.LSM72:
	lds r30,USARTtoUSB_Buffer+128
	lds r31,USARTtoUSB_Buffer+128+1
	movw r24,r30
.LVL25:
	adiw r24,1
	sts USARTtoUSB_Buffer+128+1,r25
	sts USARTtoUSB_Buffer+128,r24
	ldi r18,hi8(USARTtoUSB_Buffer+128)
	cpi r24,lo8(USARTtoUSB_Buffer+128)
	cpc r25,r18
.LVL26:
	brne .L20
.LSM73:
	ldi r24,lo8(USARTtoUSB_Buffer)
	ldi r25,hi8(USARTtoUSB_Buffer)
	std Z+2,r25
	std Z+1,r24
.L20:
.LBB138:
.LSM74:
	in r25,__SREG__
.LVL27:
.LBB139:
.LBB140:
.LSM75:
/* #APP */
 ;  50 "/usr/local/lib/gcc/avr/4.5.3/../../../../avr/include/util/atomic.h" 1
	cli
 ;  0 "" 2
.LVL28:
/* #NOAPP */
.LBE140:
.LBE139:
.LSM76:
	lds r24,USARTtoUSB_Buffer+132
	subi r24,lo8(-(1))
	sts USARTtoUSB_Buffer+132,r24
.LVL29:
.LBB141:
.LBB142:
.LSM77:
	out __SREG__,r25
.LSM78:
.LVL30:
.L18:
/* epilogue start */
.LBE142:
.LBE141:
.LBE138:
.LBE137:
.LBE136:
.LSM79:
	pop r31
	pop r30
	pop r25
	pop r24
	pop r18
	pop r0
	out __SREG__,r0
	pop r0
	pop __zero_reg__
	reti
.LFE93:
	.size	__vector_23, .-__vector_23
.global	Joystick_HID_Interface
	.data
	.type	Joystick_HID_Interface, @object
	.size	Joystick_HID_Interface, 13
Joystick_HID_Interface:
	.byte	0
	.byte	1
	.word	8
	.byte	0
	.word	PrevJoystickHIDReportBuffer
	.byte	8
	.skip 5,0
.global	joyReport
.global	joyReport
	.section .bss
	.type	joyReport, @object
	.size	joyReport, 8
joyReport:
	.skip 8,0
	.comm PrevJoystickHIDReportBuffer,8,1
	.comm USARTtoUSB_Buffer,133,1
	.section	.debug_frame,"",@progbits
.Lframe0:
	.long	.LECIE0-.LSCIE0
.LSCIE0:
	.long	0xffffffff
	.byte	0x1
	.string	""
	.uleb128 0x1
	.sleb128 -1
	.byte	0x24
	.byte	0xc
	.uleb128 0x20
	.uleb128 0x0
	.p2align	2
.LECIE0:
.LSFDE0:
	.long	.LEFDE0-.LASFDE0
.LASFDE0:
	.long	.Lframe0
	.long	.LFB85
	.long	.LFE85-.LFB85
	.p2align	2
.LEFDE0:
.LSFDE2:
	.long	.LEFDE2-.LASFDE2
.LASFDE2:
	.long	.Lframe0
	.long	.LFB84
	.long	.LFE84-.LFB84
	.p2align	2
.LEFDE2:
.LSFDE4:
	.long	.LEFDE4-.LASFDE4
.LASFDE4:
	.long	.Lframe0
	.long	.LFB86
	.long	.LFE86-.LFB86
	.p2align	2
.LEFDE4:
.LSFDE6:
	.long	.LEFDE6-.LASFDE6
.LASFDE6:
	.long	.Lframe0
	.long	.LFB87
	.long	.LFE87-.LFB87
	.p2align	2
.LEFDE6:
.LSFDE8:
	.long	.LEFDE8-.LASFDE8
.LASFDE8:
	.long	.Lframe0
	.long	.LFB88
	.long	.LFE88-.LFB88
	.p2align	2
.LEFDE8:
.LSFDE10:
	.long	.LEFDE10-.LASFDE10
.LASFDE10:
	.long	.Lframe0
	.long	.LFB89
	.long	.LFE89-.LFB89
	.p2align	2
.LEFDE10:
.LSFDE12:
	.long	.LEFDE12-.LASFDE12
.LASFDE12:
	.long	.Lframe0
	.long	.LFB90
	.long	.LFE90-.LFB90
	.p2align	2
.LEFDE12:
.LSFDE14:
	.long	.LEFDE14-.LASFDE14
.LASFDE14:
	.long	.Lframe0
	.long	.LFB91
	.long	.LFE91-.LFB91
	.p2align	2
.LEFDE14:
.LSFDE16:
	.long	.LEFDE16-.LASFDE16
.LASFDE16:
	.long	.Lframe0
	.long	.LFB92
	.long	.LFE92-.LFB92
	.p2align	2
.LEFDE16:
.LSFDE18:
	.long	.LEFDE18-.LASFDE18
.LASFDE18:
	.long	.Lframe0
	.long	.LFB93
	.long	.LFE93-.LFB93
	.p2align	2
.LEFDE18:
	.text
.Letext0:
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.long	.LVL2
	.long	.LVL5
	.word	0x1
	.byte	0x62
	.long	0x0
	.long	0x0
.LLST1:
	.long	.LVL3
	.long	.LVL4
	.word	0x2
	.byte	0x31
	.byte	0x9f
	.long	.LVL4
	.long	.LFE84
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	0x0
	.long	0x0
.LLST2:
	.long	.LVL7
	.long	.LVL10
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST3:
	.long	.LVL7
	.long	.LVL11
	.word	0x6
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST4:
	.long	.LVL7
	.long	.LVL11
	.word	0x1
	.byte	0x64
	.long	0x0
	.long	0x0
.LLST5:
	.long	.LVL7
	.long	.LVL18
	.word	0x6
	.byte	0x60
	.byte	0x93
	.uleb128 0x1
	.byte	0x61
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST6:
	.long	.LVL9
	.long	.LVL10
	.word	0x2
	.byte	0x31
	.byte	0x9f
	.long	.LVL10
	.long	.LFE91
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	0x0
	.long	0x0
.LLST7:
	.long	.LVL8
	.long	.LVL17
	.word	0x1
	.byte	0x69
	.long	.LVL17
	.long	.LFE91
	.word	0x2
	.byte	0x8
	.byte	0x5f
	.long	0x0
	.long	0x0
.LLST8:
	.long	.LVL12
	.long	.LVL16
	.word	0x7
	.byte	0x3
	.long	USARTtoUSB_Buffer+130
	.byte	0x94
	.byte	0x2
	.long	0x0
	.long	0x0
.LLST9:
	.long	.LVL14
	.long	.LVL15
	.word	0x2
	.byte	0x31
	.byte	0x9f
	.long	.LVL15
	.long	.LVL16
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	0x0
	.long	0x0
.LLST10:
	.long	.LVL13
	.long	.LVL16
	.word	0x1
	.byte	0x66
	.long	0x0
	.long	0x0
.LLST11:
	.long	.LVL20
	.long	.LVL25
	.word	0x1
	.byte	0x68
	.long	.LVL25
	.long	.LVL30
	.word	0x7
	.byte	0x3
	.long	USARTtoUSB_Buffer+128
	.byte	0x94
	.byte	0x2
	.long	0x0
	.long	0x0
.LLST12:
	.long	.LVL22
	.long	.LVL23
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	.LVL23
	.long	.LVL30
	.word	0x5
	.byte	0x3
	.long	USARTtoUSB_Buffer+132
	.long	0x0
	.long	0x0
.LLST13:
	.long	.LVL22
	.long	.LVL23
	.word	0x2
	.byte	0x31
	.byte	0x9f
	.long	.LVL23
	.long	.LVL30
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	0x0
	.long	0x0
.LLST14:
	.long	.LVL21
	.long	.LVL26
	.word	0x1
	.byte	0x62
	.long	.LVL26
	.long	.LVL30
	.word	0x2
	.byte	0x8
	.byte	0x5f
	.long	0x0
	.long	0x0
.LLST15:
	.long	.LVL24
	.long	.LVL25
	.word	0x1
	.byte	0x68
	.long	.LVL25
	.long	.LVL30
	.word	0x7
	.byte	0x3
	.long	USARTtoUSB_Buffer+128
	.byte	0x94
	.byte	0x2
	.long	0x0
	.long	0x0
.LLST16:
	.long	.LVL27
	.long	.LVL30
	.word	0x1
	.byte	0x69
	.long	0x0
	.long	0x0
.LLST17:
	.long	.LVL28
	.long	.LVL29
	.word	0x2
	.byte	0x31
	.byte	0x9f
	.long	.LVL29
	.long	.LVL30
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	0x0
	.long	0x0
	.section	.debug_info
	.long	0x8e9
	.word	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF79
	.byte	0x1
	.long	.LASF80
	.long	.LASF81
	.long	0x0
	.long	0x0
	.long	.Ldebug_ranges0+0x0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF0
	.uleb128 0x3
	.long	.LASF2
	.byte	0x8
	.byte	0x7a
	.long	0x3b
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF1
	.uleb128 0x4
	.byte	0x2
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.long	.LASF3
	.byte	0x8
	.byte	0x7c
	.long	0x54
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF4
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.long	.LASF5
	.uleb128 0x3
	.long	.LASF6
	.byte	0x8
	.byte	0x7e
	.long	0x6d
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF7
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF8
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF9
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF10
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF10
	.uleb128 0x5
	.long	.LASF82
	.byte	0x1
	.byte	0x6
	.byte	0x72
	.long	0xc1
	.uleb128 0x6
	.long	.LASF11
	.sleb128 0
	.uleb128 0x6
	.long	.LASF12
	.sleb128 1
	.uleb128 0x6
	.long	.LASF13
	.sleb128 2
	.uleb128 0x6
	.long	.LASF14
	.sleb128 3
	.uleb128 0x6
	.long	.LASF15
	.sleb128 4
	.uleb128 0x6
	.long	.LASF16
	.sleb128 5
	.byte	0x0
	.uleb128 0x7
	.byte	0x2
	.uleb128 0x8
	.byte	0x8
	.byte	0x7
	.byte	0x56
	.long	0x120
	.uleb128 0x9
	.long	.LASF17
	.byte	0x7
	.byte	0x58
	.long	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x9
	.long	.LASF18
	.byte	0x7
	.byte	0x5a
	.long	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0x9
	.long	.LASF19
	.byte	0x7
	.byte	0x5b
	.long	0x49
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x9
	.long	.LASF20
	.byte	0x7
	.byte	0x5c
	.long	0x120
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x9
	.long	.LASF21
	.byte	0x7
	.byte	0x5e
	.long	0xc1
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0x9
	.long	.LASF22
	.byte	0x7
	.byte	0x6a
	.long	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.byte	0x0
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.long	.LASF23
	.uleb128 0x8
	.byte	0x5
	.byte	0x7
	.byte	0x73
	.long	0x15a
	.uleb128 0x9
	.long	.LASF24
	.byte	0x7
	.byte	0x75
	.long	0x120
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x9
	.long	.LASF25
	.byte	0x7
	.byte	0x76
	.long	0x49
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0x9
	.long	.LASF26
	.byte	0x7
	.byte	0x77
	.long	0x49
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0x8
	.byte	0xd
	.byte	0x7
	.byte	0x54
	.long	0x17f
	.uleb128 0x9
	.long	.LASF27
	.byte	0x7
	.byte	0x70
	.long	0x17f
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x9
	.long	.LASF28
	.byte	0x7
	.byte	0x79
	.long	0x127
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0x0
	.uleb128 0xa
	.long	0xc3
	.uleb128 0x3
	.long	.LASF29
	.byte	0x7
	.byte	0x7c
	.long	0x15a
	.uleb128 0x8
	.byte	0x85
	.byte	0x4
	.byte	0x46
	.long	0x1d2
	.uleb128 0x9
	.long	.LASF30
	.byte	0x4
	.byte	0x48
	.long	0x1d2
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xb
	.string	"In"
	.byte	0x4
	.byte	0x49
	.long	0x1e2
	.byte	0x3
	.byte	0x23
	.uleb128 0x80
	.uleb128 0xb
	.string	"Out"
	.byte	0x4
	.byte	0x4a
	.long	0x1e2
	.byte	0x3
	.byte	0x23
	.uleb128 0x82
	.uleb128 0x9
	.long	.LASF31
	.byte	0x4
	.byte	0x4b
	.long	0x30
	.byte	0x3
	.byte	0x23
	.uleb128 0x84
	.byte	0x0
	.uleb128 0xc
	.long	0x30
	.long	0x1e2
	.uleb128 0xd
	.long	0x54
	.byte	0x7f
	.byte	0x0
	.uleb128 0xe
	.byte	0x2
	.long	0x30
	.uleb128 0x3
	.long	.LASF32
	.byte	0x4
	.byte	0x4c
	.long	0x18f
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF33
	.uleb128 0x8
	.byte	0x8
	.byte	0x9
	.byte	0x3a
	.long	0x273
	.uleb128 0x9
	.long	.LASF34
	.byte	0x9
	.byte	0x3b
	.long	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x9
	.long	.LASF35
	.byte	0x9
	.byte	0x3c
	.long	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0x9
	.long	.LASF36
	.byte	0x9
	.byte	0x3d
	.long	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x9
	.long	.LASF37
	.byte	0x9
	.byte	0x3e
	.long	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.uleb128 0x9
	.long	.LASF38
	.byte	0x9
	.byte	0x3f
	.long	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x9
	.long	.LASF39
	.byte	0x9
	.byte	0x40
	.long	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0x9
	.long	.LASF40
	.byte	0x9
	.byte	0x41
	.long	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x9
	.long	.LASF41
	.byte	0x9
	.byte	0x42
	.long	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.byte	0x0
	.uleb128 0x3
	.long	.LASF42
	.byte	0x9
	.byte	0x43
	.long	0x1fa
	.uleb128 0xf
	.long	.LASF47
	.byte	0x5
	.byte	0x44
	.byte	0x1
	.byte	0x3
	.long	0x297
	.uleb128 0x10
	.string	"__s"
	.byte	0x5
	.byte	0x44
	.long	0x297
	.byte	0x0
	.uleb128 0xe
	.byte	0x2
	.long	0x29d
	.uleb128 0xa
	.long	0x30
	.uleb128 0x11
	.long	.LASF83
	.byte	0x5
	.byte	0x30
	.byte	0x1
	.long	0x30
	.byte	0x3
	.uleb128 0x12
	.long	.LASF45
	.byte	0x4
	.byte	0x6b
	.byte	0x1
	.long	0x30
	.byte	0x3
	.long	0x2ef
	.uleb128 0x13
	.long	.LASF30
	.byte	0x4
	.byte	0x6b
	.long	0x2ef
	.uleb128 0x14
	.long	.LASF31
	.byte	0x4
	.byte	0x6d
	.long	0x30
	.uleb128 0x15
	.uleb128 0x14
	.long	.LASF43
	.byte	0x4
	.byte	0x6f
	.long	0x30
	.uleb128 0x14
	.long	.LASF44
	.byte	0x4
	.byte	0x6f
	.long	0x30
	.byte	0x0
	.byte	0x0
	.uleb128 0xa
	.long	0x2f4
	.uleb128 0xe
	.byte	0x2
	.long	0x1e8
	.uleb128 0x12
	.long	.LASF46
	.byte	0x4
	.byte	0x7f
	.byte	0x1
	.long	0x120
	.byte	0x3
	.long	0x317
	.uleb128 0x13
	.long	.LASF30
	.byte	0x4
	.byte	0x7f
	.long	0x2ef
	.byte	0x0
	.uleb128 0xf
	.long	.LASF48
	.byte	0x2
	.byte	0x63
	.byte	0x1
	.byte	0x3
	.long	0x33b
	.uleb128 0x13
	.long	.LASF49
	.byte	0x2
	.byte	0x63
	.long	0x33b
	.uleb128 0x13
	.long	.LASF50
	.byte	0x2
	.byte	0x64
	.long	0x340
	.byte	0x0
	.uleb128 0xa
	.long	0x62
	.uleb128 0xa
	.long	0x120
	.uleb128 0x16
	.long	.LASF52
	.byte	0x3
	.byte	0x43
	.byte	0x1
	.byte	0x3
	.uleb128 0xf
	.long	.LASF51
	.byte	0x4
	.byte	0x55
	.byte	0x1
	.byte	0x3
	.long	0x37f
	.uleb128 0x13
	.long	.LASF30
	.byte	0x4
	.byte	0x55
	.long	0x2ef
	.uleb128 0x15
	.uleb128 0x14
	.long	.LASF43
	.byte	0x4
	.byte	0x57
	.long	0x30
	.uleb128 0x14
	.long	.LASF44
	.byte	0x4
	.byte	0x57
	.long	0x30
	.byte	0x0
	.byte	0x0
	.uleb128 0x16
	.long	.LASF53
	.byte	0x6
	.byte	0x94
	.byte	0x1
	.byte	0x3
	.uleb128 0xf
	.long	.LASF54
	.byte	0x7
	.byte	0xc7
	.byte	0x1
	.byte	0x3
	.long	0x3a1
	.uleb128 0x13
	.long	.LASF55
	.byte	0x7
	.byte	0xc7
	.long	0x3a1
	.byte	0x0
	.uleb128 0xa
	.long	0x3a6
	.uleb128 0xe
	.byte	0x2
	.long	0x184
	.uleb128 0x12
	.long	.LASF56
	.byte	0x4
	.byte	0xb6
	.byte	0x1
	.long	0x30
	.byte	0x3
	.long	0x3ec
	.uleb128 0x13
	.long	.LASF30
	.byte	0x4
	.byte	0xb6
	.long	0x2ef
	.uleb128 0x14
	.long	.LASF57
	.byte	0x4
	.byte	0xb8
	.long	0x30
	.uleb128 0x15
	.uleb128 0x14
	.long	.LASF43
	.byte	0x4
	.byte	0xbd
	.long	0x30
	.uleb128 0x14
	.long	.LASF44
	.byte	0x4
	.byte	0xbd
	.long	0x30
	.byte	0x0
	.byte	0x0
	.uleb128 0xf
	.long	.LASF58
	.byte	0x4
	.byte	0x9e
	.byte	0x1
	.byte	0x3
	.long	0x428
	.uleb128 0x13
	.long	.LASF30
	.byte	0x4
	.byte	0x9e
	.long	0x2ef
	.uleb128 0x13
	.long	.LASF57
	.byte	0x4
	.byte	0x9f
	.long	0x29d
	.uleb128 0x15
	.uleb128 0x14
	.long	.LASF43
	.byte	0x4
	.byte	0xa6
	.long	0x30
	.uleb128 0x14
	.long	.LASF44
	.byte	0x4
	.byte	0xa6
	.long	0x30
	.byte	0x0
	.byte	0x0
	.uleb128 0x17
	.byte	0x1
	.long	.LASF61
	.byte	0x1
	.byte	0x70
	.byte	0x1
	.long	.LFB85
	.long	.LFE85
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 0
	.long	0x474
	.uleb128 0x18
	.long	0x317
	.long	.LBB99
	.long	.LBE99
	.byte	0x1
	.byte	0x77
	.long	0x464
	.uleb128 0x19
	.long	0x32f
	.byte	0x1
	.uleb128 0x1a
	.long	0x324
	.long	0x1c200
	.byte	0x0
	.uleb128 0x1b
	.long	0x345
	.long	.LBB101
	.long	.LBE101
	.byte	0x1
	.byte	0x78
	.byte	0x0
	.uleb128 0x1c
	.byte	0x1
	.long	.LASF65
	.byte	0x1
	.byte	0x61
	.byte	0x1
	.long	0x42
	.long	.LFB84
	.long	.LFE84
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 0
	.long	0x4e8
	.uleb128 0x1d
	.long	0x34e
	.long	.LBB103
	.long	.LBE103
	.byte	0x1
	.byte	0x65
	.uleb128 0x1e
	.long	0x35b
	.byte	0x6
	.byte	0x3
	.long	USARTtoUSB_Buffer
	.byte	0x9f
	.uleb128 0x1f
	.long	.LBB104
	.long	.LBE104
	.uleb128 0x20
	.long	0x367
	.long	.LLST0
	.uleb128 0x20
	.long	0x372
	.long	.LLST1
	.uleb128 0x1b
	.long	0x2a2
	.long	.LBB105
	.long	.LBE105
	.byte	0x4
	.byte	0x57
	.uleb128 0x1b
	.long	0x27e
	.long	.LBB107
	.long	.LBE107
	.byte	0x4
	.byte	0x57
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x21
	.byte	0x1
	.long	.LASF59
	.byte	0x1
	.byte	0x7f
	.byte	0x1
	.long	.LFB86
	.long	.LFE86
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 0
	.uleb128 0x21
	.byte	0x1
	.long	.LASF60
	.byte	0x1
	.byte	0x85
	.byte	0x1
	.long	.LFB87
	.long	.LFE87
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 0
	.uleb128 0x17
	.byte	0x1
	.long	.LASF62
	.byte	0x1
	.byte	0x8a
	.byte	0x1
	.long	.LFB88
	.long	.LFE88
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 0
	.long	0x53b
	.uleb128 0x1b
	.long	0x37f
	.long	.LBB109
	.long	.LBE109
	.byte	0x1
	.byte	0x8e
	.byte	0x0
	.uleb128 0x21
	.byte	0x1
	.long	.LASF63
	.byte	0x1
	.byte	0x92
	.byte	0x1
	.long	.LFB89
	.long	.LFE89
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 0
	.uleb128 0x17
	.byte	0x1
	.long	.LASF64
	.byte	0x1
	.byte	0x98
	.byte	0x1
	.long	.LFB90
	.long	.LFE90
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 0
	.long	0x586
	.uleb128 0x1d
	.long	0x388
	.long	.LBB111
	.long	.LBE111
	.byte	0x1
	.byte	0x9a
	.uleb128 0x1e
	.long	0x395
	.byte	0x6
	.byte	0x3
	.long	Joystick_HID_Interface
	.byte	0x9f
	.byte	0x0
	.byte	0x0
	.uleb128 0x1c
	.byte	0x1
	.long	.LASF66
	.byte	0x1
	.byte	0xa7
	.byte	0x1
	.long	0x120
	.long	.LFB91
	.long	.LFE91
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 0
	.long	0x6e2
	.uleb128 0x22
	.long	.LASF55
	.byte	0x1
	.byte	0xa8
	.long	0x3a1
	.long	.LLST2
	.uleb128 0x22
	.long	.LASF67
	.byte	0x1
	.byte	0xa9
	.long	0x6e2
	.long	.LLST3
	.uleb128 0x22
	.long	.LASF68
	.byte	0x1
	.byte	0xaa
	.long	0x29d
	.long	.LLST4
	.uleb128 0x23
	.long	.LASF69
	.byte	0x1
	.byte	0xab
	.long	0xc1
	.byte	0x6
	.byte	0x62
	.byte	0x93
	.uleb128 0x1
	.byte	0x63
	.byte	0x93
	.uleb128 0x1
	.uleb128 0x22
	.long	.LASF70
	.byte	0x1
	.byte	0xac
	.long	0x6e7
	.long	.LLST5
	.uleb128 0x14
	.long	.LASF71
	.byte	0x1
	.byte	0xae
	.long	0x6f2
	.uleb128 0x14
	.long	.LASF72
	.byte	0x1
	.byte	0xb0
	.long	0x30
	.uleb128 0x18
	.long	0x2af
	.long	.LBB113
	.long	.LBE113
	.byte	0x1
	.byte	0xb0
	.long	0x66a
	.uleb128 0x1f
	.long	.LBB114
	.long	.LBE114
	.uleb128 0x24
	.long	0x2cb
	.byte	0x5
	.byte	0x3
	.long	USARTtoUSB_Buffer+132
	.uleb128 0x1f
	.long	.LBB115
	.long	.LBE115
	.uleb128 0x20
	.long	0x2e2
	.long	.LLST6
	.uleb128 0x20
	.long	0x2d7
	.long	.LLST7
	.uleb128 0x1b
	.long	0x2a2
	.long	.LBB116
	.long	.LBE116
	.byte	0x4
	.byte	0x6f
	.uleb128 0x1b
	.long	0x27e
	.long	.LBB118
	.long	.LBE118
	.byte	0x4
	.byte	0x6f
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x1f
	.long	.LBB120
	.long	.LBE120
	.uleb128 0x25
	.string	"ind"
	.byte	0x1
	.byte	0xb3
	.long	0x30
	.uleb128 0x1d
	.long	0x3ac
	.long	.LBB121
	.long	.LBE121
	.byte	0x1
	.byte	0xb5
	.uleb128 0x26
	.long	0x3bd
	.uleb128 0x1f
	.long	.LBB122
	.long	.LBE122
	.uleb128 0x20
	.long	0x3c8
	.long	.LLST8
	.uleb128 0x1f
	.long	.LBB123
	.long	.LBE123
	.uleb128 0x20
	.long	0x3df
	.long	.LLST9
	.uleb128 0x20
	.long	0x3d4
	.long	.LLST10
	.uleb128 0x1b
	.long	0x2a2
	.long	.LBB124
	.long	.LBE124
	.byte	0x4
	.byte	0xbd
	.uleb128 0x1b
	.long	0x27e
	.long	.LBB126
	.long	.LBE126
	.byte	0x4
	.byte	0xbd
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0xa
	.long	0x1e2
	.uleb128 0xa
	.long	0x6ec
	.uleb128 0xe
	.byte	0x2
	.long	0x49
	.uleb128 0xe
	.byte	0x2
	.long	0x273
	.uleb128 0x17
	.byte	0x1
	.long	.LASF73
	.byte	0x1
	.byte	0xc7
	.byte	0x1
	.long	.LFB92
	.long	.LFE92
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 0
	.long	0x762
	.uleb128 0x23
	.long	.LASF55
	.byte	0x1
	.byte	0xc7
	.long	0x3a1
	.byte	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.uleb128 0x23
	.long	.LASF67
	.byte	0x1
	.byte	0xc8
	.long	0x29d
	.byte	0x1
	.byte	0x66
	.uleb128 0x23
	.long	.LASF68
	.byte	0x1
	.byte	0xc9
	.long	0x29d
	.byte	0x1
	.byte	0x64
	.uleb128 0x23
	.long	.LASF69
	.byte	0x1
	.byte	0xca
	.long	0x762
	.byte	0x6
	.byte	0x62
	.byte	0x93
	.uleb128 0x1
	.byte	0x63
	.byte	0x93
	.uleb128 0x1
	.uleb128 0x23
	.long	.LASF70
	.byte	0x1
	.byte	0xcb
	.long	0x769
	.byte	0x6
	.byte	0x60
	.byte	0x93
	.uleb128 0x1
	.byte	0x61
	.byte	0x93
	.uleb128 0x1
	.byte	0x0
	.uleb128 0xe
	.byte	0x2
	.long	0x768
	.uleb128 0x27
	.uleb128 0xa
	.long	0x49
	.uleb128 0x17
	.byte	0x1
	.long	.LASF74
	.byte	0x1
	.byte	0xd4
	.byte	0x1
	.long	.LFB93
	.long	.LFE93
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 0
	.long	0x860
	.uleb128 0x28
	.long	.LASF84
	.byte	0x1
	.byte	0xd6
	.long	0x30
	.long	.LLST11
	.uleb128 0x18
	.long	0x2fa
	.long	.LBB128
	.long	.LBE128
	.byte	0x1
	.byte	0xd9
	.long	0x807
	.uleb128 0x1d
	.long	0x2af
	.long	.LBB129
	.long	.LBE129
	.byte	0x4
	.byte	0x81
	.uleb128 0x1f
	.long	.LBB130
	.long	.LBE130
	.uleb128 0x20
	.long	0x2cb
	.long	.LLST12
	.uleb128 0x1f
	.long	.LBB131
	.long	.LBE131
	.uleb128 0x20
	.long	0x2e2
	.long	.LLST13
	.uleb128 0x20
	.long	0x2d7
	.long	.LLST14
	.uleb128 0x1b
	.long	0x2a2
	.long	.LBB132
	.long	.LBE132
	.byte	0x4
	.byte	0x6f
	.uleb128 0x1b
	.long	0x27e
	.long	.LBB134
	.long	.LBE134
	.byte	0x4
	.byte	0x6f
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x1d
	.long	0x3ec
	.long	.LBB136
	.long	.LBE136
	.byte	0x1
	.byte	0xda
	.uleb128 0x29
	.long	0x404
	.long	.LLST15
	.uleb128 0x26
	.long	0x3f9
	.uleb128 0x1f
	.long	.LBB138
	.long	.LBE138
	.uleb128 0x20
	.long	0x410
	.long	.LLST16
	.uleb128 0x20
	.long	0x41b
	.long	.LLST17
	.uleb128 0x1b
	.long	0x2a2
	.long	.LBB139
	.long	.LBE139
	.byte	0x4
	.byte	0xa6
	.uleb128 0x1b
	.long	0x27e
	.long	.LBB141
	.long	.LBE141
	.byte	0x4
	.byte	0xa6
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0xc
	.long	0x30
	.long	0x870
	.uleb128 0xd
	.long	0x54
	.byte	0x7
	.byte	0x0
	.uleb128 0x2a
	.long	.LASF75
	.byte	0x1
	.byte	0x41
	.long	0x860
	.byte	0x1
	.byte	0x1
	.uleb128 0x2a
	.long	.LASF76
	.byte	0x1
	.byte	0x47
	.long	0x184
	.byte	0x1
	.byte	0x1
	.uleb128 0x2a
	.long	.LASF77
	.byte	0x1
	.byte	0x5a
	.long	0x1e8
	.byte	0x1
	.byte	0x1
	.uleb128 0x2a
	.long	.LASF78
	.byte	0x1
	.byte	0x5c
	.long	0x273
	.byte	0x1
	.byte	0x1
	.uleb128 0x2b
	.long	.LASF75
	.byte	0x1
	.byte	0x41
	.long	0x860
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	PrevJoystickHIDReportBuffer
	.uleb128 0x2b
	.long	.LASF76
	.byte	0x1
	.byte	0x47
	.long	0x184
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	Joystick_HID_Interface
	.uleb128 0x2b
	.long	.LASF77
	.byte	0x1
	.byte	0x5a
	.long	0x1e8
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	USARTtoUSB_Buffer
	.uleb128 0x2b
	.long	.LASF78
	.byte	0x1
	.byte	0x5c
	.long	0x273
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	joyReport
	.byte	0x0
	.section	.debug_abbrev
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x55
	.uleb128 0x6
	.uleb128 0x10
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0x0
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x16
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0x0
	.byte	0x0
	.uleb128 0x5
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x6
	.uleb128 0x28
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0x0
	.byte	0x0
	.uleb128 0x7
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x8
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x9
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0xa
	.uleb128 0x26
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xd
	.uleb128 0x21
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0xe
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xf
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x10
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x11
	.uleb128 0x2e
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x12
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x13
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x14
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x15
	.uleb128 0xb
	.byte	0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x16
	.uleb128 0x2e
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x20
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x17
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x18
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x19
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x1a
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x1b
	.uleb128 0x1d
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x1c
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x1d
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x1e
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x1f
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x20
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x21
	.uleb128 0x2e
	.byte	0x0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x22
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x23
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x24
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x25
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x26
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x27
	.uleb128 0x26
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x28
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x29
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x2a
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0x0
	.byte	0x0
	.uleb128 0x2b
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.section	.debug_pubnames,"",@progbits
	.long	0x19f
	.word	0x2
	.long	.Ldebug_info0
	.long	0x8ed
	.long	0x428
	.string	"SetupHardware"
	.long	0x474
	.string	"main"
	.long	0x4e8
	.string	"EVENT_USB_Device_Connect"
	.long	0x4fd
	.string	"EVENT_USB_Device_Disconnect"
	.long	0x512
	.string	"EVENT_USB_Device_ConfigurationChanged"
	.long	0x53b
	.string	"EVENT_USB_Device_UnhandledControlRequest"
	.long	0x550
	.string	"EVENT_USB_Device_StartOfFrame"
	.long	0x586
	.string	"CALLBACK_HID_Device_CreateHIDReport"
	.long	0x6f8
	.string	"CALLBACK_HID_Device_ProcessHIDReport"
	.long	0x76e
	.string	"__vector_23"
	.long	0x8a4
	.string	"PrevJoystickHIDReportBuffer"
	.long	0x8b6
	.string	"Joystick_HID_Interface"
	.long	0x8c8
	.string	"USARTtoUSB_Buffer"
	.long	0x8da
	.string	"joyReport"
	.long	0x0
	.section	.debug_pubtypes,"",@progbits
	.long	0x98
	.word	0x2
	.long	.Ldebug_info0
	.long	0x8ed
	.long	0x30
	.string	"uint8_t"
	.long	0x49
	.string	"uint16_t"
	.long	0x62
	.string	"uint32_t"
	.long	0x90
	.string	"USB_Device_States_t"
	.long	0x184
	.string	"USB_ClassInfo_HID_Device_t"
	.long	0x1e8
	.string	"RingBuff_t"
	.long	0x273
	.string	"USB_JoystickReport_Data_t"
	.long	0x0
	.section	.debug_aranges,"",@progbits
	.long	0x64
	.word	0x2
	.long	.Ldebug_info0
	.byte	0x4
	.byte	0x0
	.word	0x0
	.word	0x0
	.long	.LFB85
	.long	.LFE85-.LFB85
	.long	.LFB84
	.long	.LFE84-.LFB84
	.long	.LFB86
	.long	.LFE86-.LFB86
	.long	.LFB87
	.long	.LFE87-.LFB87
	.long	.LFB88
	.long	.LFE88-.LFB88
	.long	.LFB89
	.long	.LFE89-.LFB89
	.long	.LFB90
	.long	.LFE90-.LFB90
	.long	.LFB91
	.long	.LFE91-.LFB91
	.long	.LFB92
	.long	.LFE92-.LFB92
	.long	.LFB93
	.long	.LFE93-.LFB93
	.long	0x0
	.long	0x0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.long	.LFB85
	.long	.LFE85
	.long	.LFB84
	.long	.LFE84
	.long	.LFB86
	.long	.LFE86
	.long	.LFB87
	.long	.LFE87
	.long	.LFB88
	.long	.LFE88
	.long	.LFB89
	.long	.LFE89
	.long	.LFB90
	.long	.LFE90
	.long	.LFB91
	.long	.LFE91
	.long	.LFB92
	.long	.LFE92
	.long	.LFB93
	.long	.LFE93
	.long	0x0
	.long	0x0
	.section	.debug_line
	.long	.LELT0-.LSLT0
.LSLT0:
	.word	0x2
	.long	.LELTP0-.LASLTP0
.LASLTP0:
	.byte	0x1
	.byte	0x1
	.byte	0xf6
	.byte	0xf5
	.byte	0xa
	.byte	0x0
	.byte	0x1
	.byte	0x1
	.byte	0x1
	.byte	0x1
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x1
	.ascii	"../../../Public/LUFA100807/LUFA/Drivers/Peripheral"
	.byte	0
	.ascii	"../../../Public/LUFA100807/LUFA/Drivers/USB/Class/Device"
	.byte	0
	.ascii	"../../../Public/LUFA100807/LUFA/Drivers/USB/HighLevel/../Low"
	.ascii	"Level"
	.byte	0
	.ascii	"Lib"
	.byte	0
	.ascii	"Board"
	.byte	0
	.ascii	"/usr/local/lib/gcc/avr/4.5.3/../../../../avr/include"
	.byte	0
	.ascii	"/usr/local/lib/gcc/avr/4.5.3/../../../../avr/include/util"
	.byte	0
	.byte	0x0
	.string	"Arduino-joystick.c"
	.uleb128 0x0
	.uleb128 0x0
	.uleb128 0x0
	.string	"Serial.h"
	.uleb128 0x1
	.uleb128 0x0
	.uleb128 0x0
	.string	"LEDs.h"
	.uleb128 0x5
	.uleb128 0x0
	.uleb128 0x0
	.string	"LightweightRingBuff.h"
	.uleb128 0x4
	.uleb128 0x0
	.uleb128 0x0
	.string	"util/atomic.h"
	.uleb128 0x6
	.uleb128 0x0
	.uleb128 0x0
	.string	"Device.h"
	.uleb128 0x3
	.uleb128 0x0
	.uleb128 0x0
	.string	"HID.h"
	.uleb128 0x2
	.uleb128 0x0
	.uleb128 0x0
	.string	"stdint.h"
	.uleb128 0x6
	.uleb128 0x0
	.uleb128 0x0
	.string	"Arduino-joystick.h"
	.uleb128 0x0
	.uleb128 0x0
	.uleb128 0x0
	.byte	0x0
.LELTP0:
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.Letext0
	.byte	0x0
	.uleb128 0x1
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM0
	.byte	0x84
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM1
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM2
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM3
	.byte	0x4
	.uleb128 0x2
	.byte	0x3
	.sleb128 -14
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM4
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM5
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM6
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM7
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM8
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM9
	.byte	0x4
	.uleb128 0x3
	.byte	0x3
	.sleb128 -40
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM10
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM11
	.byte	0x4
	.uleb128 0x1
	.byte	0x47
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM12
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM13
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LFE85
	.byte	0x0
	.uleb128 0x1
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM14
	.byte	0x75
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM15
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM16
	.byte	0x4
	.uleb128 0x4
	.byte	0x3
	.sleb128 -12
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM17
	.byte	0x4
	.uleb128 0x5
	.byte	0x3
	.sleb128 -37
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM18
	.byte	0x4
	.uleb128 0x4
	.byte	0x3b
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM19
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM20
	.byte	0x4
	.uleb128 0x5
	.byte	0x3
	.sleb128 -20
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM21
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM22
	.byte	0x4
	.uleb128 0x1
	.byte	0x34
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM23
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM24
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LFE84
	.byte	0x0
	.uleb128 0x1
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM25
	.byte	0x93
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM26
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LFE86
	.byte	0x0
	.uleb128 0x1
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM27
	.byte	0x99
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM28
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LFE87
	.byte	0x0
	.uleb128 0x1
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM29
	.byte	0x9e
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM30
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM31
	.byte	0x4
	.uleb128 0x6
	.byte	0x1e
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM32
	.byte	0x4
	.uleb128 0x1
	.byte	0xd
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LFE88
	.byte	0x0
	.uleb128 0x1
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM33
	.byte	0xa6
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM34
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM35
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LFE89
	.byte	0x0
	.uleb128 0x1
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM36
	.byte	0xac
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM37
	.byte	0x4
	.uleb128 0x7
	.byte	0x44
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM38
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LFE90
	.byte	0x0
	.uleb128 0x1
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM39
	.byte	0xc0
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM40
	.byte	0x4
	.uleb128 0x4
	.byte	0x3
	.sleb128 -62
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM41
	.byte	0x4
	.uleb128 0x5
	.byte	0x3
	.sleb128 -61
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM42
	.byte	0x4
	.uleb128 0x4
	.byte	0x53
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM43
	.byte	0x4
	.uleb128 0x5
	.byte	0x3
	.sleb128 -43
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM44
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM45
	.byte	0x4
	.uleb128 0x1
	.byte	0x7f
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM46
	.byte	0x4
	.uleb128 0x4
	.byte	0x1d
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM47
	.byte	0x11
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM48
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM49
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM50
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM51
	.byte	0x4
	.uleb128 0x5
	.byte	0x3
	.sleb128 -139
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM52
	.byte	0x4
	.uleb128 0x4
	.byte	0xa1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM53
	.byte	0x4
	.uleb128 0x5
	.byte	0x3
	.sleb128 -121
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM54
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM55
	.byte	0x4
	.uleb128 0x1
	.byte	0x82
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM56
	.byte	0x13
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM57
	.byte	0x19
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM58
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM59
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LFE91
	.byte	0x0
	.uleb128 0x1
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM60
	.byte	0xdf
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM61
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LFE92
	.byte	0x0
	.uleb128 0x1
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM62
	.byte	0xe8
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM63
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM64
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM65
	.byte	0x4
	.uleb128 0x4
	.byte	0x3
	.sleb128 -105
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM66
	.byte	0x4
	.uleb128 0x5
	.byte	0x3
	.sleb128 -61
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM67
	.byte	0x4
	.uleb128 0x4
	.byte	0x53
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM68
	.byte	0x4
	.uleb128 0x5
	.byte	0x3
	.sleb128 -43
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM69
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM70
	.byte	0x4
	.uleb128 0x1
	.byte	0xa5
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM71
	.byte	0x4
	.uleb128 0x4
	.byte	0x3
	.sleb128 -55
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM72
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM73
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM74
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM75
	.byte	0x4
	.uleb128 0x5
	.byte	0x3
	.sleb128 -116
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM76
	.byte	0x4
	.uleb128 0x4
	.byte	0x8a
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM77
	.byte	0x4
	.uleb128 0x5
	.byte	0x3
	.sleb128 -98
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM78
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM79
	.byte	0x4
	.uleb128 0x1
	.byte	0xa9
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LFE93
	.byte	0x0
	.uleb128 0x1
	.byte	0x1
.LELT0:
	.section	.debug_str,"MS",@progbits,1
.LASF52:
	.string	"LEDs_Init"
.LASF83:
	.string	"__iCliRetVal"
.LASF29:
	.string	"USB_ClassInfo_HID_Device_t"
.LASF74:
	.string	"__vector_23"
.LASF42:
	.string	"USB_JoystickReport_Data_t"
.LASF22:
	.string	"PrevReportINBufferSize"
.LASF9:
	.string	"long long unsigned int"
.LASF20:
	.string	"ReportINEndpointDoubleBank"
.LASF11:
	.string	"DEVICE_STATE_Unattached"
.LASF13:
	.string	"DEVICE_STATE_Default"
.LASF54:
	.string	"HID_Device_MillisecondElapsed"
.LASF56:
	.string	"RingBuffer_Remove"
.LASF8:
	.string	"long long int"
.LASF0:
	.string	"signed char"
.LASF49:
	.string	"BaudRate"
.LASF58:
	.string	"RingBuffer_Insert"
.LASF40:
	.string	"ltrigger"
.LASF69:
	.string	"ReportData"
.LASF48:
	.string	"Serial_Init"
.LASF53:
	.string	"USB_Device_EnableSOFEvents"
.LASF5:
	.string	"long int"
.LASF63:
	.string	"EVENT_USB_Device_UnhandledControlRequest"
.LASF3:
	.string	"uint16_t"
.LASF82:
	.string	"USB_Device_States_t"
.LASF38:
	.string	"cstickx"
.LASF39:
	.string	"csticky"
.LASF17:
	.string	"InterfaceNumber"
.LASF25:
	.string	"IdleCount"
.LASF44:
	.string	"__ToDo"
.LASF67:
	.string	"ReportID"
.LASF21:
	.string	"PrevReportINBuffer"
.LASF75:
	.string	"PrevJoystickHIDReportBuffer"
.LASF10:
	.string	"__unknown__"
.LASF4:
	.string	"unsigned int"
.LASF77:
	.string	"USARTtoUSB_Buffer"
.LASF7:
	.string	"long unsigned int"
.LASF80:
	.string	"Arduino-joystick.c"
.LASF43:
	.string	"sreg_save"
.LASF19:
	.string	"ReportINEndpointSize"
.LASF15:
	.string	"DEVICE_STATE_Configured"
.LASF36:
	.string	"joystickx"
.LASF37:
	.string	"joysticky"
.LASF34:
	.string	"buttons1"
.LASF35:
	.string	"buttons2"
.LASF16:
	.string	"DEVICE_STATE_Suspended"
.LASF73:
	.string	"CALLBACK_HID_Device_ProcessHIDReport"
.LASF68:
	.string	"ReportType"
.LASF14:
	.string	"DEVICE_STATE_Addressed"
.LASF12:
	.string	"DEVICE_STATE_Powered"
.LASF84:
	.string	"ReceivedByte"
.LASF76:
	.string	"Joystick_HID_Interface"
.LASF61:
	.string	"SetupHardware"
.LASF72:
	.string	"BufferCount"
.LASF23:
	.string	"_Bool"
.LASF1:
	.string	"unsigned char"
.LASF71:
	.string	"reportp"
.LASF41:
	.string	"rtrigger"
.LASF59:
	.string	"EVENT_USB_Device_Connect"
.LASF50:
	.string	"DoubleSpeed"
.LASF18:
	.string	"ReportINEndpointNumber"
.LASF45:
	.string	"RingBuffer_GetCount"
.LASF6:
	.string	"uint32_t"
.LASF33:
	.string	"char"
.LASF28:
	.string	"State"
.LASF26:
	.string	"IdleMSRemaining"
.LASF24:
	.string	"UsingReportProtocol"
.LASF66:
	.string	"CALLBACK_HID_Device_CreateHIDReport"
.LASF81:
	.string	"/home/jas/atmega8u2/firmware/OneController_16buttons_ConstAnag"
.LASF47:
	.string	"__iRestore"
.LASF51:
	.string	"RingBuffer_InitBuffer"
.LASF32:
	.string	"RingBuff_t"
.LASF46:
	.string	"RingBuffer_IsFull"
.LASF27:
	.string	"Config"
.LASF55:
	.string	"HIDInterfaceInfo"
.LASF30:
	.string	"Buffer"
.LASF70:
	.string	"ReportSize"
.LASF31:
	.string	"Count"
.LASF2:
	.string	"uint8_t"
.LASF57:
	.string	"Data"
.LASF62:
	.string	"EVENT_USB_Device_ConfigurationChanged"
.LASF79:
	.string	"GNU C 4.5.3"
.LASF78:
	.string	"joyReport"
.LASF64:
	.string	"EVENT_USB_Device_StartOfFrame"
.LASF60:
	.string	"EVENT_USB_Device_Disconnect"
.LASF65:
	.string	"main"
