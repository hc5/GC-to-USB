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
.LFB114:
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
 ;  125 "Arduino-joystick.c" 1
	in __tmp_reg__, __SREG__
	cli
	sts 96, r18
	sts 96, __zero_reg__
	out __SREG__,__tmp_reg__
	
 ;  0 "" 2
.LVL0:
/* #NOAPP */
.LBB114:
.LBB115:
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
.LBE115:
.LBE114:
.LBB116:
.LBB117:
.LSM9:
	in r24,42-0x20
	ori r24,lo8(48)
	out 42-0x20,r24
.LSM10:
	in r24,43-0x20
	ori r24,lo8(48)
	out 43-0x20,r24
.LBE117:
.LBE116:
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
.LFE114:
	.size	SetupHardware, .-SetupHardware
	.section	.text.main,"ax",@progbits
.global	main
	.type	main, @function
main:
.LFB113:
.LSM14:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LSM15:
	call SetupHardware
.LVL1:
.LBB118:
.LBB119:
.LSM16:
	in r18,__SREG__
.LVL2:
.LBB120:
.LBB121:
.LSM17:
/* #APP */
 ;  50 "/usr/local/lib/gcc/avr/4.5.3/../../../../avr/include/util/atomic.h" 1
	cli
 ;  0 "" 2
.LVL3:
/* #NOAPP */
.LBE121:
.LBE120:
.LSM18:
	ldi r24,lo8(USARTtoUSB_Buffer)
	ldi r25,hi8(USARTtoUSB_Buffer)
	sts USARTtoUSB_Buffer+128+1,r25
	sts USARTtoUSB_Buffer+128,r24
.LSM19:
	sts USARTtoUSB_Buffer+130+1,r25
	sts USARTtoUSB_Buffer+130,r24
.LVL4:
.LBB122:
.LBB123:
.LSM20:
	out __SREG__,r18
.LSM21:
.LBE123:
.LBE122:
.LBE119:
.LBE118:
.LSM22:
/* #APP */
 ;  104 "Arduino-joystick.c" 1
	sei
 ;  0 "" 2
.LVL5:
/* #NOAPP */
.L8:
.LSM23:
	ldi r24,lo8(Joystick_HID_Interface)
	ldi r25,hi8(Joystick_HID_Interface)
	call HID_Device_USBTask
.LSM24:
	call USB_USBTask
.LSM25:
	lds r24,led1_ticks
	lds r25,led1_ticks+1
	sbiw r24,0
	breq .L8
.LSM26:
	lds r24,led1_ticks
	lds r25,led1_ticks+1
	sbiw r24,1
	sts led1_ticks+1,r25
	sts led1_ticks,r24
.LSM27:
	lds r24,led1_ticks
	lds r25,led1_ticks+1
	sbiw r24,0
	brne .L8
.LVL6:
.LBB124:
.LBB125:
.LSM28:
	sbi 43-0x20,5
	rjmp .L8
.LBE125:
.LBE124:
.LFE113:
	.size	main, .-main
	.section	.text.EVENT_USB_Device_ConfigurationChanged,"ax",@progbits
.global	EVENT_USB_Device_ConfigurationChanged
	.type	EVENT_USB_Device_ConfigurationChanged, @function
EVENT_USB_Device_ConfigurationChanged:
.LFB115:
.LSM29:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LSM30:
	ldi r24,lo8(Joystick_HID_Interface)
	ldi r25,hi8(Joystick_HID_Interface)
	call HID_Device_ConfigureEndpoints
.LVL7:
.LBB126:
.LBB127:
.LBB128:
.LSM31:
	ldi r30,lo8(226)
	ldi r31,hi8(226)
	ld r24,Z
	ori r24,lo8(4)
	st Z,r24
/* epilogue start */
.LBE128:
.LBE127:
.LBE126:
.LSM32:
	ret
.LFE115:
	.size	EVENT_USB_Device_ConfigurationChanged, .-EVENT_USB_Device_ConfigurationChanged
	.section	.text.EVENT_USB_Device_UnhandledControlRequest,"ax",@progbits
.global	EVENT_USB_Device_UnhandledControlRequest
	.type	EVENT_USB_Device_UnhandledControlRequest, @function
EVENT_USB_Device_UnhandledControlRequest:
.LFB116:
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
.LFE116:
	.size	EVENT_USB_Device_UnhandledControlRequest, .-EVENT_USB_Device_UnhandledControlRequest
	.section	.text.EVENT_USB_Device_StartOfFrame,"ax",@progbits
.global	EVENT_USB_Device_StartOfFrame
	.type	EVENT_USB_Device_StartOfFrame, @function
EVENT_USB_Device_StartOfFrame:
.LFB117:
.LSM36:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LVL8:
.LBB129:
.LBB130:
.LSM37:
	lds r24,Joystick_HID_Interface+11
	lds r25,Joystick_HID_Interface+11+1
	sbiw r24,0
	breq .L11
.LSM38:
	sbiw r24,1
	sts Joystick_HID_Interface+11+1,r25
	sts Joystick_HID_Interface+11,r24
.L11:
	ret
.LBE130:
.LBE129:
.LFE117:
	.size	EVENT_USB_Device_StartOfFrame, .-EVENT_USB_Device_StartOfFrame
	.section	.text.CALLBACK_HID_Device_CreateHIDReport,"ax",@progbits
.global	CALLBACK_HID_Device_CreateHIDReport
	.type	CALLBACK_HID_Device_CreateHIDReport, @function
CALLBACK_HID_Device_CreateHIDReport:
.LFB118:
.LSM39:
.LVL9:
	push r16
	push r17
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	movw r26,r16
.LVL10:
.LBB131:
.LBB132:
.LBB133:
.LSM40:
	in r25,__SREG__
.LVL11:
.LBB134:
.LBB135:
.LSM41:
/* #APP */
 ;  50 "/usr/local/lib/gcc/avr/4.5.3/../../../../avr/include/util/atomic.h" 1
	cli
 ;  0 "" 2
.LVL12:
/* #NOAPP */
.LBE135:
.LBE134:
.LSM42:
	lds r24,USARTtoUSB_Buffer+132
.LVL13:
.LBB136:
.LBB137:
.LSM43:
	out __SREG__,r25
.LSM44:
.LBE137:
.LBE136:
.LBE133:
.LBE132:
.LBE131:
.LSM45:
	cpi r24,lo8(9)
	brsh .+2
	rjmp .L14
.LVL14:
.LBB138:
.LBB139:
.LSM46:
	lds r30,USARTtoUSB_Buffer+130
	lds r31,USARTtoUSB_Buffer+130+1
	ld r20,Z+
.LVL15:
.LSM47:
	sts USARTtoUSB_Buffer+130+1,r31
	sts USARTtoUSB_Buffer+130,r30
	ldi r24,hi8(USARTtoUSB_Buffer+128)
	cpi r30,lo8(USARTtoUSB_Buffer+128)
	cpc r31,r24
	brne .L15
.LSM48:
	ldi r24,lo8(USARTtoUSB_Buffer)
	ldi r25,hi8(USARTtoUSB_Buffer)
	sts USARTtoUSB_Buffer+130+1,r25
	sts USARTtoUSB_Buffer+130,r24
.L15:
.LBB140:
.LSM49:
	in r25,__SREG__
.LVL16:
.LBB141:
.LBB142:
.LSM50:
/* #APP */
 ;  50 "/usr/local/lib/gcc/avr/4.5.3/../../../../avr/include/util/atomic.h" 1
	cli
 ;  0 "" 2
.LVL17:
/* #NOAPP */
.LBE142:
.LBE141:
.LSM51:
	lds r24,USARTtoUSB_Buffer+132
	subi r24,lo8(-(-1))
	sts USARTtoUSB_Buffer+132,r24
.LVL18:
.LBB143:
.LBB144:
.LSM52:
	out __SREG__,r25
.LSM53:
.LBE144:
.LBE143:
.LBE140:
.LBE139:
.LBE138:
.LSM54:
	movw r30,r22
	st Z,r20
.LSM55:
	ldi r24,lo8(8)
	ldi r25,hi8(8)
	st X+,r24
	st X,r25
.LVL19:
	mov r30,r18
	mov r31,r19
.LSM56:
	movw r18,r30
.LVL20:
	subi r18,lo8(-(8))
	sbci r19,hi8(-(8))
.LBB145:
.LBB146:
.LBB147:
.LSM57:
	ldi r24,lo8(USARTtoUSB_Buffer)
	ldi r25,hi8(USARTtoUSB_Buffer)
.LVL21:
.L17:
.LSM58:
	lds r26,USARTtoUSB_Buffer+130
	lds r27,USARTtoUSB_Buffer+130+1
	ld r21,X+
.LVL22:
.LSM59:
	sts USARTtoUSB_Buffer+130+1,r27
	sts USARTtoUSB_Buffer+130,r26
	ldi r20,hi8(USARTtoUSB_Buffer+128)
	cpi r26,lo8(USARTtoUSB_Buffer+128)
	cpc r27,r20
	brne .L16
.LSM60:
	sts USARTtoUSB_Buffer+130+1,r25
	sts USARTtoUSB_Buffer+130,r24
.L16:
.LBB148:
.LSM61:
	in r22,__SREG__
.LVL23:
.LBB149:
.LBB150:
.LSM62:
/* #APP */
 ;  50 "/usr/local/lib/gcc/avr/4.5.3/../../../../avr/include/util/atomic.h" 1
	cli
 ;  0 "" 2
.LVL24:
/* #NOAPP */
.LBE150:
.LBE149:
.LSM63:
	lds r20,USARTtoUSB_Buffer+132
	subi r20,lo8(-(-1))
	sts USARTtoUSB_Buffer+132,r20
.LVL25:
.LBB151:
.LBB152:
.LSM64:
	out __SREG__,r22
.LSM65:
.LBE152:
.LBE151:
.LBE148:
.LBE147:
.LBE146:
.LSM66:
	st Z+,r21
.LSM67:
	cp r30,r18
	cpc r31,r19
	brne .L17
.LVL26:
.LBE145:
.LBB153:
.LBB154:
.LSM68:
	cbi 43-0x20,5
.LBE154:
.LBE153:
.LSM69:
	ldi r24,lo8(2000)
	ldi r25,hi8(2000)
	sts led1_ticks+1,r25
	sts led1_ticks,r24
.LVL27:
.L14:
.LSM70:
	ldi r24,lo8(0)
/* epilogue start */
	pop r17
	pop r16
.LVL28:
	ret
.LFE118:
	.size	CALLBACK_HID_Device_CreateHIDReport, .-CALLBACK_HID_Device_CreateHIDReport
	.section	.text.CALLBACK_HID_Device_ProcessHIDReport,"ax",@progbits
.global	CALLBACK_HID_Device_ProcessHIDReport
	.type	CALLBACK_HID_Device_ProcessHIDReport, @function
CALLBACK_HID_Device_ProcessHIDReport:
.LFB119:
.LSM71:
.LVL29:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
/* epilogue start */
.LSM72:
	ret
.LFE119:
	.size	CALLBACK_HID_Device_ProcessHIDReport, .-CALLBACK_HID_Device_ProcessHIDReport
	.section	.text.__vector_23,"ax",@progbits
.global	__vector_23
	.type	__vector_23, @function
__vector_23:
.LFB120:
.LSM73:
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
.LSM74:
	lds r24,206
.LVL30:
.LSM75:
	in r25,62-0x20
	cpi r25,lo8(4)
	brne .L20
.LBB155:
.LBB156:
.LBB157:
.LBB158:
.LSM76:
	in r18,__SREG__
.LVL31:
.LBB159:
.LBB160:
.LSM77:
/* #APP */
 ;  50 "/usr/local/lib/gcc/avr/4.5.3/../../../../avr/include/util/atomic.h" 1
	cli
 ;  0 "" 2
.LVL32:
/* #NOAPP */
.LBE160:
.LBE159:
.LSM78:
	lds r25,USARTtoUSB_Buffer+132
.LVL33:
.LBB161:
.LBB162:
.LSM79:
	out __SREG__,r18
.LSM80:
.LBE162:
.LBE161:
.LBE158:
.LBE157:
.LBE156:
.LBE155:
.LSM81:
	cpi r25,lo8(-128)
	breq .L20
.LVL34:
.LBB163:
.LBB164:
.LSM82:
	lds r30,USARTtoUSB_Buffer+128
	lds r31,USARTtoUSB_Buffer+128+1
	st Z,r24
.LSM83:
	lds r30,USARTtoUSB_Buffer+128
	lds r31,USARTtoUSB_Buffer+128+1
	movw r24,r30
.LVL35:
	adiw r24,1
	sts USARTtoUSB_Buffer+128+1,r25
	sts USARTtoUSB_Buffer+128,r24
	ldi r18,hi8(USARTtoUSB_Buffer+128)
	cpi r24,lo8(USARTtoUSB_Buffer+128)
	cpc r25,r18
.LVL36:
	brne .L22
.LSM84:
	ldi r24,lo8(USARTtoUSB_Buffer)
	ldi r25,hi8(USARTtoUSB_Buffer)
	std Z+2,r25
	std Z+1,r24
.L22:
.LBB165:
.LSM85:
	in r25,__SREG__
.LVL37:
.LBB166:
.LBB167:
.LSM86:
/* #APP */
 ;  50 "/usr/local/lib/gcc/avr/4.5.3/../../../../avr/include/util/atomic.h" 1
	cli
 ;  0 "" 2
.LVL38:
/* #NOAPP */
.LBE167:
.LBE166:
.LSM87:
	lds r24,USARTtoUSB_Buffer+132
	subi r24,lo8(-(1))
	sts USARTtoUSB_Buffer+132,r24
.LVL39:
.LBB168:
.LBB169:
.LSM88:
	out __SREG__,r25
.LSM89:
.LVL40:
.L20:
/* epilogue start */
.LBE169:
.LBE168:
.LBE165:
.LBE164:
.LBE163:
.LSM90:
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
.LFE120:
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
.global	led1_ticks
.global	led1_ticks
	.section .bss
	.type	led1_ticks, @object
	.size	led1_ticks, 2
led1_ticks:
	.skip 2,0
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
	.long	.LFB114
	.long	.LFE114-.LFB114
	.p2align	2
.LEFDE0:
.LSFDE2:
	.long	.LEFDE2-.LASFDE2
.LASFDE2:
	.long	.Lframe0
	.long	.LFB113
	.long	.LFE113-.LFB113
	.p2align	2
.LEFDE2:
.LSFDE4:
	.long	.LEFDE4-.LASFDE4
.LASFDE4:
	.long	.Lframe0
	.long	.LFB115
	.long	.LFE115-.LFB115
	.p2align	2
.LEFDE4:
.LSFDE6:
	.long	.LEFDE6-.LASFDE6
.LASFDE6:
	.long	.Lframe0
	.long	.LFB116
	.long	.LFE116-.LFB116
	.p2align	2
.LEFDE6:
.LSFDE8:
	.long	.LEFDE8-.LASFDE8
.LASFDE8:
	.long	.Lframe0
	.long	.LFB117
	.long	.LFE117-.LFB117
	.p2align	2
.LEFDE8:
.LSFDE10:
	.long	.LEFDE10-.LASFDE10
.LASFDE10:
	.long	.Lframe0
	.long	.LFB118
	.long	.LFE118-.LFB118
	.p2align	2
.LEFDE10:
.LSFDE12:
	.long	.LEFDE12-.LASFDE12
.LASFDE12:
	.long	.Lframe0
	.long	.LFB119
	.long	.LFE119-.LFB119
	.p2align	2
.LEFDE12:
.LSFDE14:
	.long	.LEFDE14-.LASFDE14
.LASFDE14:
	.long	.Lframe0
	.long	.LFB120
	.long	.LFE120-.LFB120
	.p2align	2
.LEFDE14:
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
	.long	.LFE113
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	0x0
	.long	0x0
.LLST2:
	.long	.LVL9
	.long	.LVL13
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
	.long	.LVL9
	.long	.LVL21
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
	.long	.LVL9
	.long	.LVL15
	.word	0x1
	.byte	0x64
	.long	0x0
	.long	0x0
.LLST5:
	.long	.LVL9
	.long	.LVL20
	.word	0x6
	.byte	0x62
	.byte	0x93
	.uleb128 0x1
	.byte	0x63
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST6:
	.long	.LVL9
	.long	.LVL28
	.word	0x6
	.byte	0x60
	.byte	0x93
	.uleb128 0x1
	.byte	0x61
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST7:
	.long	.LVL10
	.long	.LVL20
	.word	0x6
	.byte	0x62
	.byte	0x93
	.uleb128 0x1
	.byte	0x63
	.byte	0x93
	.uleb128 0x1
	.long	.LVL20
	.long	.LVL21
	.word	0x6
	.byte	0x6e
	.byte	0x93
	.uleb128 0x1
	.byte	0x63
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST8:
	.long	.LVL12
	.long	.LVL13
	.word	0x2
	.byte	0x31
	.byte	0x9f
	.long	.LVL13
	.long	.LFE118
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	0x0
	.long	0x0
.LLST9:
	.long	.LVL11
	.long	.LVL16
	.word	0x1
	.byte	0x69
	.long	.LVL16
	.long	.LFE118
	.word	0x2
	.byte	0x8
	.byte	0x5f
	.long	0x0
	.long	0x0
.LLST10:
	.long	.LVL15
	.long	.LVL27
	.word	0x7
	.byte	0x3
	.long	USARTtoUSB_Buffer+130
	.byte	0x94
	.byte	0x2
	.long	0x0
	.long	0x0
.LLST11:
	.long	.LVL17
	.long	.LVL18
	.word	0x2
	.byte	0x31
	.byte	0x9f
	.long	.LVL18
	.long	.LVL27
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	0x0
	.long	0x0
.LLST12:
	.long	.LVL16
	.long	.LVL21
	.word	0x1
	.byte	0x69
	.long	.LVL21
	.long	.LVL23
	.word	0x2
	.byte	0x8
	.byte	0x5f
	.long	.LVL23
	.long	.LVL27
	.word	0x1
	.byte	0x66
	.long	0x0
	.long	0x0
.LLST13:
	.long	.LVL19
	.long	.LVL21
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	0x0
	.long	0x0
.LLST14:
	.long	.LVL22
	.long	.LVL27
	.word	0x7
	.byte	0x3
	.long	USARTtoUSB_Buffer+130
	.byte	0x94
	.byte	0x2
	.long	0x0
	.long	0x0
.LLST15:
	.long	.LVL24
	.long	.LVL25
	.word	0x2
	.byte	0x31
	.byte	0x9f
	.long	.LVL25
	.long	.LVL27
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	0x0
	.long	0x0
.LLST16:
	.long	.LVL16
	.long	.LVL21
	.word	0x1
	.byte	0x69
	.long	.LVL21
	.long	.LVL23
	.word	0x2
	.byte	0x8
	.byte	0x5f
	.long	.LVL23
	.long	.LVL27
	.word	0x1
	.byte	0x66
	.long	0x0
	.long	0x0
.LLST17:
	.long	.LVL26
	.long	.LVL27
	.word	0x3
	.byte	0x8
	.byte	0x20
	.byte	0x9f
	.long	0x0
	.long	0x0
.LLST18:
	.long	.LVL30
	.long	.LVL35
	.word	0x1
	.byte	0x68
	.long	.LVL35
	.long	.LVL40
	.word	0x7
	.byte	0x3
	.long	USARTtoUSB_Buffer+128
	.byte	0x94
	.byte	0x2
	.long	0x0
	.long	0x0
.LLST19:
	.long	.LVL32
	.long	.LVL33
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	.LVL33
	.long	.LVL40
	.word	0x5
	.byte	0x3
	.long	USARTtoUSB_Buffer+132
	.long	0x0
	.long	0x0
.LLST20:
	.long	.LVL32
	.long	.LVL33
	.word	0x2
	.byte	0x31
	.byte	0x9f
	.long	.LVL33
	.long	.LVL40
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	0x0
	.long	0x0
.LLST21:
	.long	.LVL31
	.long	.LVL36
	.word	0x1
	.byte	0x62
	.long	.LVL36
	.long	.LVL40
	.word	0x2
	.byte	0x8
	.byte	0x5f
	.long	0x0
	.long	0x0
.LLST22:
	.long	.LVL34
	.long	.LVL35
	.word	0x1
	.byte	0x68
	.long	.LVL35
	.long	.LVL40
	.word	0x7
	.byte	0x3
	.long	USARTtoUSB_Buffer+128
	.byte	0x94
	.byte	0x2
	.long	0x0
	.long	0x0
.LLST23:
	.long	.LVL37
	.long	.LVL40
	.word	0x1
	.byte	0x69
	.long	0x0
	.long	0x0
.LLST24:
	.long	.LVL38
	.long	.LVL39
	.word	0x2
	.byte	0x31
	.byte	0x9f
	.long	.LVL39
	.long	.LVL40
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	0x0
	.long	0x0
	.section	.debug_info
	.long	0xa5c
	.word	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF85
	.byte	0x1
	.long	.LASF86
	.long	.LASF87
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
	.long	.LASF16
	.byte	0x1
	.byte	0x6
	.byte	0x3c
	.long	0xbb
	.uleb128 0x6
	.long	.LASF11
	.sleb128 2
	.uleb128 0x6
	.long	.LASF12
	.sleb128 3
	.uleb128 0x6
	.long	.LASF13
	.sleb128 4
	.uleb128 0x6
	.long	.LASF14
	.sleb128 5
	.uleb128 0x6
	.long	.LASF15
	.sleb128 6
	.byte	0x0
	.uleb128 0x5
	.long	.LASF17
	.byte	0x1
	.byte	0x9
	.byte	0x49
	.long	0xec
	.uleb128 0x6
	.long	.LASF18
	.sleb128 0
	.uleb128 0x6
	.long	.LASF19
	.sleb128 1
	.uleb128 0x6
	.long	.LASF20
	.sleb128 2
	.uleb128 0x6
	.long	.LASF21
	.sleb128 3
	.uleb128 0x6
	.long	.LASF22
	.sleb128 4
	.uleb128 0x6
	.long	.LASF23
	.sleb128 5
	.byte	0x0
	.uleb128 0x7
	.byte	0x2
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.long	.LASF24
	.uleb128 0x8
	.long	.LASF88
	.byte	0xe
	.byte	0xa
	.byte	0xf2
	.long	0x177
	.uleb128 0x9
	.string	"buf"
	.byte	0xa
	.byte	0xf3
	.long	0x177
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF25
	.byte	0xa
	.byte	0xf4
	.long	0x3b
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF26
	.byte	0xa
	.byte	0xf5
	.long	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.uleb128 0xb
	.long	.LASF27
	.byte	0xa
	.word	0x105
	.long	0x42
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xc
	.string	"len"
	.byte	0xa
	.word	0x106
	.long	0x42
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0xc
	.string	"put"
	.byte	0xa
	.word	0x107
	.long	0x19f
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xc
	.string	"get"
	.byte	0xa
	.word	0x108
	.long	0x1b5
	.byte	0x2
	.byte	0x23
	.uleb128 0xa
	.uleb128 0xb
	.long	.LASF28
	.byte	0xa
	.word	0x109
	.long	0xec
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.byte	0x0
	.uleb128 0xd
	.byte	0x2
	.long	0x17d
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF29
	.uleb128 0xe
	.byte	0x1
	.long	0x42
	.long	0x199
	.uleb128 0xf
	.long	0x17d
	.uleb128 0xf
	.long	0x199
	.byte	0x0
	.uleb128 0xd
	.byte	0x2
	.long	0xf5
	.uleb128 0xd
	.byte	0x2
	.long	0x184
	.uleb128 0xe
	.byte	0x1
	.long	0x42
	.long	0x1b5
	.uleb128 0xf
	.long	0x199
	.byte	0x0
	.uleb128 0xd
	.byte	0x2
	.long	0x1a5
	.uleb128 0x10
	.byte	0x8
	.byte	0x7
	.byte	0x54
	.long	0x218
	.uleb128 0xa
	.long	.LASF30
	.byte	0x7
	.byte	0x56
	.long	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF31
	.byte	0x7
	.byte	0x58
	.long	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF32
	.byte	0x7
	.byte	0x59
	.long	0x49
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF33
	.byte	0x7
	.byte	0x5a
	.long	0xee
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xa
	.long	.LASF34
	.byte	0x7
	.byte	0x5c
	.long	0xec
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0xa
	.long	.LASF35
	.byte	0x7
	.byte	0x68
	.long	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.byte	0x0
	.uleb128 0x10
	.byte	0x5
	.byte	0x7
	.byte	0x71
	.long	0x24b
	.uleb128 0xa
	.long	.LASF36
	.byte	0x7
	.byte	0x73
	.long	0xee
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF37
	.byte	0x7
	.byte	0x74
	.long	0x49
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF38
	.byte	0x7
	.byte	0x75
	.long	0x49
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0x10
	.byte	0xd
	.byte	0x7
	.byte	0x52
	.long	0x270
	.uleb128 0xa
	.long	.LASF39
	.byte	0x7
	.byte	0x6e
	.long	0x270
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF40
	.byte	0x7
	.byte	0x77
	.long	0x218
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0x0
	.uleb128 0x11
	.long	0x1bb
	.uleb128 0x3
	.long	.LASF41
	.byte	0x7
	.byte	0x7a
	.long	0x24b
	.uleb128 0x12
	.long	0x30
	.long	0x290
	.uleb128 0x13
	.long	0x54
	.byte	0x7
	.byte	0x0
	.uleb128 0x12
	.long	0x30
	.long	0x2a0
	.uleb128 0x13
	.long	0x54
	.byte	0x7f
	.byte	0x0
	.uleb128 0x10
	.byte	0x85
	.byte	0x4
	.byte	0x46
	.long	0x2e3
	.uleb128 0xa
	.long	.LASF42
	.byte	0x4
	.byte	0x48
	.long	0x290
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x9
	.string	"In"
	.byte	0x4
	.byte	0x49
	.long	0x2e3
	.byte	0x3
	.byte	0x23
	.uleb128 0x80
	.uleb128 0x9
	.string	"Out"
	.byte	0x4
	.byte	0x4a
	.long	0x2e3
	.byte	0x3
	.byte	0x23
	.uleb128 0x82
	.uleb128 0xa
	.long	.LASF43
	.byte	0x4
	.byte	0x4b
	.long	0x30
	.byte	0x3
	.byte	0x23
	.uleb128 0x84
	.byte	0x0
	.uleb128 0xd
	.byte	0x2
	.long	0x30
	.uleb128 0x3
	.long	.LASF44
	.byte	0x4
	.byte	0x4c
	.long	0x2a0
	.uleb128 0x14
	.long	.LASF45
	.byte	0x6
	.byte	0x58
	.byte	0x1
	.byte	0x3
	.long	0x30d
	.uleb128 0x15
	.long	.LASF47
	.byte	0x6
	.byte	0x58
	.long	0x30d
	.byte	0x0
	.uleb128 0x11
	.long	0x30
	.uleb128 0x14
	.long	.LASF46
	.byte	0x5
	.byte	0x44
	.byte	0x1
	.byte	0x3
	.long	0x32b
	.uleb128 0x16
	.string	"__s"
	.byte	0x5
	.byte	0x44
	.long	0x32b
	.byte	0x0
	.uleb128 0xd
	.byte	0x2
	.long	0x30d
	.uleb128 0x17
	.long	.LASF89
	.byte	0x5
	.byte	0x30
	.byte	0x1
	.long	0x30
	.byte	0x3
	.uleb128 0x18
	.long	.LASF50
	.byte	0x4
	.byte	0x6b
	.byte	0x1
	.long	0x30
	.byte	0x3
	.long	0x37e
	.uleb128 0x15
	.long	.LASF42
	.byte	0x4
	.byte	0x6b
	.long	0x37e
	.uleb128 0x19
	.long	.LASF43
	.byte	0x4
	.byte	0x6d
	.long	0x30
	.uleb128 0x1a
	.uleb128 0x19
	.long	.LASF48
	.byte	0x4
	.byte	0x6f
	.long	0x30
	.uleb128 0x19
	.long	.LASF49
	.byte	0x4
	.byte	0x6f
	.long	0x30
	.byte	0x0
	.byte	0x0
	.uleb128 0x11
	.long	0x383
	.uleb128 0xd
	.byte	0x2
	.long	0x2e9
	.uleb128 0x18
	.long	.LASF51
	.byte	0x4
	.byte	0x7f
	.byte	0x1
	.long	0xee
	.byte	0x3
	.long	0x3a6
	.uleb128 0x15
	.long	.LASF42
	.byte	0x4
	.byte	0x7f
	.long	0x37e
	.byte	0x0
	.uleb128 0x14
	.long	.LASF52
	.byte	0x2
	.byte	0x89
	.byte	0x1
	.byte	0x3
	.long	0x3ca
	.uleb128 0x15
	.long	.LASF53
	.byte	0x2
	.byte	0x89
	.long	0x3ca
	.uleb128 0x15
	.long	.LASF54
	.byte	0x2
	.byte	0x8a
	.long	0x3cf
	.byte	0x0
	.uleb128 0x11
	.long	0x62
	.uleb128 0x11
	.long	0xee
	.uleb128 0x1b
	.long	.LASF58
	.byte	0x3
	.byte	0x43
	.byte	0x1
	.byte	0x3
	.uleb128 0x14
	.long	.LASF55
	.byte	0x4
	.byte	0x55
	.byte	0x1
	.byte	0x3
	.long	0x40e
	.uleb128 0x15
	.long	.LASF42
	.byte	0x4
	.byte	0x55
	.long	0x37e
	.uleb128 0x1a
	.uleb128 0x19
	.long	.LASF48
	.byte	0x4
	.byte	0x57
	.long	0x30
	.uleb128 0x19
	.long	.LASF49
	.byte	0x4
	.byte	0x57
	.long	0x30
	.byte	0x0
	.byte	0x0
	.uleb128 0x14
	.long	.LASF56
	.byte	0x3
	.byte	0x4e
	.byte	0x1
	.byte	0x3
	.long	0x427
	.uleb128 0x15
	.long	.LASF57
	.byte	0x3
	.byte	0x4e
	.long	0x30d
	.byte	0x0
	.uleb128 0x1b
	.long	.LASF59
	.byte	0xb
	.byte	0xa0
	.byte	0x1
	.byte	0x3
	.uleb128 0x14
	.long	.LASF60
	.byte	0x7
	.byte	0xc9
	.byte	0x1
	.byte	0x3
	.long	0x449
	.uleb128 0x15
	.long	.LASF61
	.byte	0x7
	.byte	0xc9
	.long	0x449
	.byte	0x0
	.uleb128 0x11
	.long	0x44e
	.uleb128 0xd
	.byte	0x2
	.long	0x275
	.uleb128 0x18
	.long	.LASF62
	.byte	0x4
	.byte	0xb6
	.byte	0x1
	.long	0x30
	.byte	0x3
	.long	0x494
	.uleb128 0x15
	.long	.LASF42
	.byte	0x4
	.byte	0xb6
	.long	0x37e
	.uleb128 0x19
	.long	.LASF63
	.byte	0x4
	.byte	0xb8
	.long	0x30
	.uleb128 0x1a
	.uleb128 0x19
	.long	.LASF48
	.byte	0x4
	.byte	0xbd
	.long	0x30
	.uleb128 0x19
	.long	.LASF49
	.byte	0x4
	.byte	0xbd
	.long	0x30
	.byte	0x0
	.byte	0x0
	.uleb128 0x14
	.long	.LASF64
	.byte	0x3
	.byte	0x49
	.byte	0x1
	.byte	0x3
	.long	0x4ad
	.uleb128 0x15
	.long	.LASF57
	.byte	0x3
	.byte	0x49
	.long	0x30d
	.byte	0x0
	.uleb128 0x14
	.long	.LASF65
	.byte	0x4
	.byte	0x9e
	.byte	0x1
	.byte	0x3
	.long	0x4e9
	.uleb128 0x15
	.long	.LASF42
	.byte	0x4
	.byte	0x9e
	.long	0x37e
	.uleb128 0x15
	.long	.LASF63
	.byte	0x4
	.byte	0x9f
	.long	0x30d
	.uleb128 0x1a
	.uleb128 0x19
	.long	.LASF48
	.byte	0x4
	.byte	0xa6
	.long	0x30
	.uleb128 0x19
	.long	.LASF49
	.byte	0x4
	.byte	0xa6
	.long	0x30
	.byte	0x0
	.byte	0x0
	.uleb128 0x1c
	.byte	0x1
	.long	.LASF66
	.byte	0x1
	.byte	0x79
	.byte	0x1
	.long	.LFB114
	.long	.LFE114
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 0
	.long	0x535
	.uleb128 0x1d
	.long	0x3a6
	.long	.LBB114
	.long	.LBE114
	.byte	0x1
	.byte	0x80
	.long	0x525
	.uleb128 0x1e
	.long	0x3be
	.byte	0x1
	.uleb128 0x1f
	.long	0x3b3
	.long	0x1c200
	.byte	0x0
	.uleb128 0x20
	.long	0x3d4
	.long	.LBB116
	.long	.LBE116
	.byte	0x1
	.byte	0x81
	.byte	0x0
	.uleb128 0x21
	.byte	0x1
	.long	.LASF69
	.byte	0x1
	.byte	0x62
	.byte	0x1
	.long	0x42
	.long	.LFB113
	.long	.LFE113
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 0
	.long	0x5c3
	.uleb128 0x1d
	.long	0x3dd
	.long	.LBB118
	.long	.LBE118
	.byte	0x1
	.byte	0x66
	.long	0x5ac
	.uleb128 0x22
	.long	0x3ea
	.byte	0x6
	.byte	0x3
	.long	USARTtoUSB_Buffer
	.byte	0x9f
	.uleb128 0x23
	.long	.LBB119
	.long	.LBE119
	.uleb128 0x24
	.long	0x3f6
	.long	.LLST0
	.uleb128 0x24
	.long	0x401
	.long	.LLST1
	.uleb128 0x20
	.long	0x331
	.long	.LBB120
	.long	.LBE120
	.byte	0x4
	.byte	0x57
	.uleb128 0x20
	.long	0x312
	.long	.LBB122
	.long	.LBE122
	.byte	0x4
	.byte	0x57
	.byte	0x0
	.byte	0x0
	.uleb128 0x25
	.long	0x40e
	.long	.LBB124
	.long	.LBE124
	.byte	0x1
	.byte	0x72
	.uleb128 0x1e
	.long	0x41b
	.byte	0x20
	.byte	0x0
	.byte	0x0
	.uleb128 0x1c
	.byte	0x1
	.long	.LASF67
	.byte	0x1
	.byte	0x88
	.byte	0x1
	.long	.LFB115
	.long	.LFE115
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 0
	.long	0x603
	.uleb128 0x25
	.long	0x427
	.long	.LBB126
	.long	.LBE126
	.byte	0x1
	.byte	0x8c
	.uleb128 0x25
	.long	0x2f4
	.long	.LBB127
	.long	.LBE127
	.byte	0xb
	.byte	0xa2
	.uleb128 0x1e
	.long	0x301
	.byte	0x5
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x26
	.byte	0x1
	.long	.LASF90
	.byte	0x1
	.byte	0x90
	.byte	0x1
	.long	.LFB116
	.long	.LFE116
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 0
	.uleb128 0x1c
	.byte	0x1
	.long	.LASF68
	.byte	0x1
	.byte	0x96
	.byte	0x1
	.long	.LFB117
	.long	.LFE117
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 0
	.long	0x64e
	.uleb128 0x25
	.long	0x430
	.long	.LBB129
	.long	.LBE129
	.byte	0x1
	.byte	0x98
	.uleb128 0x22
	.long	0x43d
	.byte	0x6
	.byte	0x3
	.long	Joystick_HID_Interface
	.byte	0x9f
	.byte	0x0
	.byte	0x0
	.uleb128 0x21
	.byte	0x1
	.long	.LASF70
	.byte	0x1
	.byte	0xa5
	.byte	0x1
	.long	0xee
	.long	.LFB118
	.long	.LFE118
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 0
	.long	0x825
	.uleb128 0x27
	.long	.LASF61
	.byte	0x1
	.byte	0xa6
	.long	0x449
	.long	.LLST2
	.uleb128 0x27
	.long	.LASF71
	.byte	0x1
	.byte	0xa7
	.long	0x825
	.long	.LLST3
	.uleb128 0x27
	.long	.LASF72
	.byte	0x1
	.byte	0xa8
	.long	0x30d
	.long	.LLST4
	.uleb128 0x27
	.long	.LASF73
	.byte	0x1
	.byte	0xa9
	.long	0xec
	.long	.LLST5
	.uleb128 0x27
	.long	.LASF74
	.byte	0x1
	.byte	0xaa
	.long	0x82a
	.long	.LLST6
	.uleb128 0x28
	.long	.LASF75
	.byte	0x1
	.byte	0xac
	.long	0x2e3
	.long	.LLST7
	.uleb128 0x1d
	.long	0x33e
	.long	.LBB131
	.long	.LBE131
	.byte	0x1
	.byte	0xae
	.long	0x728
	.uleb128 0x23
	.long	.LBB132
	.long	.LBE132
	.uleb128 0x29
	.long	0x35a
	.byte	0x5
	.byte	0x3
	.long	USARTtoUSB_Buffer+132
	.uleb128 0x23
	.long	.LBB133
	.long	.LBE133
	.uleb128 0x24
	.long	0x371
	.long	.LLST8
	.uleb128 0x24
	.long	0x366
	.long	.LLST9
	.uleb128 0x20
	.long	0x331
	.long	.LBB134
	.long	.LBE134
	.byte	0x4
	.byte	0x6f
	.uleb128 0x20
	.long	0x312
	.long	.LBB136
	.long	.LBE136
	.byte	0x4
	.byte	0x6f
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x1d
	.long	0x454
	.long	.LBB138
	.long	.LBE138
	.byte	0x1
	.byte	0xb1
	.long	0x78e
	.uleb128 0x2a
	.long	0x465
	.uleb128 0x23
	.long	.LBB139
	.long	.LBE139
	.uleb128 0x24
	.long	0x470
	.long	.LLST10
	.uleb128 0x23
	.long	.LBB140
	.long	.LBE140
	.uleb128 0x24
	.long	0x487
	.long	.LLST11
	.uleb128 0x24
	.long	0x47c
	.long	.LLST12
	.uleb128 0x20
	.long	0x331
	.long	.LBB141
	.long	.LBE141
	.byte	0x4
	.byte	0xbd
	.uleb128 0x20
	.long	0x312
	.long	.LBB143
	.long	.LBE143
	.byte	0x4
	.byte	0xbd
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x2b
	.long	.LBB145
	.long	.LBE145
	.long	0x80b
	.uleb128 0x2c
	.string	"i"
	.byte	0x1
	.byte	0xb4
	.long	0x30
	.long	.LLST13
	.uleb128 0x25
	.long	0x454
	.long	.LBB146
	.long	.LBE146
	.byte	0x1
	.byte	0xb5
	.uleb128 0x2a
	.long	0x465
	.uleb128 0x23
	.long	.LBB147
	.long	.LBE147
	.uleb128 0x24
	.long	0x470
	.long	.LLST14
	.uleb128 0x23
	.long	.LBB148
	.long	.LBE148
	.uleb128 0x24
	.long	0x487
	.long	.LLST15
	.uleb128 0x24
	.long	0x47c
	.long	.LLST16
	.uleb128 0x20
	.long	0x331
	.long	.LBB149
	.long	.LBE149
	.byte	0x4
	.byte	0xbd
	.uleb128 0x20
	.long	0x312
	.long	.LBB151
	.long	.LBE151
	.byte	0x4
	.byte	0xbd
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x25
	.long	0x494
	.long	.LBB153
	.long	.LBE153
	.byte	0x1
	.byte	0xb7
	.uleb128 0x2d
	.long	0x4a1
	.long	.LLST17
	.byte	0x0
	.byte	0x0
	.uleb128 0x11
	.long	0x2e3
	.uleb128 0x11
	.long	0x82f
	.uleb128 0xd
	.byte	0x2
	.long	0x49
	.uleb128 0x1c
	.byte	0x1
	.long	.LASF76
	.byte	0x1
	.byte	0xc5
	.byte	0x1
	.long	.LFB119
	.long	.LFE119
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 0
	.long	0x89f
	.uleb128 0x2e
	.long	.LASF61
	.byte	0x1
	.byte	0xc5
	.long	0x449
	.byte	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.uleb128 0x2e
	.long	.LASF71
	.byte	0x1
	.byte	0xc6
	.long	0x30d
	.byte	0x1
	.byte	0x66
	.uleb128 0x2e
	.long	.LASF72
	.byte	0x1
	.byte	0xc7
	.long	0x30d
	.byte	0x1
	.byte	0x64
	.uleb128 0x2e
	.long	.LASF73
	.byte	0x1
	.byte	0xc8
	.long	0x89f
	.byte	0x6
	.byte	0x62
	.byte	0x93
	.uleb128 0x1
	.byte	0x63
	.byte	0x93
	.uleb128 0x1
	.uleb128 0x2e
	.long	.LASF74
	.byte	0x1
	.byte	0xc9
	.long	0x8a6
	.byte	0x6
	.byte	0x60
	.byte	0x93
	.uleb128 0x1
	.byte	0x61
	.byte	0x93
	.uleb128 0x1
	.byte	0x0
	.uleb128 0xd
	.byte	0x2
	.long	0x8a5
	.uleb128 0x2f
	.uleb128 0x11
	.long	0x49
	.uleb128 0x1c
	.byte	0x1
	.long	.LASF77
	.byte	0x1
	.byte	0xd1
	.byte	0x1
	.long	.LFB120
	.long	.LFE120
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 0
	.long	0x99d
	.uleb128 0x28
	.long	.LASF78
	.byte	0x1
	.byte	0xd3
	.long	0x30
	.long	.LLST18
	.uleb128 0x1d
	.long	0x389
	.long	.LBB155
	.long	.LBE155
	.byte	0x1
	.byte	0xd6
	.long	0x944
	.uleb128 0x25
	.long	0x33e
	.long	.LBB156
	.long	.LBE156
	.byte	0x4
	.byte	0x81
	.uleb128 0x23
	.long	.LBB157
	.long	.LBE157
	.uleb128 0x24
	.long	0x35a
	.long	.LLST19
	.uleb128 0x23
	.long	.LBB158
	.long	.LBE158
	.uleb128 0x24
	.long	0x371
	.long	.LLST20
	.uleb128 0x24
	.long	0x366
	.long	.LLST21
	.uleb128 0x20
	.long	0x331
	.long	.LBB159
	.long	.LBE159
	.byte	0x4
	.byte	0x6f
	.uleb128 0x20
	.long	0x312
	.long	.LBB161
	.long	.LBE161
	.byte	0x4
	.byte	0x6f
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x25
	.long	0x4ad
	.long	.LBB163
	.long	.LBE163
	.byte	0x1
	.byte	0xd7
	.uleb128 0x2d
	.long	0x4c5
	.long	.LLST22
	.uleb128 0x2a
	.long	0x4ba
	.uleb128 0x23
	.long	.LBB165
	.long	.LBE165
	.uleb128 0x24
	.long	0x4d1
	.long	.LLST23
	.uleb128 0x24
	.long	0x4dc
	.long	.LLST24
	.uleb128 0x20
	.long	0x331
	.long	.LBB166
	.long	.LBE166
	.byte	0x4
	.byte	0xa6
	.uleb128 0x20
	.long	0x312
	.long	.LBB168
	.long	.LBE168
	.byte	0x4
	.byte	0xa6
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x12
	.long	0x199
	.long	0x9a8
	.uleb128 0x30
	.byte	0x0
	.uleb128 0x31
	.long	.LASF79
	.byte	0xa
	.word	0x195
	.long	0x99d
	.byte	0x1
	.byte	0x1
	.uleb128 0x32
	.long	.LASF80
	.byte	0x2
	.byte	0x59
	.long	0xf5
	.byte	0x1
	.byte	0x1
	.uleb128 0x32
	.long	.LASF81
	.byte	0x1
	.byte	0x41
	.long	0x280
	.byte	0x1
	.byte	0x1
	.uleb128 0x32
	.long	.LASF82
	.byte	0x1
	.byte	0x47
	.long	0x275
	.byte	0x1
	.byte	0x1
	.uleb128 0x32
	.long	.LASF83
	.byte	0x1
	.byte	0x5a
	.long	0x2e9
	.byte	0x1
	.byte	0x1
	.uleb128 0x32
	.long	.LASF84
	.byte	0x1
	.byte	0x5d
	.long	0x9f7
	.byte	0x1
	.byte	0x1
	.uleb128 0x33
	.long	0x42
	.uleb128 0x31
	.long	.LASF79
	.byte	0xa
	.word	0x195
	.long	0x99d
	.byte	0x1
	.byte	0x1
	.uleb128 0x32
	.long	.LASF80
	.byte	0x2
	.byte	0x59
	.long	0xf5
	.byte	0x1
	.byte	0x1
	.uleb128 0x34
	.long	.LASF81
	.byte	0x1
	.byte	0x41
	.long	0x280
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	PrevJoystickHIDReportBuffer
	.uleb128 0x34
	.long	.LASF82
	.byte	0x1
	.byte	0x47
	.long	0x275
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	Joystick_HID_Interface
	.uleb128 0x34
	.long	.LASF83
	.byte	0x1
	.byte	0x5a
	.long	0x2e9
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	USARTtoUSB_Buffer
	.uleb128 0x34
	.long	.LASF84
	.byte	0x1
	.byte	0x5d
	.long	0x9f7
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	led1_ticks
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
	.uleb128 0x9
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
	.uleb128 0xa
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
	.uleb128 0xb
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0xc
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0xd
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xe
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xf
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x10
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
	.uleb128 0x11
	.uleb128 0x26
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x13
	.uleb128 0x21
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x14
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
	.uleb128 0x15
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
	.uleb128 0x16
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
	.uleb128 0x17
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
	.uleb128 0x18
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
	.uleb128 0x19
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
	.uleb128 0x1a
	.uleb128 0xb
	.byte	0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x1b
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
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x1e
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x1f
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x20
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
	.uleb128 0x21
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
	.uleb128 0x22
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x23
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x24
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x25
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
	.uleb128 0x26
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
	.uleb128 0x27
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
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x2a
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x2b
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x2c
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
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x2d
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x2e
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
	.uleb128 0x2f
	.uleb128 0x26
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x30
	.uleb128 0x21
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0x0
	.byte	0x0
	.uleb128 0x32
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
	.uleb128 0x33
	.uleb128 0x35
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x34
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
	.long	0x163
	.word	0x2
	.long	.Ldebug_info0
	.long	0xa60
	.long	0x4e9
	.string	"SetupHardware"
	.long	0x535
	.string	"main"
	.long	0x5c3
	.string	"EVENT_USB_Device_ConfigurationChanged"
	.long	0x603
	.string	"EVENT_USB_Device_UnhandledControlRequest"
	.long	0x618
	.string	"EVENT_USB_Device_StartOfFrame"
	.long	0x64e
	.string	"CALLBACK_HID_Device_CreateHIDReport"
	.long	0x835
	.string	"CALLBACK_HID_Device_ProcessHIDReport"
	.long	0x8ab
	.string	"__vector_23"
	.long	0xa17
	.string	"PrevJoystickHIDReportBuffer"
	.long	0xa29
	.string	"Joystick_HID_Interface"
	.long	0xa3b
	.string	"USARTtoUSB_Buffer"
	.long	0xa4d
	.string	"led1_ticks"
	.long	0x0
	.section	.debug_pubtypes,"",@progbits
	.long	0x9a
	.word	0x2
	.long	.Ldebug_info0
	.long	0xa60
	.long	0x30
	.string	"uint8_t"
	.long	0x49
	.string	"uint16_t"
	.long	0x62
	.string	"uint32_t"
	.long	0x90
	.string	"USB_Interrupts_t"
	.long	0xbb
	.string	"USB_Device_States_t"
	.long	0xf5
	.string	"__file"
	.long	0x275
	.string	"USB_ClassInfo_HID_Device_t"
	.long	0x2e9
	.string	"RingBuff_t"
	.long	0x0
	.section	.debug_aranges,"",@progbits
	.long	0x54
	.word	0x2
	.long	.Ldebug_info0
	.byte	0x4
	.byte	0x0
	.word	0x0
	.word	0x0
	.long	.LFB114
	.long	.LFE114-.LFB114
	.long	.LFB113
	.long	.LFE113-.LFB113
	.long	.LFB115
	.long	.LFE115-.LFB115
	.long	.LFB116
	.long	.LFE116-.LFB116
	.long	.LFB117
	.long	.LFE117-.LFB117
	.long	.LFB118
	.long	.LFE118-.LFB118
	.long	.LFB119
	.long	.LFE119-.LFB119
	.long	.LFB120
	.long	.LFE120-.LFB120
	.long	0x0
	.long	0x0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.long	.LFB114
	.long	.LFE114
	.long	.LFB113
	.long	.LFE113
	.long	.LFB115
	.long	.LFE115
	.long	.LFB116
	.long	.LFE116
	.long	.LFB117
	.long	.LFE117
	.long	.LFB118
	.long	.LFE118
	.long	.LFB119
	.long	.LFE119
	.long	.LFB120
	.long	.LFE120
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
	.ascii	"../../../Public/LUFA110528/LUFA/Drivers/Peripheral/AVR8"
	.byte	0
	.ascii	"../../../Public/LUFA110528/LUFA/Drivers/USB/Class/Device"
	.byte	0
	.ascii	"../../../Public/LUFA110528/LUFA/Drivers/USB/Core/AVR8/.."
	.byte	0
	.ascii	"../../../Public/LUFA110528/LUFA/Drivers/USB/Core/AVR8/../AVR"
	.ascii	"8"
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
	.string	"Serial_AVR8.h"
	.uleb128 0x1
	.uleb128 0x0
	.uleb128 0x0
	.string	"LEDs.h"
	.uleb128 0x6
	.uleb128 0x0
	.uleb128 0x0
	.string	"LightweightRingBuff.h"
	.uleb128 0x5
	.uleb128 0x0
	.uleb128 0x0
	.string	"util/atomic.h"
	.uleb128 0x7
	.uleb128 0x0
	.uleb128 0x0
	.string	"AVR8/USBInterrupt_AVR8.h"
	.uleb128 0x3
	.uleb128 0x0
	.uleb128 0x0
	.string	"HID.h"
	.uleb128 0x2
	.uleb128 0x0
	.uleb128 0x0
	.string	"stdint.h"
	.uleb128 0x7
	.uleb128 0x0
	.uleb128 0x0
	.string	"Device.h"
	.uleb128 0x3
	.uleb128 0x0
	.uleb128 0x0
	.string	"stdio.h"
	.uleb128 0x7
	.uleb128 0x0
	.uleb128 0x0
	.string	"AVR8/Device_AVR8.h"
	.uleb128 0x3
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
	.byte	0x8d
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
	.byte	0x23
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
	.sleb128 -78
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
	.byte	0x50
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
	.long	.LFE114
	.byte	0x0
	.uleb128 0x1
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM14
	.byte	0x76
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
	.sleb128 -13
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
	.byte	0x35
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
	.long	.LSM25
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM26
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM27
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM28
	.byte	0x4
	.uleb128 0x3
	.byte	0x3
	.sleb128 -33
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LFE113
	.byte	0x0
	.uleb128 0x1
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM29
	.byte	0x9c
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
	.byte	0x3
	.sleb128 -25
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM32
	.byte	0x4
	.uleb128 0x1
	.byte	0x30
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LFE115
	.byte	0x0
	.uleb128 0x1
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM33
	.byte	0xa4
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
	.long	.LFE116
	.byte	0x0
	.uleb128 0x1
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM36
	.byte	0xaa
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM37
	.byte	0x4
	.uleb128 0x7
	.byte	0x48
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM38
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LFE117
	.byte	0x0
	.uleb128 0x1
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM39
	.byte	0xbe
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM40
	.byte	0x4
	.uleb128 0x4
	.byte	0x3
	.sleb128 -60
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
	.byte	0x7b
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM46
	.byte	0x4
	.uleb128 0x4
	.byte	0x1e
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM47
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM48
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM49
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM50
	.byte	0x4
	.uleb128 0x5
	.byte	0x3
	.sleb128 -139
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM51
	.byte	0x4
	.uleb128 0x4
	.byte	0xa1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM52
	.byte	0x4
	.uleb128 0x5
	.byte	0x3
	.sleb128 -121
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM53
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM54
	.byte	0x4
	.uleb128 0x1
	.byte	0x7e
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM55
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM56
	.byte	0x3
	.sleb128 -13
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM57
	.byte	0x4
	.uleb128 0x4
	.byte	0x2a
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM58
	.byte	0x11
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM59
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM60
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM61
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM62
	.byte	0x4
	.uleb128 0x5
	.byte	0x3
	.sleb128 -139
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM63
	.byte	0x4
	.uleb128 0x4
	.byte	0xa1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM64
	.byte	0x4
	.uleb128 0x5
	.byte	0x3
	.sleb128 -121
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM65
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM66
	.byte	0x4
	.uleb128 0x1
	.byte	0x82
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM67
	.byte	0x13
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM68
	.byte	0x4
	.uleb128 0x3
	.byte	0x3
	.sleb128 -105
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM69
	.byte	0x4
	.uleb128 0x1
	.byte	0x81
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM70
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LFE118
	.byte	0x0
	.uleb128 0x1
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM71
	.byte	0xdd
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM72
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LFE119
	.byte	0x0
	.uleb128 0x1
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM73
	.byte	0xe5
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM74
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM75
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM76
	.byte	0x4
	.uleb128 0x4
	.byte	0x3
	.sleb128 -102
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM77
	.byte	0x4
	.uleb128 0x5
	.byte	0x3
	.sleb128 -61
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM78
	.byte	0x4
	.uleb128 0x4
	.byte	0x53
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM79
	.byte	0x4
	.uleb128 0x5
	.byte	0x3
	.sleb128 -43
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM80
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM81
	.byte	0x4
	.uleb128 0x1
	.byte	0xa2
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM82
	.byte	0x4
	.uleb128 0x4
	.byte	0x3
	.sleb128 -52
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM83
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM84
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM85
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM86
	.byte	0x4
	.uleb128 0x5
	.byte	0x3
	.sleb128 -116
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM87
	.byte	0x4
	.uleb128 0x4
	.byte	0x8a
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM88
	.byte	0x4
	.uleb128 0x5
	.byte	0x3
	.sleb128 -98
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM89
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM90
	.byte	0x4
	.uleb128 0x1
	.byte	0xa6
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LFE120
	.byte	0x0
	.uleb128 0x1
	.byte	0x1
.LELT0:
	.section	.debug_str,"MS",@progbits,1
.LASF84:
	.string	"led1_ticks"
.LASF77:
	.string	"__vector_23"
.LASF41:
	.string	"USB_ClassInfo_HID_Device_t"
.LASF31:
	.string	"ReportINEndpointNumber"
.LASF40:
	.string	"State"
.LASF38:
	.string	"IdleMSRemaining"
.LASF56:
	.string	"LEDs_TurnOffLEDs"
.LASF90:
	.string	"EVENT_USB_Device_UnhandledControlRequest"
.LASF47:
	.string	"Interrupt"
.LASF53:
	.string	"BaudRate"
.LASF69:
	.string	"main"
.LASF73:
	.string	"ReportData"
.LASF12:
	.string	"USB_INT_SUSPI"
.LASF71:
	.string	"ReportID"
.LASF10:
	.string	"__unknown__"
.LASF18:
	.string	"DEVICE_STATE_Unattached"
.LASF2:
	.string	"uint8_t"
.LASF70:
	.string	"CALLBACK_HID_Device_CreateHIDReport"
.LASF83:
	.string	"USARTtoUSB_Buffer"
.LASF61:
	.string	"HIDInterfaceInfo"
.LASF35:
	.string	"PrevReportINBufferSize"
.LASF48:
	.string	"sreg_save"
.LASF8:
	.string	"long long int"
.LASF30:
	.string	"InterfaceNumber"
.LASF5:
	.string	"long int"
.LASF86:
	.string	"Arduino-joystick.c"
.LASF36:
	.string	"UsingReportProtocol"
.LASF32:
	.string	"ReportINEndpointSize"
.LASF63:
	.string	"Data"
.LASF39:
	.string	"Config"
.LASF54:
	.string	"DoubleSpeed"
.LASF26:
	.string	"flags"
.LASF60:
	.string	"HID_Device_MillisecondElapsed"
.LASF17:
	.string	"USB_Device_States_t"
.LASF20:
	.string	"DEVICE_STATE_Default"
.LASF55:
	.string	"RingBuffer_InitBuffer"
.LASF1:
	.string	"unsigned char"
.LASF44:
	.string	"RingBuff_t"
.LASF88:
	.string	"__file"
.LASF49:
	.string	"__ToDo"
.LASF0:
	.string	"signed char"
.LASF82:
	.string	"Joystick_HID_Interface"
.LASF9:
	.string	"long long unsigned int"
.LASF6:
	.string	"uint32_t"
.LASF4:
	.string	"unsigned int"
.LASF3:
	.string	"uint16_t"
.LASF46:
	.string	"__iRestore"
.LASF37:
	.string	"IdleCount"
.LASF51:
	.string	"RingBuffer_IsFull"
.LASF13:
	.string	"USB_INT_EORSTI"
.LASF34:
	.string	"PrevReportINBuffer"
.LASF25:
	.string	"unget"
.LASF43:
	.string	"Count"
.LASF14:
	.string	"USB_INT_SOFI"
.LASF64:
	.string	"LEDs_TurnOnLEDs"
.LASF50:
	.string	"RingBuffer_GetCount"
.LASF68:
	.string	"EVENT_USB_Device_StartOfFrame"
.LASF28:
	.string	"udata"
.LASF45:
	.string	"USB_INT_Enable"
.LASF29:
	.string	"char"
.LASF66:
	.string	"SetupHardware"
.LASF58:
	.string	"LEDs_Init"
.LASF24:
	.string	"_Bool"
.LASF78:
	.string	"ReceivedByte"
.LASF15:
	.string	"USB_INT_RXSTPI"
.LASF74:
	.string	"ReportSize"
.LASF80:
	.string	"USARTSerialStream"
.LASF7:
	.string	"long unsigned int"
.LASF33:
	.string	"ReportINEndpointDoubleBank"
.LASF52:
	.string	"Serial_Init"
.LASF27:
	.string	"size"
.LASF89:
	.string	"__iCliRetVal"
.LASF76:
	.string	"CALLBACK_HID_Device_ProcessHIDReport"
.LASF75:
	.string	"JoystickReport"
.LASF16:
	.string	"USB_Interrupts_t"
.LASF72:
	.string	"ReportType"
.LASF19:
	.string	"DEVICE_STATE_Powered"
.LASF79:
	.string	"__iob"
.LASF87:
	.string	"/home/jas/atmega8u2/firmware/FourControllers_New"
.LASF21:
	.string	"DEVICE_STATE_Addressed"
.LASF22:
	.string	"DEVICE_STATE_Configured"
.LASF65:
	.string	"RingBuffer_Insert"
.LASF81:
	.string	"PrevJoystickHIDReportBuffer"
.LASF11:
	.string	"USB_INT_WAKEUPI"
.LASF67:
	.string	"EVENT_USB_Device_ConfigurationChanged"
.LASF42:
	.string	"Buffer"
.LASF23:
	.string	"DEVICE_STATE_Suspended"
.LASF59:
	.string	"USB_Device_EnableSOFEvents"
.LASF57:
	.string	"LEDMask"
.LASF85:
	.string	"GNU C 4.5.3"
.LASF62:
	.string	"RingBuffer_Remove"
