; ModuleID = 'main'
; TODO(growly): Does commenting this out break anything?
; source_filename = "main"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%funcVal = type { void ()* }
%commonType = type { i8, i8, i8, i64, i32, %funcVal*, %funcVal*, i8*, { i8*, i64 }*, %uncommonType*, %commonType* }
%uncommonType = type { { i8*, i64 }*, { i8*, i64 }*, %methodSlice }
%methodSlice = type { %method*, i64, i64 }
%method = type { { i8*, i64 }*, { i8*, i64 }*, %commonType*, %commonType*, i8* }
%FIFO = type {}

@__go_type_hash_identity_descriptor = external global %funcVal
@__go_type_equal_identity_descriptor = external global %funcVal
@"init$guard" = internal global i1 false
@__go_tdn_int = linkonce_odr constant %commonType { i8 -126, i8 8, i8 8, i64 8, i32 50332917, %funcVal* @__go_type_hash_identity_descriptor, %funcVal* @__go_type_equal_identity_descriptor, i8* bitcast ([2 x i8*]* @"__go_tdn_int$gc" to i8*), { i8*, i64 }* @1, %uncommonType* @4, %commonType* null }
@0 = internal constant [3 x i8] c"int"
@1 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([3 x i8], [3 x i8]* @0, i32 0, i32 0), i64 3 }
@2 = internal constant [3 x i8] c"int"
@3 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([3 x i8], [3 x i8]* @2, i32 0, i32 0), i64 3 }
@4 = internal constant %uncommonType { { i8*, i64 }* @3, { i8*, i64 }* null, %methodSlice zeroinitializer }
@"__go_tdn_int$gc" = linkonce_odr constant [2 x i8*] [i8* inttoptr (i64 8 to i8*), i8* null]

declare void @pthread_create(i8*, i8*, i8*, i8*)

declare %FIFO* @fifo_malloc(i8 zeroext, i64)

declare i64 @fifo_read(%FIFO*)

declare void @pthread_exit(i8*)

declare void @fifo_write(%FIFO*, i64)

define void @main..import(i8* nest) #0 {
prologue:
  %1 = load i1, i1* @"init$guard"
  br i1 %1, label %2, label %3

.0.entry:                                         ; preds = %3
  ret void

; <label>:2:                                      ; preds = %prologue
  ret void

; <label>:3:                                      ; preds = %prologue
  store i1 true, i1* @"init$guard"
  call void @fmt..import(i8* undef)
  br label %.0.entry
}

declare void @fmt..import(i8*)

define void @main.main(i8* nest) #0 {
prologue:
  %slicelit = alloca [6 x i64]
  %1 = alloca { { i8*, i64, i64 }, %FIFO* }
  %thread_id = alloca i32
  %2 = alloca i32*
  %3 = alloca i32**
  %4 = alloca { { i8*, i64, i64 }, %FIFO* }
  %thread_id1 = alloca i32
  %5 = alloca i32*
  %6 = alloca i32**
  %7 = alloca i64
  %8 = alloca i64
  %varargs = alloca [3 x { i8*, i8* }]
  %9 = alloca i64
  %10 = alloca i64
  %11 = alloca i64
  %12 = alloca { i8*, i64, i64 }
  %13 = alloca { i64, { i8*, i8* } }
  br label %.0.entry

.0.entry:                                         ; preds = %prologue
  %14 = bitcast [6 x i64]* %slicelit to i8*
  %15 = bitcast i8* %14 to i64*
  %16 = getelementptr i64, i64* %15, i64 0
  %17 = bitcast i64* %16 to i8*
  %18 = bitcast i8* %17 to i64*
  store i64 7, i64* %18
  %19 = bitcast i8* %14 to i64*
  %20 = getelementptr i64, i64* %19, i64 1
  %21 = bitcast i64* %20 to i8*
  %22 = bitcast i8* %21 to i64*
  store i64 2, i64* %22
  %23 = bitcast i8* %14 to i64*
  %24 = getelementptr i64, i64* %23, i64 2
  %25 = bitcast i64* %24 to i8*
  %26 = bitcast i8* %25 to i64*
  store i64 8, i64* %26
  %27 = bitcast i8* %14 to i64*
  %28 = getelementptr i64, i64* %27, i64 3
  %29 = bitcast i64* %28 to i8*
  %30 = bitcast i8* %29 to i64*
  store i64 -9, i64* %30
  %31 = bitcast i8* %14 to i64*
  %32 = getelementptr i64, i64* %31, i64 4
  %33 = bitcast i64* %32 to i8*
  %34 = bitcast i8* %33 to i64*
  store i64 4, i64* %34
  %35 = bitcast i8* %14 to i64*
  %36 = getelementptr i64, i64* %35, i64 5
  %37 = bitcast i64* %36 to i8*
  %38 = bitcast i8* %37 to i64*
  store i64 0, i64* %38
  %39 = getelementptr inbounds i8, i8* %14, i64 0
  %40 = insertvalue { i8*, i64, i64 } undef, i8* %39, 0
  %41 = insertvalue { i8*, i64, i64 } %40, i64 6, 1
  %42 = insertvalue { i8*, i64, i64 } %41, i64 6, 2
  %43 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %44 = extractvalue { i8*, i64, i64 } %42, 1
  %45 = sdiv i64 %44, 2
  %46 = extractvalue { i8*, i64, i64 } %42, 0
  %47 = extractvalue { i8*, i64, i64 } %42, 1
  %48 = extractvalue { i8*, i64, i64 } %42, 2
  %49 = icmp slt i64 %45, 0
  %50 = icmp slt i64 %48, %45
  %51 = icmp slt i64 %48, %48
  %52 = or i1 false, %49
  %53 = or i1 %52, %50
  %54 = or i1 %53, %51
  br i1 %54, label %55, label %56, !prof !0

; <label>:55:                                     ; preds = %56, %.0.entry
  call void @pthread_exit(i8* null)
  unreachable

; <label>:56:                                     ; preds = %.0.entry
  %57 = sub i64 %45, 0
  %58 = sub i64 %48, 0
  %59 = getelementptr inbounds i8, i8* %46, i64 0
  %60 = insertvalue { i8*, i64, i64 } undef, i8* %59, 0
  %61 = insertvalue { i8*, i64, i64 } %60, i64 %57, 1
  %62 = insertvalue { i8*, i64, i64 } %61, i64 %58, 2
  %63 = getelementptr inbounds { { i8*, i64, i64 }, %FIFO* }, { { i8*, i64, i64 }, %FIFO* }* %1, i32 0, i32 0
  store { i8*, i64, i64 } %62, { i8*, i64, i64 }* %63
  %64 = getelementptr inbounds { { i8*, i64, i64 }, %FIFO* }, { { i8*, i64, i64 }, %FIFO* }* %1, i32 0, i32 1
  store %FIFO* %43, %FIFO** %64
  %65 = bitcast { { i8*, i64, i64 }, %FIFO* }* %1 to i8*
  store i32* %thread_id, i32** %2
  %66 = bitcast i32*** %3 to i8**
  store i32** %2, i32*** %3
  %67 = load i8*, i8** %66
  call void @pthread_create(i8* %67, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper to i8*), i8* %65)
  %68 = extractvalue { i8*, i64, i64 } %42, 1
  %69 = sdiv i64 %68, 2
  %70 = extractvalue { i8*, i64, i64 } %42, 0
  %71 = extractvalue { i8*, i64, i64 } %42, 1
  %72 = extractvalue { i8*, i64, i64 } %42, 2
  %73 = icmp slt i64 %69, 0
  %74 = icmp slt i64 %71, %69
  %75 = icmp slt i64 %72, %71
  %76 = icmp slt i64 %72, %72
  %77 = or i1 %73, %74
  %78 = or i1 %77, %75
  %79 = or i1 %78, %76
  br i1 %79, label %55, label %80, !prof !0

; <label>:80:                                     ; preds = %56
  %81 = sub i64 %71, %69
  %82 = sub i64 %72, %69
  %83 = mul i64 %69, 8
  %84 = getelementptr inbounds i8, i8* %70, i64 %83
  %85 = insertvalue { i8*, i64, i64 } undef, i8* %84, 0
  %86 = insertvalue { i8*, i64, i64 } %85, i64 %81, 1
  %87 = insertvalue { i8*, i64, i64 } %86, i64 %82, 2
  %88 = getelementptr inbounds { { i8*, i64, i64 }, %FIFO* }, { { i8*, i64, i64 }, %FIFO* }* %4, i32 0, i32 0
  store { i8*, i64, i64 } %87, { i8*, i64, i64 }* %88
  %89 = getelementptr inbounds { { i8*, i64, i64 }, %FIFO* }, { { i8*, i64, i64 }, %FIFO* }* %4, i32 0, i32 1
  store %FIFO* %43, %FIFO** %89
  %90 = bitcast { { i8*, i64, i64 }, %FIFO* }* %4 to i8*
  store i32* %thread_id1, i32** %5
  %91 = bitcast i32*** %6 to i8**
  store i32** %5, i32*** %6
  %92 = load i8*, i8** %91
  call void @pthread_create(i8* %92, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.1 to i8*), i8* %90)
  %93 = call i64 @fifo_read(%FIFO* %43)
  store i64 %93, i64* %7
  %94 = load i64, i64* %7
  %95 = call i64 @fifo_read(%FIFO* %43)
  store i64 %95, i64* %8
  %96 = load i64, i64* %8
  %97 = add i64 %94, %96
  %98 = bitcast [3 x { i8*, i8* }]* %varargs to i8*
  %99 = bitcast i8* %98 to { i8*, i8* }*
  %100 = getelementptr { i8*, i8* }, { i8*, i8* }* %99, i64 0
  %101 = bitcast { i8*, i8* }* %100 to i8*
  store i64 %94, i64* %9
  %102 = bitcast i64* %9 to i8*
  %103 = insertvalue { i8*, i8* } { i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_int, i32 0, i32 0), i8* undef }, i8* %102, 1
  %104 = bitcast i8* %101 to { i8*, i8* }*
  store { i8*, i8* } %103, { i8*, i8* }* %104
  %105 = bitcast i8* %98 to { i8*, i8* }*
  %106 = getelementptr { i8*, i8* }, { i8*, i8* }* %105, i64 1
  %107 = bitcast { i8*, i8* }* %106 to i8*
  store i64 %96, i64* %10
  %108 = bitcast i64* %10 to i8*
  %109 = insertvalue { i8*, i8* } { i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_int, i32 0, i32 0), i8* undef }, i8* %108, 1
  %110 = bitcast i8* %107 to { i8*, i8* }*
  store { i8*, i8* } %109, { i8*, i8* }* %110
  %111 = bitcast i8* %98 to { i8*, i8* }*
  %112 = getelementptr { i8*, i8* }, { i8*, i8* }* %111, i64 2
  %113 = bitcast { i8*, i8* }* %112 to i8*
  store i64 %97, i64* %11
  %114 = bitcast i64* %11 to i8*
  %115 = insertvalue { i8*, i8* } { i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_int, i32 0, i32 0), i8* undef }, i8* %114, 1
  %116 = bitcast i8* %113 to { i8*, i8* }*
  store { i8*, i8* } %115, { i8*, i8* }* %116
  %117 = getelementptr inbounds i8, i8* %98, i64 0
  %118 = insertvalue { i8*, i64, i64 } undef, i8* %117, 0
  %119 = insertvalue { i8*, i64, i64 } %118, i64 3, 1
  %120 = insertvalue { i8*, i64, i64 } %119, i64 3, 2
  store { i8*, i64, i64 } %120, { i8*, i64, i64 }* %12
  call void @fmt.Println({ i64, { i8*, i8* } }* sret %13, i8* nest undef, { i8*, i64, i64 }* byval %12)
  %121 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %13, i32 0, i32 0
  %122 = load i64, i64* %121
  %123 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %13, i32 0, i32 1
  %124 = load { i8*, i8* }, { i8*, i8* }* %123
  ret void
}

define internal void @5(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { { i8*, i64, i64 }, %FIFO* }*
  %2 = getelementptr inbounds { { i8*, i64, i64 }, %FIFO* }, { { i8*, i64, i64 }, %FIFO* }* %1, i32 0, i32 0
  %3 = load { i8*, i64, i64 }, { i8*, i64, i64 }* %2
  %4 = getelementptr inbounds { { i8*, i64, i64 }, %FIFO* }, { { i8*, i64, i64 }, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = alloca { i8*, i64, i64 }
  br label %entry

entry:                                            ; preds = %prologue
  store { i8*, i64, i64 } %3, { i8*, i64, i64 }* %6
  call void @main.sum(i8* nest undef, { i8*, i64, i64 }* byval %6, %FIFO* %5)
  ret void
}

define internal void @main.sum(i8* nest, { i8*, i64, i64 }* byval, %FIFO*) #0 {
prologue:
  %3 = load { i8*, i64, i64 }, { i8*, i64, i64 }* %1
  br label %.0.entry

.0.entry:                                         ; preds = %prologue
  %4 = extractvalue { i8*, i64, i64 } %3, 1
  br label %.1.rangeindex.loop

.1.rangeindex.loop:                               ; preds = %.2.rangeindex.body, %.0.entry
  %sum = phi i64 [ 0, %.0.entry ], [ %16, %.2.rangeindex.body ]
  %5 = phi i64 [ -1, %.0.entry ], [ %6, %.2.rangeindex.body ]
  %6 = add i64 %5, 1
  %7 = icmp slt i64 %6, %4
  %8 = zext i1 %7 to i8
  %9 = trunc i8 %8 to i1
  br i1 %9, label %.2.rangeindex.body, label %.3.rangeindex.done

.2.rangeindex.body:                               ; preds = %.1.rangeindex.loop
  %10 = extractvalue { i8*, i64, i64 } %3, 0
  %11 = bitcast i8* %10 to i64*
  %12 = getelementptr i64, i64* %11, i64 %6
  %13 = bitcast i64* %12 to i8*
  %14 = bitcast i8* %13 to i64*
  %15 = load i64, i64* %14
  %16 = add i64 %sum, %15
  br label %.1.rangeindex.loop

.3.rangeindex.done:                               ; preds = %.1.rangeindex.loop
  call void @fifo_write(%FIFO* %2, i64 %sum)
  ret void
}

define internal i8* @auto_pthread_wrapper(i8*) #0 {
entry:
  call void @5(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @6(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { { i8*, i64, i64 }, %FIFO* }*
  %2 = getelementptr inbounds { { i8*, i64, i64 }, %FIFO* }, { { i8*, i64, i64 }, %FIFO* }* %1, i32 0, i32 0
  %3 = load { i8*, i64, i64 }, { i8*, i64, i64 }* %2
  %4 = getelementptr inbounds { { i8*, i64, i64 }, %FIFO* }, { { i8*, i64, i64 }, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = alloca { i8*, i64, i64 }
  br label %entry

entry:                                            ; preds = %prologue
  store { i8*, i64, i64 } %3, { i8*, i64, i64 }* %6
  call void @main.sum(i8* nest undef, { i8*, i64, i64 }* byval %6, %FIFO* %5)
  ret void
}

define internal i8* @auto_pthread_wrapper.1(i8*) #0 {
entry:
  call void @6(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

declare void @fmt.Println({ i64, { i8*, i8* } }* sret, i8* nest, { i8*, i64, i64 }* byval)

define void @__go_init_main(i8*) #0 {
entry:
  ret void
}

attributes #0 = { "disable-tail-calls"="true" "split-stack" }

!0 = !{!"branch_weights", i32 1, i32 1000}
