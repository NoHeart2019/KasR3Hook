# KasR3Hook
应用程序Api日志程序
简介
使用 Intel 虚拟化特性实现应用层HOOK
1.排除Dll间函数调用
2.动态配置监控Api


配置 
监控Api设置：
		在配置文件Kas.config中添加系统dll路径和此dll对应的函数声明文件(一个dll对应一个函数声明文件)
	  	例子:
	  		DllName: C:\Windows\System32\Kernel32.dll HookApiFileName: Kernel32.Apiconfig  
				Kernel32.Apiconfig 放到config目录下.
				Kernel32.Apiconfig 此文件包含函数声明。
		Api声明
			解析参数类型 
			 基本类型: 
			 		INT32, INT64 
			 指针类型：
			 	PCHAR
			 	PWCHAR
				指针 : 带长度(Buffer, Length)   : PVOID , ParamterIndex  	//第ParameterIndex参数代表Buffer的长度 序号从1开始
  	 	  指针 ：不带长度(PCHAR/PWCHAR)   : PCHAR,PWCHAR....
  		  指针 + 固定长度(PLONG)          : PINT + N								//N (N/8)Bytes
			 例子 ：
			 	_Success_(return != 0)
				INT32
				WINAPI
				WriteFile(
				    _In_ ULONG_PTR hFile,
				    _In_reads_bytes_opt_(3) PVOID lpBuffer,
				    _In_ INT32 nNumberOfBytesToWrite,
				    _Out_opt_ PINT+32 lpNumberOfBytesWritten,
				    _Inout_opt_ ULONG_PTR lpOverlapped
				    );
				    
界面类型字段配置
	在KasApiType.config 中配置文件、进程、网络、注册表添加函列表以\r\n换行。
