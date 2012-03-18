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
	.section	.text.RingBuffer_Remove.clone.1,"ax",@progbits
	.type	RingBuffer_Remove.clone.1, @function
RingBuffer_Remove.clone.1:
.LFB111:
.LSM0:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LVL0:
.LSM1:
	ldi r30,lo8(USARTtoUSB_Buffer)
	ldi r31,hi8(USARTtoUSB_Buffer)
.LVL1:
.LSM2:
	ldd r26,Z+2
	ldd r27,Z+3
	ld r24,X+
.LVL2:
.LSM3:
	std Z+3,r27
	std Z+2,r26
	ldd r18,Z+6
	ldd r19,Z+7
	cp r26,r18
	cpc r27,r19
	brne .L2
.LSM4:
	ldd r18,Z+4
	ldd r19,Z+5
	std Z+3,r19
	std Z+2,r18
.L2:
.LBB103:
.LBB104:
.LSM5:
.LSM6:
	in r25,__SREG__
.LBE104:
.LBE103:
.LBB105:
.LBB106:
.LSM7:
.LSM8:
/* #APP */
 ;  385 "../../../Public/LUFA110528/LUFA/Drivers/USB/../../Common/Common.h" 1
	cli
 ;  0 "" 2
.LSM9:
/* #NOAPP */
.LBE106:
.LBE105:
.LSM10:
	ldd r18,Z+9
	ldd r19,Z+10
	subi r18,lo8(-(-1))
	sbci r19,hi8(-(-1))
	std Z+10,r19
	std Z+9,r18
.LVL3:
.LBB107:
.LBB108:
.LSM11:
.LSM12:
	out __SREG__,r25
.LSM13:
/* epilogue start */
.LBE108:
.LBE107:
.LSM14:
	ret
.LFE111:
	.size	RingBuffer_Remove.clone.1, .-RingBuffer_Remove.clone.1
	.section	.text.SetupHardware,"ax",@progbits
.global	SetupHardware
	.type	SetupHardware, @function
SetupHardware:
.LFB103:
.LSM15:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
.LSM16:
	in r24,84-0x20
	andi r24,lo8(-9)
	out 84-0x20,r24
.LSM17:
	ldi r18,lo8(24)
/* #APP */
 ;  115 "Arduino-joystick.c" 1
	in __tmp_reg__, __SREG__
	cli
	sts 96, r18
	sts 96, __zero_reg__
	out __SREG__,__tmp_reg__
	
 ;  0 "" 2
.LVL4:
/* #NOAPP */
.LBB109:
.LBB110:
.LSM18:
	ldi r24,lo8(16)
	ldi r25,hi8(16)
	sts 204+1,r25
	sts 204,r24
.LSM19:
	ldi r24,lo8(6)
	sts 202,r24
.LSM20:
	ldi r24,lo8(2)
	sts 200,r24
.LSM21:
	ldi r28,lo8(201)
	ldi r29,hi8(201)
	st Y,r18
.LSM22:
	sbi 42-0x20,3
.LSM23:
	sbi 43-0x20,2
.LBE110:
.LBE109:
.LSM24:
	call USB_Init
.LSM25:
	ldi r24,lo8(-104)
	st Y,r24
/* epilogue start */
.LSM26:
	pop r29
	pop r28
	ret
.LFE103:
	.size	SetupHardware, .-SetupHardware
	.section	.text.main,"ax",@progbits
.global	main
	.type	main, @function
main:
.LFB102:
.LSM27:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LSM28:
	call SetupHardware
.LVL5:
.LBB111:
.LBB112:
.LSM29:
	ldi r30,lo8(USARTtoUSB_Buffer)
	ldi r31,hi8(USARTtoUSB_Buffer)
.LVL6:
.LBB113:
.LBB114:
.LSM30:
.LSM31:
	in r18,__SREG__
.LBE114:
.LBE113:
.LBB115:
.LBB116:
.LSM32:
.LSM33:
/* #APP */
 ;  385 "../../../Public/LUFA110528/LUFA/Drivers/USB/../../Common/Common.h" 1
	cli
 ;  0 "" 2
.LSM34:
/* #NOAPP */
.LBE116:
.LBE115:
.LSM35:
	ldi r24,lo8(BufferData)
	ldi r25,hi8(BufferData)
	std Z+1,r25
	st Z,r24
.LSM36:
	std Z+3,r25
	std Z+2,r24
.LSM37:
	std Z+5,r25
	std Z+4,r24
.LSM38:
	ldi r24,lo8(BufferData+72)
	ldi r25,hi8(BufferData+72)
	std Z+7,r25
	std Z+6,r24
.LSM39:
	ldi r24,lo8(72)
	std Z+8,r24
.LSM40:
	std Z+10,__zero_reg__
	std Z+9,__zero_reg__
.LVL7:
.LBB117:
.LBB118:
.LSM41:
.LSM42:
	out __SREG__,r18
.LSM43:
.LBE118:
.LBE117:
.LBE112:
.LBE111:
.LSM44:
/* #APP */
 ;  102 "Arduino-joystick.c" 1
	sei
 ;  0 "" 2
.LVL8:
/* #NOAPP */
.L5:
.LSM45:
	ldi r24,lo8(Joystick_HID_Interface)
	ldi r25,hi8(Joystick_HID_Interface)
	call HID_Device_USBTask
.LSM46:
	call USB_USBTask
	rjmp .L5
.LFE102:
	.size	main, .-main
	.section	.text.EVENT_USB_Device_ConfigurationChanged,"ax",@progbits
.global	EVENT_USB_Device_ConfigurationChanged
	.type	EVENT_USB_Device_ConfigurationChanged, @function
EVENT_USB_Device_ConfigurationChanged:
.LFB104:
.LSM47:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LSM48:
	ldi r24,lo8(Joystick_HID_Interface)
	ldi r25,hi8(Joystick_HID_Interface)
	call HID_Device_ConfigureEndpoints
.LVL9:
.LBB119:
.LBB120:
.LBB121:
.LSM49:
	ldi r30,lo8(226)
	ldi r31,hi8(226)
	ld r24,Z
	ori r24,lo8(4)
	st Z,r24
/* epilogue start */
.LBE121:
.LBE120:
.LBE119:
.LSM50:
	ret
.LFE104:
	.size	EVENT_USB_Device_ConfigurationChanged, .-EVENT_USB_Device_ConfigurationChanged
	.section	.text.EVENT_USB_Device_UnhandledControlRequest,"ax",@progbits
.global	EVENT_USB_Device_UnhandledControlRequest
	.type	EVENT_USB_Device_UnhandledControlRequest, @function
EVENT_USB_Device_UnhandledControlRequest:
.LFB105:
.LSM51:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LSM52:
	ldi r24,lo8(Joystick_HID_Interface)
	ldi r25,hi8(Joystick_HID_Interface)
	call HID_Device_ProcessControlRequest
/* epilogue start */
.LSM53:
	ret
.LFE105:
	.size	EVENT_USB_Device_UnhandledControlRequest, .-EVENT_USB_Device_UnhandledControlRequest
	.section	.text.EVENT_USB_Device_StartOfFrame,"ax",@progbits
.global	EVENT_USB_Device_StartOfFrame
	.type	EVENT_USB_Device_StartOfFrame, @function
EVENT_USB_Device_StartOfFrame:
.LFB106:
.LSM54:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LVL10:
.LBB122:
.LBB123:
.LSM55:
	lds r24,Joystick_HID_Interface+11
	lds r25,Joystick_HID_Interface+11+1
	sbiw r24,0
	breq .L8
.LSM56:
	sbiw r24,1
	sts Joystick_HID_Interface+11+1,r25
	sts Joystick_HID_Interface+11,r24
.L8:
	ret
.LBE123:
.LBE122:
.LFE106:
	.size	EVENT_USB_Device_StartOfFrame, .-EVENT_USB_Device_StartOfFrame
	.section	.text.CALLBACK_HID_Device_CreateHIDReport,"ax",@progbits
.global	CALLBACK_HID_Device_CreateHIDReport
	.type	CALLBACK_HID_Device_CreateHIDReport, @function
CALLBACK_HID_Device_CreateHIDReport:
.LFB107:
.LSM57:
.LVL11:
	push r14
	push r15
	push r16
	push r17
	push r29
	push r28
	rcall .
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 2 */
/* stack size = 8 */
.L__stack_usage = 8
	movw r14,r22
.LVL12:
.LBB124:
.LBB125:
.LBB126:
.LBB127:
.LSM58:
.LSM59:
	in r20,__SREG__
.LVL13:
.LBE127:
.LBE126:
.LBB128:
.LBB129:
.LSM60:
.LSM61:
/* #APP */
 ;  385 "../../../Public/LUFA110528/LUFA/Drivers/USB/../../Common/Common.h" 1
	cli
 ;  0 "" 2
.LSM62:
/* #NOAPP */
.LBE129:
.LBE128:
.LSM63:
	lds r24,USARTtoUSB_Buffer+9
	lds r25,USARTtoUSB_Buffer+9+1
.LVL14:
.LBB130:
.LBB131:
.LSM64:
.LSM65:
	out __SREG__,r20
.LSM66:
.LBE131:
.LBE130:
.LBE125:
.LBE124:
.LSM67:
	cpi r24,9
	cpc r25,__zero_reg__
	brlo .L11
.LVL15:
.LSM68:
	std Y+1,r18
	std Y+2,r19
	call RingBuffer_Remove.clone.1
.LVL16:
	movw r30,r14
	st Z,r24
.LSM69:
	ldi r24,lo8(8)
	ldi r25,hi8(8)
	movw r30,r16
	std Z+1,r25
	st Z,r24
.LVL17:
	ldd r18,Y+1
	ldd r19,Y+2
	mov r20,r18
	mov r21,r19
	movw r14,r20
.LVL18:
.LSM70:
	movw r16,r14
.LVL19:
	subi r16,lo8(-(8))
	sbci r17,hi8(-(8))
.LVL20:
.L12:
.LBB132:
.LSM71:
	call RingBuffer_Remove.clone.1
	movw r30,r14
	st Z+,r24
	movw r14,r30
.LSM72:
	cp r30,r16
	cpc r31,r17
	brne .L12
.L11:
.LBE132:
.LSM73:
	ldi r24,lo8(0)
/* epilogue start */
	pop __tmp_reg__
	pop __tmp_reg__
	pop r28
	pop r29
	pop r17
	pop r16
	pop r15
	pop r14
	ret
.LFE107:
	.size	CALLBACK_HID_Device_CreateHIDReport, .-CALLBACK_HID_Device_CreateHIDReport
	.section	.text.CALLBACK_HID_Device_ProcessHIDReport,"ax",@progbits
.global	CALLBACK_HID_Device_ProcessHIDReport
	.type	CALLBACK_HID_Device_ProcessHIDReport, @function
CALLBACK_HID_Device_ProcessHIDReport:
.LFB108:
.LSM74:
.LVL21:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
/* epilogue start */
.LSM75:
	ret
.LFE108:
	.size	CALLBACK_HID_Device_ProcessHIDReport, .-CALLBACK_HID_Device_ProcessHIDReport
	.section	.text.__vector_23,"ax",@progbits
.global	__vector_23
	.type	__vector_23, @function
__vector_23:
.LFB109:
.LSM76:
	push __zero_reg__
	push r0
	in r0,__SREG__
	push r0
	clr __zero_reg__
	push r18
	push r19
	push r20
	push r24
	push r25
	push r26
	push r27
	push r30
	push r31
/* prologue: Signal */
/* frame size = 0 */
/* stack size = 12 */
.L__stack_usage = 12
.LSM77:
	lds r20,206
.LVL22:
.LSM78:
	in r24,62-0x20
	cpi r24,lo8(4)
	brne .L15
.LVL23:
.LBB133:
.LBB134:
.LBB135:
.LBB136:
.LBB137:
.LBB138:
.LSM79:
.LSM80:
	in r24,__SREG__
.LBE138:
.LBE137:
.LBB139:
.LBB140:
.LSM81:
.LSM82:
/* #APP */
 ;  385 "../../../Public/LUFA110528/LUFA/Drivers/USB/../../Common/Common.h" 1
	cli
 ;  0 "" 2
.LSM83:
/* #NOAPP */
.LBE140:
.LBE139:
.LSM84:
	lds r18,USARTtoUSB_Buffer+9
	lds r19,USARTtoUSB_Buffer+9+1
.LVL24:
.LBB141:
.LBB142:
.LSM85:
.LSM86:
	out __SREG__,r24
.LSM87:
.LBE142:
.LBE141:
.LBE136:
.LBE135:
.LSM88:
	lds r24,USARTtoUSB_Buffer+8
.LVL25:
	ldi r25,lo8(0)
.LBE134:
.LBE133:
.LSM89:
	cp r18,r24
	cpc r19,r25
	breq .L15
.LVL26:
.LBB143:
.LBB144:
.LSM90:
	ldi r30,lo8(USARTtoUSB_Buffer)
	ldi r31,hi8(USARTtoUSB_Buffer)
.LVL27:
.LSM91:
	ld r26,Z
	ldd r27,Z+1
	st X,r20
.LSM92:
	ld r24,Z
	ldd r25,Z+1
	adiw r24,1
	std Z+1,r25
	st Z,r24
	ldd r18,Z+6
	ldd r19,Z+7
	cp r24,r18
	cpc r25,r19
	brne .L17
.LSM93:
	ldd r24,Z+4
	ldd r25,Z+5
	std Z+1,r25
	st Z,r24
.L17:
.LBB145:
.LBB146:
.LSM94:
.LSM95:
	in r18,__SREG__
.LBE146:
.LBE145:
.LBB147:
.LBB148:
.LSM96:
.LSM97:
/* #APP */
 ;  385 "../../../Public/LUFA110528/LUFA/Drivers/USB/../../Common/Common.h" 1
	cli
 ;  0 "" 2
.LSM98:
/* #NOAPP */
.LBE148:
.LBE147:
.LSM99:
	ldd r24,Z+9
	ldd r25,Z+10
	adiw r24,1
	std Z+10,r25
	std Z+9,r24
.LVL28:
.LBB149:
.LBB150:
.LSM100:
.LSM101:
	out __SREG__,r18
.LSM102:
.LVL29:
.L15:
/* epilogue start */
.LBE150:
.LBE149:
.LBE144:
.LBE143:
.LSM103:
	pop r31
	pop r30
	pop r27
	pop r26
	pop r25
	pop r24
	pop r20
.LVL30:
	pop r19
	pop r18
	pop r0
	out __SREG__,r0
	pop r0
	pop __zero_reg__
	reti
.LFE109:
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
	.comm PrevJoystickHIDReportBuffer,8,1
	.comm USARTtoUSB_Buffer,11,1
	.comm BufferData,72,1
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
	.long	.LFB111
	.long	.LFE111-.LFB111
	.p2align	2
.LEFDE0:
.LSFDE2:
	.long	.LEFDE2-.LASFDE2
.LASFDE2:
	.long	.Lframe0
	.long	.LFB103
	.long	.LFE103-.LFB103
	.p2align	2
.LEFDE2:
.LSFDE4:
	.long	.LEFDE4-.LASFDE4
.LASFDE4:
	.long	.Lframe0
	.long	.LFB102
	.long	.LFE102-.LFB102
	.p2align	2
.LEFDE4:
.LSFDE6:
	.long	.LEFDE6-.LASFDE6
.LASFDE6:
	.long	.Lframe0
	.long	.LFB104
	.long	.LFE104-.LFB104
	.p2align	2
.LEFDE6:
.LSFDE8:
	.long	.LEFDE8-.LASFDE8
.LASFDE8:
	.long	.Lframe0
	.long	.LFB105
	.long	.LFE105-.LFB105
	.p2align	2
.LEFDE8:
.LSFDE10:
	.long	.LEFDE10-.LASFDE10
.LASFDE10:
	.long	.Lframe0
	.long	.LFB106
	.long	.LFE106-.LFB106
	.p2align	2
.LEFDE10:
.LSFDE12:
	.long	.LEFDE12-.LASFDE12
.LASFDE12:
	.long	.Lframe0
	.long	.LFB107
	.long	.LFE107-.LFB107
	.p2align	2
.LEFDE12:
.LSFDE14:
	.long	.LEFDE14-.LASFDE14
.LASFDE14:
	.long	.Lframe0
	.long	.LFB108
	.long	.LFE108-.LFB108
	.p2align	2
.LEFDE14:
.LSFDE16:
	.long	.LEFDE16-.LASFDE16
.LASFDE16:
	.long	.Lframe0
	.long	.LFB109
	.long	.LFE109-.LFB109
	.p2align	2
.LEFDE16:
	.text
.Letext0:
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.long	.LVL1
	.long	.LFE111
	.word	0x6
	.byte	0x6e
	.byte	0x93
	.uleb128 0x1
	.byte	0x6f
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST1:
	.long	.LVL6
	.long	.LVL8
	.word	0x6
	.byte	0x6e
	.byte	0x93
	.uleb128 0x1
	.byte	0x6f
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST2:
	.long	.LVL7
	.long	.LVL8
	.word	0x1
	.byte	0x62
	.long	0x0
	.long	0x0
.LLST3:
	.long	.LVL11
	.long	.LVL14
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST4:
	.long	.LVL11
	.long	.LVL15
	.word	0x6
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.long	.LVL15
	.long	.LVL18
	.word	0x6
	.byte	0x5e
	.byte	0x93
	.uleb128 0x1
	.byte	0x5f
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST5:
	.long	.LVL11
	.long	.LVL13
	.word	0x1
	.byte	0x64
	.long	0x0
	.long	0x0
.LLST6:
	.long	.LVL11
	.long	.LVL16-1
	.word	0x6
	.byte	0x62
	.byte	0x93
	.uleb128 0x1
	.byte	0x63
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST7:
	.long	.LVL11
	.long	.LVL19
	.word	0x6
	.byte	0x60
	.byte	0x93
	.uleb128 0x1
	.byte	0x61
	.byte	0x93
	.uleb128 0x1
	.long	.LVL19
	.long	.LVL20
	.word	0x6
	.byte	0x6e
	.byte	0x93
	.uleb128 0x1
	.byte	0x6f
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST8:
	.long	.LVL12
	.long	.LVL16-1
	.word	0x6
	.byte	0x62
	.byte	0x93
	.uleb128 0x1
	.byte	0x63
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST9:
	.long	.LVL14
	.long	.LVL16-1
	.word	0x5
	.byte	0x3
	.long	USARTtoUSB_Buffer+9
	.long	0x0
	.long	0x0
.LLST10:
	.long	.LVL14
	.long	.LVL16-1
	.word	0x1
	.byte	0x64
	.long	0x0
	.long	0x0
.LLST11:
	.long	.LVL17
	.long	.LVL20
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	0x0
	.long	0x0
.LLST12:
	.long	.LVL22
	.long	.LVL30
	.word	0x1
	.byte	0x64
	.long	0x0
	.long	0x0
.LLST13:
	.long	.LVL24
	.long	.LVL29
	.word	0x5
	.byte	0x3
	.long	USARTtoUSB_Buffer+9
	.long	0x0
	.long	0x0
.LLST14:
	.long	.LVL24
	.long	.LVL25
	.word	0x1
	.byte	0x68
	.long	.LVL25
	.long	.LVL29
	.word	0x2
	.byte	0x8
	.byte	0x5f
	.long	0x0
	.long	0x0
.LLST15:
	.long	.LVL26
	.long	.LVL29
	.word	0x1
	.byte	0x64
	.long	0x0
	.long	0x0
.LLST16:
	.long	.LVL27
	.long	.LVL29
	.word	0x6
	.byte	0x6e
	.byte	0x93
	.uleb128 0x1
	.byte	0x6f
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST17:
	.long	.LVL28
	.long	.LVL29
	.word	0x1
	.byte	0x62
	.long	0x0
	.long	0x0
	.section	.debug_info
	.long	0x9bb
	.word	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF86
	.byte	0x1
	.long	.LASF87
	.long	.LASF88
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
	.byte	0x7
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
	.byte	0x7
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
	.byte	0x7
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
	.uleb128 0x3
	.long	.LASF11
	.byte	0x2
	.byte	0x59
	.long	0x30
	.uleb128 0x5
	.long	.LASF17
	.byte	0x1
	.byte	0x5
	.byte	0x3c
	.long	0xc6
	.uleb128 0x6
	.long	.LASF12
	.sleb128 2
	.uleb128 0x6
	.long	.LASF13
	.sleb128 3
	.uleb128 0x6
	.long	.LASF14
	.sleb128 4
	.uleb128 0x6
	.long	.LASF15
	.sleb128 5
	.uleb128 0x6
	.long	.LASF16
	.sleb128 6
	.byte	0x0
	.uleb128 0x5
	.long	.LASF18
	.byte	0x1
	.byte	0x8
	.byte	0x49
	.long	0xf7
	.uleb128 0x6
	.long	.LASF19
	.sleb128 0
	.uleb128 0x6
	.long	.LASF20
	.sleb128 1
	.uleb128 0x6
	.long	.LASF21
	.sleb128 2
	.uleb128 0x6
	.long	.LASF22
	.sleb128 3
	.uleb128 0x6
	.long	.LASF23
	.sleb128 4
	.uleb128 0x6
	.long	.LASF24
	.sleb128 5
	.byte	0x0
	.uleb128 0x7
	.byte	0x2
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.long	.LASF25
	.uleb128 0x8
	.long	.LASF89
	.byte	0xe
	.byte	0x9
	.byte	0xf2
	.long	0x182
	.uleb128 0x9
	.string	"buf"
	.byte	0x9
	.byte	0xf3
	.long	0x182
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF26
	.byte	0x9
	.byte	0xf4
	.long	0x3b
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF27
	.byte	0x9
	.byte	0xf5
	.long	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.uleb128 0xb
	.long	.LASF28
	.byte	0x9
	.word	0x105
	.long	0x42
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xc
	.string	"len"
	.byte	0x9
	.word	0x106
	.long	0x42
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0xc
	.string	"put"
	.byte	0x9
	.word	0x107
	.long	0x1aa
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xc
	.string	"get"
	.byte	0x9
	.word	0x108
	.long	0x1c0
	.byte	0x2
	.byte	0x23
	.uleb128 0xa
	.uleb128 0xb
	.long	.LASF29
	.byte	0x9
	.word	0x109
	.long	0xf7
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.byte	0x0
	.uleb128 0xd
	.byte	0x2
	.long	0x188
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF30
	.uleb128 0xe
	.byte	0x1
	.long	0x42
	.long	0x1a4
	.uleb128 0xf
	.long	0x188
	.uleb128 0xf
	.long	0x1a4
	.byte	0x0
	.uleb128 0xd
	.byte	0x2
	.long	0x100
	.uleb128 0xd
	.byte	0x2
	.long	0x18f
	.uleb128 0xe
	.byte	0x1
	.long	0x42
	.long	0x1c0
	.uleb128 0xf
	.long	0x1a4
	.byte	0x0
	.uleb128 0xd
	.byte	0x2
	.long	0x1b0
	.uleb128 0x10
	.byte	0x8
	.byte	0x6
	.byte	0x54
	.long	0x223
	.uleb128 0xa
	.long	.LASF31
	.byte	0x6
	.byte	0x56
	.long	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF32
	.byte	0x6
	.byte	0x58
	.long	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF33
	.byte	0x6
	.byte	0x59
	.long	0x49
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF34
	.byte	0x6
	.byte	0x5a
	.long	0xf9
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xa
	.long	.LASF35
	.byte	0x6
	.byte	0x5c
	.long	0xf7
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0xa
	.long	.LASF36
	.byte	0x6
	.byte	0x68
	.long	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.byte	0x0
	.uleb128 0x10
	.byte	0x5
	.byte	0x6
	.byte	0x71
	.long	0x256
	.uleb128 0xa
	.long	.LASF37
	.byte	0x6
	.byte	0x73
	.long	0xf9
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF38
	.byte	0x6
	.byte	0x74
	.long	0x49
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.long	.LASF39
	.byte	0x6
	.byte	0x75
	.long	0x49
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0x10
	.byte	0xd
	.byte	0x6
	.byte	0x52
	.long	0x27b
	.uleb128 0xa
	.long	.LASF40
	.byte	0x6
	.byte	0x6e
	.long	0x27b
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.long	.LASF41
	.byte	0x6
	.byte	0x77
	.long	0x223
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0x0
	.uleb128 0x11
	.long	0x1c6
	.uleb128 0x3
	.long	.LASF42
	.byte	0x6
	.byte	0x7a
	.long	0x256
	.uleb128 0x12
	.long	0x30
	.long	0x29b
	.uleb128 0x13
	.long	0x54
	.byte	0x7
	.byte	0x0
	.uleb128 0x10
	.byte	0xb
	.byte	0x1
	.byte	0x69
	.long	0x2f7
	.uleb128 0x9
	.string	"In"
	.byte	0x1
	.byte	0x6b
	.long	0x2f7
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x9
	.string	"Out"
	.byte	0x1
	.byte	0x6c
	.long	0x2f7
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.long	.LASF43
	.byte	0x1
	.byte	0x6d
	.long	0x2f7
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x9
	.string	"End"
	.byte	0x1
	.byte	0x6e
	.long	0x2f7
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0xa
	.long	.LASF44
	.byte	0x1
	.byte	0x6f
	.long	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.long	.LASF45
	.byte	0x1
	.byte	0x70
	.long	0x49
	.byte	0x2
	.byte	0x23
	.uleb128 0x9
	.byte	0x0
	.uleb128 0xd
	.byte	0x2
	.long	0x30
	.uleb128 0x3
	.long	.LASF46
	.byte	0x1
	.byte	0x71
	.long	0x29b
	.uleb128 0x14
	.long	.LASF47
	.byte	0x5
	.byte	0x58
	.byte	0x1
	.byte	0x3
	.long	0x321
	.uleb128 0x15
	.long	.LASF49
	.byte	0x5
	.byte	0x58
	.long	0x321
	.byte	0x0
	.uleb128 0x11
	.long	0x30
	.uleb128 0x16
	.long	.LASF90
	.byte	0x2
	.word	0x13f
	.byte	0x1
	.long	0x90
	.byte	0x3
	.uleb128 0x17
	.long	.LASF58
	.byte	0x2
	.word	0x17c
	.byte	0x1
	.byte	0x3
	.uleb128 0x18
	.long	.LASF48
	.byte	0x2
	.word	0x155
	.byte	0x1
	.byte	0x3
	.long	0x359
	.uleb128 0x19
	.long	.LASF50
	.byte	0x2
	.word	0x155
	.long	0x359
	.byte	0x0
	.uleb128 0x11
	.long	0x90
	.uleb128 0x1a
	.long	.LASF62
	.byte	0x1
	.byte	0x9a
	.byte	0x1
	.long	0x49
	.byte	0x3
	.long	0x391
	.uleb128 0x15
	.long	.LASF51
	.byte	0x1
	.byte	0x9a
	.long	0x391
	.uleb128 0x1b
	.long	.LASF45
	.byte	0x1
	.byte	0x9c
	.long	0x49
	.uleb128 0x1b
	.long	.LASF52
	.byte	0x1
	.byte	0x9e
	.long	0x90
	.byte	0x0
	.uleb128 0x11
	.long	0x396
	.uleb128 0xd
	.byte	0x2
	.long	0x2fd
	.uleb128 0x14
	.long	.LASF53
	.byte	0x4
	.byte	0x89
	.byte	0x1
	.byte	0x3
	.long	0x3c0
	.uleb128 0x15
	.long	.LASF54
	.byte	0x4
	.byte	0x89
	.long	0x3c0
	.uleb128 0x15
	.long	.LASF55
	.byte	0x4
	.byte	0x8a
	.long	0x3c5
	.byte	0x0
	.uleb128 0x11
	.long	0x62
	.uleb128 0x11
	.long	0xf9
	.uleb128 0x14
	.long	.LASF56
	.byte	0x1
	.byte	0x7c
	.byte	0x1
	.byte	0x3
	.long	0x404
	.uleb128 0x15
	.long	.LASF51
	.byte	0x1
	.byte	0x7c
	.long	0x396
	.uleb128 0x15
	.long	.LASF57
	.byte	0x1
	.byte	0x7c
	.long	0x404
	.uleb128 0x15
	.long	.LASF44
	.byte	0x1
	.byte	0x7c
	.long	0x409
	.uleb128 0x1b
	.long	.LASF52
	.byte	0x1
	.byte	0x80
	.long	0x90
	.byte	0x0
	.uleb128 0x11
	.long	0x2f7
	.uleb128 0x11
	.long	0x49
	.uleb128 0x1c
	.long	.LASF59
	.byte	0xa
	.byte	0xa0
	.byte	0x1
	.byte	0x3
	.uleb128 0x14
	.long	.LASF60
	.byte	0x6
	.byte	0xc9
	.byte	0x1
	.byte	0x3
	.long	0x430
	.uleb128 0x15
	.long	.LASF61
	.byte	0x6
	.byte	0xc9
	.long	0x430
	.byte	0x0
	.uleb128 0x11
	.long	0x435
	.uleb128 0xd
	.byte	0x2
	.long	0x280
	.uleb128 0x1a
	.long	.LASF63
	.byte	0x1
	.byte	0xaf
	.byte	0x1
	.long	0xf9
	.byte	0x3
	.long	0x458
	.uleb128 0x15
	.long	.LASF51
	.byte	0x1
	.byte	0xaf
	.long	0x391
	.byte	0x0
	.uleb128 0x14
	.long	.LASF64
	.byte	0x1
	.byte	0xce
	.byte	0x1
	.byte	0x3
	.long	0x487
	.uleb128 0x15
	.long	.LASF51
	.byte	0x1
	.byte	0xce
	.long	0x396
	.uleb128 0x15
	.long	.LASF65
	.byte	0x1
	.byte	0xcf
	.long	0x321
	.uleb128 0x1b
	.long	.LASF52
	.byte	0x1
	.byte	0xd8
	.long	0x90
	.byte	0x0
	.uleb128 0x1a
	.long	.LASF66
	.byte	0x1
	.byte	0xea
	.byte	0x1
	.long	0x30
	.byte	0x3
	.long	0x4ba
	.uleb128 0x15
	.long	.LASF51
	.byte	0x1
	.byte	0xea
	.long	0x396
	.uleb128 0x1b
	.long	.LASF65
	.byte	0x1
	.byte	0xee
	.long	0x30
	.uleb128 0x1b
	.long	.LASF52
	.byte	0x1
	.byte	0xf3
	.long	0x90
	.byte	0x0
	.uleb128 0x1d
	.long	0x487
	.long	.LFB111
	.long	.LFE111
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 0
	.long	0x51f
	.uleb128 0x1e
	.long	0x4a3
	.byte	0x4
	.byte	0x8e
	.sleb128 2
	.byte	0x94
	.byte	0x2
	.uleb128 0x1e
	.long	0x4ae
	.byte	0x1
	.byte	0x69
	.uleb128 0x1f
	.long	0x498
	.long	.LLST0
	.uleb128 0x20
	.long	0x326
	.long	.LBB103
	.long	.LBE103
	.byte	0x1
	.byte	0xf3
	.uleb128 0x20
	.long	0x334
	.long	.LBB105
	.long	.LBE105
	.byte	0x1
	.byte	0xf4
	.uleb128 0x21
	.long	0x33e
	.long	.LBB107
	.long	.LBE107
	.byte	0x1
	.byte	0xf8
	.uleb128 0x22
	.long	0x34c
	.byte	0x1
	.byte	0x69
	.byte	0x0
	.byte	0x0
	.uleb128 0x23
	.byte	0x1
	.long	.LASF67
	.byte	0x3
	.byte	0x6f
	.byte	0x1
	.long	.LFB103
	.long	.LFE103
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 0
	.long	0x558
	.uleb128 0x21
	.long	0x39c
	.long	.LBB109
	.long	.LBE109
	.byte	0x3
	.byte	0x76
	.uleb128 0x24
	.long	0x3b4
	.byte	0x1
	.uleb128 0x25
	.long	0x3a9
	.long	0x1c200
	.byte	0x0
	.byte	0x0
	.uleb128 0x26
	.byte	0x1
	.long	.LASF70
	.byte	0x3
	.byte	0x60
	.byte	0x1
	.long	0x42
	.long	.LFB102
	.long	.LFE102
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 0
	.long	0x5e9
	.uleb128 0x21
	.long	0x3ca
	.long	.LBB111
	.long	.LBE111
	.byte	0x3
	.byte	0x64
	.uleb128 0x24
	.long	0x3ed
	.byte	0x48
	.uleb128 0x22
	.long	0x3e2
	.byte	0x6
	.byte	0x3
	.long	BufferData
	.byte	0x9f
	.uleb128 0x1f
	.long	0x3d7
	.long	.LLST1
	.uleb128 0x27
	.long	.LBB112
	.long	.LBE112
	.uleb128 0x1e
	.long	0x3f8
	.byte	0x1
	.byte	0x62
	.uleb128 0x20
	.long	0x326
	.long	.LBB113
	.long	.LBE113
	.byte	0x1
	.byte	0x80
	.uleb128 0x20
	.long	0x334
	.long	.LBB115
	.long	.LBE115
	.byte	0x1
	.byte	0x81
	.uleb128 0x21
	.long	0x33e
	.long	.LBB117
	.long	.LBE117
	.byte	0x1
	.byte	0x8a
	.uleb128 0x1f
	.long	0x34c
	.long	.LLST2
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x23
	.byte	0x1
	.long	.LASF68
	.byte	0x3
	.byte	0x7d
	.byte	0x1
	.long	.LFB104
	.long	.LFE104
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 0
	.long	0x629
	.uleb128 0x21
	.long	0x40e
	.long	.LBB119
	.long	.LBE119
	.byte	0x3
	.byte	0x81
	.uleb128 0x21
	.long	0x308
	.long	.LBB120
	.long	.LBE120
	.byte	0xa
	.byte	0xa2
	.uleb128 0x24
	.long	0x315
	.byte	0x5
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x28
	.byte	0x1
	.long	.LASF91
	.byte	0x3
	.byte	0x85
	.byte	0x1
	.long	.LFB105
	.long	.LFE105
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 0
	.uleb128 0x23
	.byte	0x1
	.long	.LASF69
	.byte	0x3
	.byte	0x8b
	.byte	0x1
	.long	.LFB106
	.long	.LFE106
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 0
	.long	0x674
	.uleb128 0x21
	.long	0x417
	.long	.LBB122
	.long	.LBE122
	.byte	0x3
	.byte	0x8d
	.uleb128 0x22
	.long	0x424
	.byte	0x6
	.byte	0x3
	.long	Joystick_HID_Interface
	.byte	0x9f
	.byte	0x0
	.byte	0x0
	.uleb128 0x26
	.byte	0x1
	.long	.LASF71
	.byte	0x3
	.byte	0x9a
	.byte	0x1
	.long	0xf9
	.long	.LFB107
	.long	.LFE107
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 0
	.long	0x768
	.uleb128 0x29
	.long	.LASF61
	.byte	0x3
	.byte	0x9b
	.long	0x430
	.long	.LLST3
	.uleb128 0x29
	.long	.LASF72
	.byte	0x3
	.byte	0x9c
	.long	0x404
	.long	.LLST4
	.uleb128 0x29
	.long	.LASF73
	.byte	0x3
	.byte	0x9d
	.long	0x321
	.long	.LLST5
	.uleb128 0x29
	.long	.LASF74
	.byte	0x3
	.byte	0x9e
	.long	0xf7
	.long	.LLST6
	.uleb128 0x29
	.long	.LASF75
	.byte	0x3
	.byte	0x9f
	.long	0x768
	.long	.LLST7
	.uleb128 0x2a
	.long	.LASF76
	.byte	0x3
	.byte	0xa1
	.long	0x2f7
	.long	.LLST8
	.uleb128 0x2b
	.long	0x35e
	.long	.LBB124
	.long	.LBE124
	.byte	0x3
	.byte	0xa3
	.long	0x750
	.uleb128 0x27
	.long	.LBB125
	.long	.LBE125
	.uleb128 0x2c
	.long	0x37a
	.long	.LLST9
	.uleb128 0x1e
	.long	0x385
	.byte	0x1
	.byte	0x64
	.uleb128 0x20
	.long	0x326
	.long	.LBB126
	.long	.LBE126
	.byte	0x1
	.byte	0x9e
	.uleb128 0x20
	.long	0x334
	.long	.LBB128
	.long	.LBE128
	.byte	0x1
	.byte	0x9f
	.uleb128 0x21
	.long	0x33e
	.long	.LBB130
	.long	.LBE130
	.byte	0x1
	.byte	0xa3
	.uleb128 0x1f
	.long	0x34c
	.long	.LLST10
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x27
	.long	.LBB132
	.long	.LBE132
	.uleb128 0x2d
	.string	"i"
	.byte	0x3
	.byte	0xa9
	.long	0x30
	.long	.LLST11
	.byte	0x0
	.byte	0x0
	.uleb128 0x11
	.long	0x76d
	.uleb128 0xd
	.byte	0x2
	.long	0x49
	.uleb128 0x23
	.byte	0x1
	.long	.LASF77
	.byte	0x3
	.byte	0xb7
	.byte	0x1
	.long	.LFB108
	.long	.LFE108
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 0
	.long	0x7dd
	.uleb128 0x2e
	.long	.LASF61
	.byte	0x3
	.byte	0xb7
	.long	0x430
	.byte	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.uleb128 0x2e
	.long	.LASF72
	.byte	0x3
	.byte	0xb8
	.long	0x321
	.byte	0x1
	.byte	0x66
	.uleb128 0x2e
	.long	.LASF73
	.byte	0x3
	.byte	0xb9
	.long	0x321
	.byte	0x1
	.byte	0x64
	.uleb128 0x2e
	.long	.LASF74
	.byte	0x3
	.byte	0xba
	.long	0x7dd
	.byte	0x6
	.byte	0x62
	.byte	0x93
	.uleb128 0x1
	.byte	0x63
	.byte	0x93
	.uleb128 0x1
	.uleb128 0x2e
	.long	.LASF75
	.byte	0x3
	.byte	0xbb
	.long	0x409
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
	.long	0x7e3
	.uleb128 0x2f
	.uleb128 0x23
	.byte	0x1
	.long	.LASF78
	.byte	0x3
	.byte	0xc3
	.byte	0x1
	.long	.LFB109
	.long	.LFE109
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 0
	.long	0x8f1
	.uleb128 0x2a
	.long	.LASF79
	.byte	0x3
	.byte	0xc5
	.long	0x30
	.long	.LLST12
	.uleb128 0x2b
	.long	0x43b
	.long	.LBB133
	.long	.LBE133
	.byte	0x3
	.byte	0xc8
	.long	0x886
	.uleb128 0x30
	.long	0x44c
	.uleb128 0x21
	.long	0x35e
	.long	.LBB135
	.long	.LBE135
	.byte	0x1
	.byte	0xb1
	.uleb128 0x27
	.long	.LBB136
	.long	.LBE136
	.uleb128 0x2c
	.long	0x37a
	.long	.LLST13
	.uleb128 0x1e
	.long	0x385
	.byte	0x1
	.byte	0x68
	.uleb128 0x20
	.long	0x326
	.long	.LBB137
	.long	.LBE137
	.byte	0x1
	.byte	0x9e
	.uleb128 0x20
	.long	0x334
	.long	.LBB139
	.long	.LBE139
	.byte	0x1
	.byte	0x9f
	.uleb128 0x21
	.long	0x33e
	.long	.LBB141
	.long	.LBE141
	.byte	0x1
	.byte	0xa3
	.uleb128 0x1f
	.long	0x34c
	.long	.LLST14
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x21
	.long	0x458
	.long	.LBB143
	.long	.LBE143
	.byte	0x3
	.byte	0xc9
	.uleb128 0x1f
	.long	0x470
	.long	.LLST15
	.uleb128 0x1f
	.long	0x465
	.long	.LLST16
	.uleb128 0x27
	.long	.LBB144
	.long	.LBE144
	.uleb128 0x1e
	.long	0x47b
	.byte	0x1
	.byte	0x62
	.uleb128 0x20
	.long	0x326
	.long	.LBB145
	.long	.LBE145
	.byte	0x1
	.byte	0xd8
	.uleb128 0x20
	.long	0x334
	.long	.LBB147
	.long	.LBE147
	.byte	0x1
	.byte	0xd9
	.uleb128 0x21
	.long	0x33e
	.long	.LBB149
	.long	.LBE149
	.byte	0x1
	.byte	0xdd
	.uleb128 0x1f
	.long	0x34c
	.long	.LLST17
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x12
	.long	0x1a4
	.long	0x8fc
	.uleb128 0x31
	.byte	0x0
	.uleb128 0x32
	.long	.LASF80
	.byte	0x9
	.word	0x195
	.long	0x8f1
	.byte	0x1
	.byte	0x1
	.uleb128 0x33
	.long	.LASF81
	.byte	0x4
	.byte	0x59
	.long	0x100
	.byte	0x1
	.byte	0x1
	.uleb128 0x33
	.long	.LASF82
	.byte	0x3
	.byte	0x41
	.long	0x28b
	.byte	0x1
	.byte	0x1
	.uleb128 0x33
	.long	.LASF83
	.byte	0x3
	.byte	0x47
	.long	0x280
	.byte	0x1
	.byte	0x1
	.uleb128 0x33
	.long	.LASF84
	.byte	0x3
	.byte	0x5a
	.long	0x2fd
	.byte	0x1
	.byte	0x1
	.uleb128 0x12
	.long	0x30
	.long	0x94e
	.uleb128 0x13
	.long	0x54
	.byte	0x47
	.byte	0x0
	.uleb128 0x33
	.long	.LASF85
	.byte	0x3
	.byte	0x5b
	.long	0x93e
	.byte	0x1
	.byte	0x1
	.uleb128 0x32
	.long	.LASF80
	.byte	0x9
	.word	0x195
	.long	0x8f1
	.byte	0x1
	.byte	0x1
	.uleb128 0x33
	.long	.LASF81
	.byte	0x4
	.byte	0x59
	.long	0x100
	.byte	0x1
	.byte	0x1
	.uleb128 0x34
	.long	.LASF82
	.byte	0x3
	.byte	0x41
	.long	0x28b
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	PrevJoystickHIDReportBuffer
	.uleb128 0x34
	.long	.LASF83
	.byte	0x3
	.byte	0x47
	.long	0x280
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	Joystick_HID_Interface
	.uleb128 0x34
	.long	.LASF84
	.byte	0x3
	.byte	0x5a
	.long	0x2fd
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	USARTtoUSB_Buffer
	.uleb128 0x34
	.long	.LASF85
	.byte	0x3
	.byte	0x5b
	.long	0x93e
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	BufferData
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
	.uleb128 0x2e
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
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
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
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
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x19
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x1a
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
	.uleb128 0x1b
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
	.uleb128 0x1c
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
	.uleb128 0x1d
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x31
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
	.uleb128 0x1e
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x1f
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
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
	.uleb128 0x24
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x25
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x26
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
	.uleb128 0x27
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x28
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
	.uleb128 0x29
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
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x2b
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
	.uleb128 0x2c
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x2d
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
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x21
	.byte	0x0
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
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0x0
	.byte	0x0
	.uleb128 0x33
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
	.long	0x9bf
	.long	0x51f
	.string	"SetupHardware"
	.long	0x558
	.string	"main"
	.long	0x5e9
	.string	"EVENT_USB_Device_ConfigurationChanged"
	.long	0x629
	.string	"EVENT_USB_Device_UnhandledControlRequest"
	.long	0x63e
	.string	"EVENT_USB_Device_StartOfFrame"
	.long	0x674
	.string	"CALLBACK_HID_Device_CreateHIDReport"
	.long	0x773
	.string	"CALLBACK_HID_Device_ProcessHIDReport"
	.long	0x7e4
	.string	"__vector_23"
	.long	0x976
	.string	"PrevJoystickHIDReportBuffer"
	.long	0x988
	.string	"Joystick_HID_Interface"
	.long	0x99a
	.string	"USARTtoUSB_Buffer"
	.long	0x9ac
	.string	"BufferData"
	.long	0x0
	.section	.debug_pubtypes,"",@progbits
	.long	0xab
	.word	0x2
	.long	.Ldebug_info0
	.long	0x9bf
	.long	0x30
	.string	"uint8_t"
	.long	0x49
	.string	"uint16_t"
	.long	0x62
	.string	"uint32_t"
	.long	0x90
	.string	"uint_reg_t"
	.long	0x9b
	.string	"USB_Interrupts_t"
	.long	0xc6
	.string	"USB_Device_States_t"
	.long	0x100
	.string	"__file"
	.long	0x280
	.string	"USB_ClassInfo_HID_Device_t"
	.long	0x2fd
	.string	"RingBuffer_t"
	.long	0x0
	.section	.debug_aranges,"",@progbits
	.long	0x5c
	.word	0x2
	.long	.Ldebug_info0
	.byte	0x4
	.byte	0x0
	.word	0x0
	.word	0x0
	.long	.LFB111
	.long	.LFE111-.LFB111
	.long	.LFB103
	.long	.LFE103-.LFB103
	.long	.LFB102
	.long	.LFE102-.LFB102
	.long	.LFB104
	.long	.LFE104-.LFB104
	.long	.LFB105
	.long	.LFE105-.LFB105
	.long	.LFB106
	.long	.LFE106-.LFB106
	.long	.LFB107
	.long	.LFE107-.LFB107
	.long	.LFB108
	.long	.LFE108-.LFB108
	.long	.LFB109
	.long	.LFE109-.LFB109
	.long	0x0
	.long	0x0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.long	.LFB111
	.long	.LFE111
	.long	.LFB103
	.long	.LFE103
	.long	.LFB102
	.long	.LFE102
	.long	.LFB104
	.long	.LFE104
	.long	.LFB105
	.long	.LFE105
	.long	.LFB106
	.long	.LFE106
	.long	.LFB107
	.long	.LFE107
	.long	.LFB108
	.long	.LFE108
	.long	.LFB109
	.long	.LFE109
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
	.ascii	"../../../Public/LUFA110528/LUFA/Drivers/Misc"
	.byte	0
	.ascii	"../../../Public/LUFA110528/LUFA/Drivers/Peripheral/AVR8"
	.byte	0
	.ascii	"../../../Public/LUFA110528/LUFA/Drivers/USB/../../Common"
	.byte	0
	.ascii	"../../../Public/LUFA110528/LUFA/Drivers/USB/Class/Device"
	.byte	0
	.ascii	"../../../Public/LUFA110528/LUFA/Drivers/USB/Core/AVR8/.."
	.byte	0
	.ascii	"../../../Public/LUFA110528/LUFA/Drivers/USB/Core/AVR8/../AVR"
	.ascii	"8"
	.byte	0
	.ascii	"/usr/local/lib/gcc/avr/4.5.3/../../../../avr/include"
	.byte	0
	.byte	0x0
	.string	"RingBuffer.h"
	.uleb128 0x1
	.uleb128 0x0
	.uleb128 0x0
	.string	"Common.h"
	.uleb128 0x3
	.uleb128 0x0
	.uleb128 0x0
	.string	"Arduino-joystick.c"
	.uleb128 0x0
	.uleb128 0x0
	.uleb128 0x0
	.string	"Serial_AVR8.h"
	.uleb128 0x2
	.uleb128 0x0
	.uleb128 0x0
	.string	"AVR8/USBInterrupt_AVR8.h"
	.uleb128 0x5
	.uleb128 0x0
	.uleb128 0x0
	.string	"HID.h"
	.uleb128 0x4
	.uleb128 0x0
	.uleb128 0x0
	.string	"stdint.h"
	.uleb128 0x7
	.uleb128 0x0
	.uleb128 0x0
	.string	"Device.h"
	.uleb128 0x5
	.uleb128 0x0
	.uleb128 0x0
	.string	"stdio.h"
	.uleb128 0x7
	.uleb128 0x0
	.uleb128 0x0
	.string	"AVR8/Device_AVR8.h"
	.uleb128 0x5
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
	.byte	0xfd
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM1
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM2
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM3
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM4
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM5
	.byte	0x4
	.uleb128 0x2
	.byte	0x64
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM6
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM7
	.byte	0x4e
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM8
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM9
	.byte	0x19
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM10
	.byte	0x4
	.uleb128 0x1
	.byte	0x3
	.sleb128 -144
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM11
	.byte	0x4
	.uleb128 0x2
	.byte	0x75
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM12
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM13
	.byte	0x1c
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM14
	.byte	0x4
	.uleb128 0x1
	.byte	0x3
	.sleb128 -103
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LFE111
	.byte	0x0
	.uleb128 0x1
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM15
	.byte	0x4
	.uleb128 0x3
	.byte	0x83
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM16
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM17
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM18
	.byte	0x4
	.uleb128 0x4
	.byte	0x2d
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM19
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM20
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM21
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM22
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM23
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM24
	.byte	0x4
	.uleb128 0x3
	.byte	0x3
	.sleb128 -28
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM25
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM26
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LFE103
	.byte	0x0
	.uleb128 0x1
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM27
	.byte	0x4
	.uleb128 0x3
	.byte	0x74
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM28
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM29
	.byte	0x4
	.uleb128 0x1
	.byte	0x30
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM30
	.byte	0x4
	.uleb128 0x2
	.byte	0xd7
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM31
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM32
	.byte	0x4e
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM33
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM34
	.byte	0x19
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM35
	.byte	0x4
	.uleb128 0x1
	.byte	0x3
	.sleb128 -259
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM36
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM37
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM38
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM39
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM40
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM41
	.byte	0x4
	.uleb128 0x2
	.byte	0xe3
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM42
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM43
	.byte	0x1c
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM44
	.byte	0x4
	.uleb128 0x3
	.byte	0x3
	.sleb128 -252
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM45
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM46
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LFE102
	.byte	0x0
	.uleb128 0x1
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM47
	.byte	0x4
	.uleb128 0x3
	.byte	0x91
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM48
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM49
	.byte	0x4
	.uleb128 0x5
	.byte	0x3
	.sleb128 -14
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM50
	.byte	0x4
	.uleb128 0x3
	.byte	0x25
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LFE104
	.byte	0x0
	.uleb128 0x1
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM51
	.byte	0x4
	.uleb128 0x3
	.byte	0x99
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM52
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM53
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LFE105
	.byte	0x0
	.uleb128 0x1
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM54
	.byte	0x4
	.uleb128 0x3
	.byte	0x9f
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM55
	.byte	0x4
	.uleb128 0x6
	.byte	0x53
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM56
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LFE106
	.byte	0x0
	.uleb128 0x1
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM57
	.byte	0x4
	.uleb128 0x3
	.byte	0xb3
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM58
	.byte	0x4
	.uleb128 0x2
	.byte	0xb5
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM59
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM60
	.byte	0x4e
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM61
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM62
	.byte	0x19
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM63
	.byte	0x4
	.uleb128 0x1
	.byte	0x3
	.sleb128 -229
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM64
	.byte	0x4
	.uleb128 0x2
	.byte	0xca
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM65
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM66
	.byte	0x1c
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM67
	.byte	0x4
	.uleb128 0x3
	.byte	0x3
	.sleb128 -191
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM68
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM69
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM70
	.byte	0x3
	.sleb128 -13
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM71
	.byte	0x24
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM72
	.byte	0x13
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM73
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LFE107
	.byte	0x0
	.uleb128 0x1
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM74
	.byte	0x4
	.uleb128 0x3
	.byte	0xcf
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM75
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LFE108
	.byte	0x0
	.uleb128 0x1
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM76
	.byte	0x4
	.uleb128 0x3
	.byte	0xd7
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM77
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM78
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM79
	.byte	0x4
	.uleb128 0x2
	.byte	0x8e
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM80
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM81
	.byte	0x4e
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM82
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM83
	.byte	0x19
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM84
	.byte	0x4
	.uleb128 0x1
	.byte	0x3
	.sleb128 -229
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM85
	.byte	0x4
	.uleb128 0x2
	.byte	0xca
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM86
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM87
	.byte	0x1c
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM88
	.byte	0x4
	.uleb128 0x1
	.byte	0x3
	.sleb128 -177
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM89
	.byte	0x4
	.uleb128 0x3
	.byte	0x2a
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM90
	.byte	0x4
	.uleb128 0x1
	.byte	0x1e
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM91
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM92
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM93
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM94
	.byte	0x4
	.uleb128 0x2
	.byte	0x7f
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM95
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM96
	.byte	0x4e
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM97
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM98
	.byte	0x19
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM99
	.byte	0x4
	.uleb128 0x1
	.byte	0x3
	.sleb128 -171
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM100
	.byte	0x4
	.uleb128 0x2
	.byte	0x90
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM101
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM102
	.byte	0x1c
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LSM103
	.byte	0x4
	.uleb128 0x3
	.byte	0x3
	.sleb128 -151
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LFE109
	.byte	0x0
	.uleb128 0x1
	.byte	0x1
.LELT0:
	.section	.debug_str,"MS",@progbits,1
.LASF44:
	.string	"Size"
.LASF50:
	.string	"GlobalIntState"
.LASF78:
	.string	"__vector_23"
.LASF42:
	.string	"USB_ClassInfo_HID_Device_t"
.LASF32:
	.string	"ReportINEndpointNumber"
.LASF41:
	.string	"State"
.LASF39:
	.string	"IdleMSRemaining"
.LASF88:
	.string	"/home/jas/atmega8u2/firmware/FourControllers_v1"
.LASF43:
	.string	"Start"
.LASF91:
	.string	"EVENT_USB_Device_UnhandledControlRequest"
.LASF11:
	.string	"uint_reg_t"
.LASF54:
	.string	"BaudRate"
.LASF70:
	.string	"main"
.LASF74:
	.string	"ReportData"
.LASF48:
	.string	"SetGlobalInterruptMask"
.LASF72:
	.string	"ReportID"
.LASF10:
	.string	"__unknown__"
.LASF19:
	.string	"DEVICE_STATE_Unattached"
.LASF57:
	.string	"DataPtr"
.LASF2:
	.string	"uint8_t"
.LASF71:
	.string	"CALLBACK_HID_Device_CreateHIDReport"
.LASF84:
	.string	"USARTtoUSB_Buffer"
.LASF61:
	.string	"HIDInterfaceInfo"
.LASF36:
	.string	"PrevReportINBufferSize"
.LASF52:
	.string	"CurrentGlobalInt"
.LASF8:
	.string	"long long int"
.LASF31:
	.string	"InterfaceNumber"
.LASF5:
	.string	"long int"
.LASF46:
	.string	"RingBuffer_t"
.LASF87:
	.string	"Arduino-joystick.c"
.LASF37:
	.string	"UsingReportProtocol"
.LASF33:
	.string	"ReportINEndpointSize"
.LASF65:
	.string	"Data"
.LASF40:
	.string	"Config"
.LASF55:
	.string	"DoubleSpeed"
.LASF27:
	.string	"flags"
.LASF60:
	.string	"HID_Device_MillisecondElapsed"
.LASF21:
	.string	"DEVICE_STATE_Default"
.LASF56:
	.string	"RingBuffer_InitBuffer"
.LASF1:
	.string	"unsigned char"
.LASF89:
	.string	"__file"
.LASF0:
	.string	"signed char"
.LASF83:
	.string	"Joystick_HID_Interface"
.LASF9:
	.string	"long long unsigned int"
.LASF6:
	.string	"uint32_t"
.LASF4:
	.string	"unsigned int"
.LASF3:
	.string	"uint16_t"
.LASF38:
	.string	"IdleCount"
.LASF63:
	.string	"RingBuffer_IsFull"
.LASF14:
	.string	"USB_INT_EORSTI"
.LASF35:
	.string	"PrevReportINBuffer"
.LASF26:
	.string	"unget"
.LASF45:
	.string	"Count"
.LASF15:
	.string	"USB_INT_SOFI"
.LASF62:
	.string	"RingBuffer_GetCount"
.LASF69:
	.string	"EVENT_USB_Device_StartOfFrame"
.LASF29:
	.string	"udata"
.LASF47:
	.string	"USB_INT_Enable"
.LASF30:
	.string	"char"
.LASF67:
	.string	"SetupHardware"
.LASF25:
	.string	"_Bool"
.LASF79:
	.string	"ReceivedByte"
.LASF16:
	.string	"USB_INT_RXSTPI"
.LASF75:
	.string	"ReportSize"
.LASF81:
	.string	"USARTSerialStream"
.LASF7:
	.string	"long unsigned int"
.LASF34:
	.string	"ReportINEndpointDoubleBank"
.LASF53:
	.string	"Serial_Init"
.LASF18:
	.string	"USB_Device_States_t"
.LASF49:
	.string	"Interrupt"
.LASF58:
	.string	"GlobalInterruptDisable"
.LASF28:
	.string	"size"
.LASF77:
	.string	"CALLBACK_HID_Device_ProcessHIDReport"
.LASF76:
	.string	"JoystickReport"
.LASF17:
	.string	"USB_Interrupts_t"
.LASF73:
	.string	"ReportType"
.LASF20:
	.string	"DEVICE_STATE_Powered"
.LASF80:
	.string	"__iob"
.LASF22:
	.string	"DEVICE_STATE_Addressed"
.LASF85:
	.string	"BufferData"
.LASF23:
	.string	"DEVICE_STATE_Configured"
.LASF64:
	.string	"RingBuffer_Insert"
.LASF90:
	.string	"GetGlobalInterruptMask"
.LASF82:
	.string	"PrevJoystickHIDReportBuffer"
.LASF12:
	.string	"USB_INT_WAKEUPI"
.LASF68:
	.string	"EVENT_USB_Device_ConfigurationChanged"
.LASF51:
	.string	"Buffer"
.LASF24:
	.string	"DEVICE_STATE_Suspended"
.LASF59:
	.string	"USB_Device_EnableSOFEvents"
.LASF13:
	.string	"USB_INT_SUSPI"
.LASF86:
	.string	"GNU C 4.5.3"
.LASF66:
	.string	"RingBuffer_Remove"
