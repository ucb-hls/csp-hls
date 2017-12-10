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
%sliceType = type { %commonType, %commonType* }
%FIFO = type {}

@__go_type_hash_string_descriptor = external global %funcVal
@__go_type_equal_string_descriptor = external global %funcVal
@__go_type_hash_identity_descriptor = external global %funcVal
@__go_type_equal_identity_descriptor = external global %funcVal
@__go_type_hash_error_descriptor = external global %funcVal
@__go_type_equal_error_descriptor = external global %funcVal
@main.input = internal global { i8*, i64, i64 } zeroinitializer
@0 = internal global [11 x i8] c"not sorted,"
@__go_tdn_string = linkonce_odr constant %commonType { i8 24, i8 8, i8 8, i64 16, i32 100666096, %funcVal* @__go_type_hash_string_descriptor, %funcVal* @__go_type_equal_string_descriptor, i8* bitcast ([4 x i8*]* @"__go_tdn_string$gc" to i8*), { i8*, i64 }* @14, %uncommonType* @17, %commonType* null }
@__go_tdn_int = linkonce_odr constant %commonType { i8 -126, i8 8, i8 8, i64 8, i32 50332917, %funcVal* @__go_type_hash_identity_descriptor, %funcVal* @__go_type_equal_identity_descriptor, i8* bitcast ([2 x i8*]* @"__go_tdn_int$gc" to i8*), { i8*, i64 }* @9, %uncommonType* @12, %commonType* null }
@1 = internal global [1 x i8] c">"
@2 = internal global [6 x i8] c"sorted"
@"init$guard" = internal global i1 false
@3 = internal global [9 x i8] c"# inputs:"
@__go_td_AN3_inte = linkonce_odr constant %sliceType { %commonType { i8 23, i8 8, i8 8, i64 24, i32 50332931, %funcVal* @__go_type_hash_error_descriptor, %funcVal* @__go_type_equal_error_descriptor, i8* bitcast ([5 x i8*]* @"__go_td_AN3_inte$gc" to i8*), { i8*, i64 }* @7, %uncommonType* null, %commonType* null }, %commonType* @__go_tdn_int }
@4 = internal global [4 x i8] c"%d, "
@5 = internal global [1 x i8] c"\0A"
@6 = internal constant [5 x i8] c"[]int"
@7 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @6, i32 0, i32 0), i64 5 }
@"__go_td_AN3_inte$gc" = linkonce_odr constant [5 x i8*] [i8* inttoptr (i64 24 to i8*), i8* inttoptr (i64 10 to i8*), i8* null, i8* bitcast ([2 x i8*]* @"__go_tdn_int$gc" to i8*), i8* null]
@8 = internal constant [3 x i8] c"int"
@9 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([3 x i8], [3 x i8]* @8, i32 0, i32 0), i64 3 }
@10 = internal constant [3 x i8] c"int"
@11 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([3 x i8], [3 x i8]* @10, i32 0, i32 0), i64 3 }
@12 = internal constant %uncommonType { { i8*, i64 }* @11, { i8*, i64 }* null, %methodSlice zeroinitializer }
@"__go_tdn_int$gc" = linkonce_odr constant [2 x i8*] [i8* inttoptr (i64 8 to i8*), i8* null]
@13 = internal constant [6 x i8] c"string"
@14 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @13, i32 0, i32 0), i64 6 }
@15 = internal constant [6 x i8] c"string"
@16 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @15, i32 0, i32 0), i64 6 }
@17 = internal constant %uncommonType { { i8*, i64 }* @16, { i8*, i64 }* null, %methodSlice zeroinitializer }
@"__go_tdn_string$gc" = linkonce_odr constant [4 x i8*] [i8* inttoptr (i64 16 to i8*), i8* inttoptr (i64 7 to i8*), i8* null, i8* null]

declare void @pthread_create(i8*, i8*, i8*, i8*)

declare void @__go_make_slice2({ i8*, i64, i64 }* sret, i8* nest, i8*, i64, i64)

declare %FIFO* @fifo_malloc(i8 zeroext, i64)

declare i64 @fifo_read(%FIFO*)

declare void @pthread_exit(i8*)

declare void @fifo_write(%FIFO*, i64)

define internal void @main.checkSort(i8* nest, { i8*, i64, i64 }* byval) #0 {
prologue:
  %varargs = alloca [4 x { i8*, i8* }]
  %2 = alloca { i8*, i64 }
  %3 = alloca i64
  %4 = alloca { i8*, i64 }
  %5 = alloca i64
  %6 = alloca { i8*, i64, i64 }
  %7 = alloca { i64, { i8*, i8* } }
  %varargs1 = alloca [1 x { i8*, i8* }]
  %8 = alloca { i8*, i64 }
  %9 = alloca { i8*, i64, i64 }
  %10 = alloca { i64, { i8*, i8* } }
  %arr = load { i8*, i64, i64 }, { i8*, i64, i64 }* %1
  br label %.0.entry

.0.entry:                                         ; preds = %prologue
  %11 = extractvalue { i8*, i64, i64 } %arr, 0
  %12 = bitcast i8* %11 to i64*
  %13 = getelementptr i64, i64* %12, i64 0
  %14 = bitcast i64* %13 to i8*
  %15 = bitcast i8* %14 to i64*
  %16 = load i64, i64* %15
  %17 = extractvalue { i8*, i64, i64 } %arr, 0
  %18 = extractvalue { i8*, i64, i64 } %arr, 1
  %19 = extractvalue { i8*, i64, i64 } %arr, 2
  %20 = icmp slt i64 %18, 1
  %21 = icmp slt i64 %19, %18
  %22 = icmp slt i64 %19, %19
  %23 = or i1 false, %20
  %24 = or i1 %23, %21
  %25 = or i1 %24, %22
  br i1 %25, label %88, label %89, !prof !0

.1.rangeindex.loop:                               ; preds = %.5.if.done, %89
  %y = phi i64 [ %16, %89 ], [ %36, %.5.if.done ]
  %26 = phi i64 [ -1, %89 ], [ %27, %.5.if.done ]
  %27 = add i64 %26, 1
  %28 = icmp slt i64 %27, %96
  %29 = zext i1 %28 to i8
  %30 = trunc i8 %29 to i1
  br i1 %30, label %.2.rangeindex.body, label %.3.rangeindex.done

.2.rangeindex.body:                               ; preds = %.1.rangeindex.loop
  %31 = extractvalue { i8*, i64, i64 } %95, 0
  %32 = bitcast i8* %31 to i64*
  %33 = getelementptr i64, i64* %32, i64 %27
  %34 = bitcast i64* %33 to i8*
  %35 = bitcast i8* %34 to i64*
  %36 = load i64, i64* %35
  %37 = icmp sgt i64 %y, %36
  %38 = zext i1 %37 to i8
  %39 = trunc i8 %38 to i1
  br i1 %39, label %.4.if.then, label %.5.if.done

.3.rangeindex.done:                               ; preds = %.1.rangeindex.loop
  %40 = bitcast [1 x { i8*, i8* }]* %varargs1 to i8*
  %41 = bitcast i8* %40 to { i8*, i8* }*
  %42 = getelementptr { i8*, i8* }, { i8*, i8* }* %41, i64 0
  %43 = bitcast { i8*, i8* }* %42 to i8*
  store { i8*, i64 } { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @2, i32 0, i32 0), i64 6 }, { i8*, i64 }* %8
  %44 = bitcast { i8*, i64 }* %8 to i8*
  %45 = insertvalue { i8*, i8* } { i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_string, i32 0, i32 0), i8* undef }, i8* %44, 1
  %46 = bitcast i8* %43 to { i8*, i8* }*
  store { i8*, i8* } %45, { i8*, i8* }* %46
  %47 = getelementptr inbounds i8, i8* %40, i64 0
  %48 = insertvalue { i8*, i64, i64 } undef, i8* %47, 0
  %49 = insertvalue { i8*, i64, i64 } %48, i64 1, 1
  %50 = insertvalue { i8*, i64, i64 } %49, i64 1, 2
  store { i8*, i64, i64 } %50, { i8*, i64, i64 }* %9
  call void @fmt.Println({ i64, { i8*, i8* } }* sret %10, i8* nest undef, { i8*, i64, i64 }* byval %9)
  %51 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %10, i32 0, i32 0
  %52 = load i64, i64* %51
  %53 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %10, i32 0, i32 1
  %54 = load { i8*, i8* }, { i8*, i8* }* %53
  ret void

.4.if.then:                                       ; preds = %.2.rangeindex.body
  %55 = bitcast [4 x { i8*, i8* }]* %varargs to i8*
  %56 = bitcast i8* %55 to { i8*, i8* }*
  %57 = getelementptr { i8*, i8* }, { i8*, i8* }* %56, i64 0
  %58 = bitcast { i8*, i8* }* %57 to i8*
  store { i8*, i64 } { i8* getelementptr inbounds ([11 x i8], [11 x i8]* @0, i32 0, i32 0), i64 11 }, { i8*, i64 }* %2
  %59 = bitcast { i8*, i64 }* %2 to i8*
  %60 = insertvalue { i8*, i8* } { i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_string, i32 0, i32 0), i8* undef }, i8* %59, 1
  %61 = bitcast i8* %58 to { i8*, i8* }*
  store { i8*, i8* } %60, { i8*, i8* }* %61
  %62 = bitcast i8* %55 to { i8*, i8* }*
  %63 = getelementptr { i8*, i8* }, { i8*, i8* }* %62, i64 1
  %64 = bitcast { i8*, i8* }* %63 to i8*
  store i64 %y, i64* %3
  %65 = bitcast i64* %3 to i8*
  %66 = insertvalue { i8*, i8* } { i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_int, i32 0, i32 0), i8* undef }, i8* %65, 1
  %67 = bitcast i8* %64 to { i8*, i8* }*
  store { i8*, i8* } %66, { i8*, i8* }* %67
  %68 = bitcast i8* %55 to { i8*, i8* }*
  %69 = getelementptr { i8*, i8* }, { i8*, i8* }* %68, i64 2
  %70 = bitcast { i8*, i8* }* %69 to i8*
  store { i8*, i64 } { i8* getelementptr inbounds ([1 x i8], [1 x i8]* @1, i32 0, i32 0), i64 1 }, { i8*, i64 }* %4
  %71 = bitcast { i8*, i64 }* %4 to i8*
  %72 = insertvalue { i8*, i8* } { i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_string, i32 0, i32 0), i8* undef }, i8* %71, 1
  %73 = bitcast i8* %70 to { i8*, i8* }*
  store { i8*, i8* } %72, { i8*, i8* }* %73
  %74 = bitcast i8* %55 to { i8*, i8* }*
  %75 = getelementptr { i8*, i8* }, { i8*, i8* }* %74, i64 3
  %76 = bitcast { i8*, i8* }* %75 to i8*
  store i64 %36, i64* %5
  %77 = bitcast i64* %5 to i8*
  %78 = insertvalue { i8*, i8* } { i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_int, i32 0, i32 0), i8* undef }, i8* %77, 1
  %79 = bitcast i8* %76 to { i8*, i8* }*
  store { i8*, i8* } %78, { i8*, i8* }* %79
  %80 = getelementptr inbounds i8, i8* %55, i64 0
  %81 = insertvalue { i8*, i64, i64 } undef, i8* %80, 0
  %82 = insertvalue { i8*, i64, i64 } %81, i64 4, 1
  %83 = insertvalue { i8*, i64, i64 } %82, i64 4, 2
  store { i8*, i64, i64 } %83, { i8*, i64, i64 }* %6
  call void @fmt.Println({ i64, { i8*, i8* } }* sret %7, i8* nest undef, { i8*, i64, i64 }* byval %6)
  %84 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %7, i32 0, i32 0
  %85 = load i64, i64* %84
  %86 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %7, i32 0, i32 1
  %87 = load { i8*, i8* }, { i8*, i8* }* %86
  ret void

.5.if.done:                                       ; preds = %.2.rangeindex.body
  br label %.1.rangeindex.loop

; <label>:88:                                     ; preds = %.0.entry
  call void @pthread_exit(i8* null)
  unreachable

; <label>:89:                                     ; preds = %.0.entry
  %90 = sub i64 %18, 1
  %91 = sub i64 %19, 1
  %92 = getelementptr inbounds i8, i8* %17, i64 8
  %93 = insertvalue { i8*, i64, i64 } undef, i8* %92, 0
  %94 = insertvalue { i8*, i64, i64 } %93, i64 %90, 1
  %95 = insertvalue { i8*, i64, i64 } %94, i64 %91, 2
  %96 = extractvalue { i8*, i64, i64 } %95, 1
  br label %.1.rangeindex.loop
}

declare void @fmt.Println({ i64, { i8*, i8* } }* sret, i8* nest, { i8*, i64, i64 }* byval)

define internal void @main.divide(i8* nest, %FIFO* %in, %FIFO* %out_left, %FIFO* %out_right) #0 {
prologue:
  %1 = alloca i64
  %2 = alloca i64
  br label %.0.entry

.0.entry:                                         ; preds = %prologue
  br label %.1.for.body

.1.for.body:                                      ; preds = %.2.for.post, %.0.entry
  %i = phi i64 [ 0, %.0.entry ], [ %8, %.2.for.post ]
  %r = phi i64 [ 0, %.0.entry ], [ %r1, %.2.for.post ]
  %3 = call i64 @fifo_read(%FIFO* %in)
  store i64 %3, i64* %1
  %4 = load i64, i64* %1
  %5 = icmp eq i64 %4, -1
  %6 = zext i1 %5 to i8
  %7 = trunc i8 %6 to i1
  br i1 %7, label %.3.if.then, label %.4.if.done

.2.for.post:                                      ; preds = %.4.if.done, %.3.if.then
  %r1 = phi i64 [ %r, %.3.if.then ], [ %10, %.4.if.done ]
  %8 = add i64 %i, 1
  br label %.1.for.body

.3.if.then:                                       ; preds = %.1.for.body
  call void @fifo_write(%FIFO* %out_left, i64 -1)
  call void @fifo_write(%FIFO* %out_right, i64 -1)
  br label %.2.for.post

.4.if.done:                                       ; preds = %.1.for.body
  %9 = call i64 @fifo_read(%FIFO* %in)
  store i64 %9, i64* %2
  %10 = load i64, i64* %2
  call void @fifo_write(%FIFO* %out_left, i64 %4)
  call void @fifo_write(%FIFO* %out_right, i64 %10)
  br label %.2.for.post
}

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
  br label %.0.entry
}

define internal void @main.load_values(i8* nest) #0 {
prologue:
  %slicelit = alloca [64 x i64]
  br label %.0.entry

.0.entry:                                         ; preds = %prologue
  %1 = bitcast [64 x i64]* %slicelit to i8*
  %2 = bitcast i8* %1 to i64*
  %3 = getelementptr i64, i64* %2, i64 0
  %4 = bitcast i64* %3 to i8*
  %5 = bitcast i8* %4 to i64*
  store i64 1235761368, i64* %5
  %6 = bitcast i8* %1 to i64*
  %7 = getelementptr i64, i64* %6, i64 1
  %8 = bitcast i64* %7 to i8*
  %9 = bitcast i8* %8 to i64*
  store i64 3734338523, i64* %9
  %10 = bitcast i8* %1 to i64*
  %11 = getelementptr i64, i64* %10, i64 2
  %12 = bitcast i64* %11 to i8*
  %13 = bitcast i8* %12 to i64*
  store i64 26045387, i64* %13
  %14 = bitcast i8* %1 to i64*
  %15 = getelementptr i64, i64* %14, i64 3
  %16 = bitcast i64* %15 to i8*
  %17 = bitcast i8* %16 to i64*
  store i64 3593626455, i64* %17
  %18 = bitcast i8* %1 to i64*
  %19 = getelementptr i64, i64* %18, i64 4
  %20 = bitcast i64* %19 to i8*
  %21 = bitcast i8* %20 to i64*
  store i64 2624025978, i64* %21
  %22 = bitcast i8* %1 to i64*
  %23 = getelementptr i64, i64* %22, i64 5
  %24 = bitcast i64* %23 to i8*
  %25 = bitcast i8* %24 to i64*
  store i64 1047314994, i64* %25
  %26 = bitcast i8* %1 to i64*
  %27 = getelementptr i64, i64* %26, i64 6
  %28 = bitcast i64* %27 to i8*
  %29 = bitcast i8* %28 to i64*
  store i64 249162010, i64* %29
  %30 = bitcast i8* %1 to i64*
  %31 = getelementptr i64, i64* %30, i64 7
  %32 = bitcast i64* %31 to i8*
  %33 = bitcast i8* %32 to i64*
  store i64 1136607568, i64* %33
  %34 = bitcast i8* %1 to i64*
  %35 = getelementptr i64, i64* %34, i64 8
  %36 = bitcast i64* %35 to i8*
  %37 = bitcast i8* %36 to i64*
  store i64 2697783015, i64* %37
  %38 = bitcast i8* %1 to i64*
  %39 = getelementptr i64, i64* %38, i64 9
  %40 = bitcast i64* %39 to i8*
  %41 = bitcast i8* %40 to i64*
  store i64 1028460327, i64* %41
  %42 = bitcast i8* %1 to i64*
  %43 = getelementptr i64, i64* %42, i64 10
  %44 = bitcast i64* %43 to i8*
  %45 = bitcast i8* %44 to i64*
  store i64 1604041314, i64* %45
  %46 = bitcast i8* %1 to i64*
  %47 = getelementptr i64, i64* %46, i64 11
  %48 = bitcast i64* %47 to i8*
  %49 = bitcast i8* %48 to i64*
  store i64 2395687063, i64* %49
  %50 = bitcast i8* %1 to i64*
  %51 = getelementptr i64, i64* %50, i64 12
  %52 = bitcast i64* %51 to i8*
  %53 = bitcast i8* %52 to i64*
  store i64 829816908, i64* %53
  %54 = bitcast i8* %1 to i64*
  %55 = getelementptr i64, i64* %54, i64 13
  %56 = bitcast i64* %55 to i8*
  %57 = bitcast i8* %56 to i64*
  store i64 3512856069, i64* %57
  %58 = bitcast i8* %1 to i64*
  %59 = getelementptr i64, i64* %58, i64 14
  %60 = bitcast i64* %59 to i8*
  %61 = bitcast i8* %60 to i64*
  store i64 872151033, i64* %61
  %62 = bitcast i8* %1 to i64*
  %63 = getelementptr i64, i64* %62, i64 15
  %64 = bitcast i64* %63 to i8*
  %65 = bitcast i8* %64 to i64*
  store i64 3564893569, i64* %65
  %66 = bitcast i8* %1 to i64*
  %67 = getelementptr i64, i64* %66, i64 16
  %68 = bitcast i64* %67 to i8*
  %69 = bitcast i8* %68 to i64*
  store i64 1883155559, i64* %69
  %70 = bitcast i8* %1 to i64*
  %71 = getelementptr i64, i64* %70, i64 17
  %72 = bitcast i64* %71 to i8*
  %73 = bitcast i8* %72 to i64*
  store i64 3926769788, i64* %73
  %74 = bitcast i8* %1 to i64*
  %75 = getelementptr i64, i64* %74, i64 18
  %76 = bitcast i64* %75 to i8*
  %77 = bitcast i8* %76 to i64*
  store i64 2300858727, i64* %77
  %78 = bitcast i8* %1 to i64*
  %79 = getelementptr i64, i64* %78, i64 19
  %80 = bitcast i64* %79 to i8*
  %81 = bitcast i8* %80 to i64*
  store i64 908258304, i64* %81
  %82 = bitcast i8* %1 to i64*
  %83 = getelementptr i64, i64* %82, i64 20
  %84 = bitcast i64* %83 to i8*
  %85 = bitcast i8* %84 to i64*
  store i64 2594954262, i64* %85
  %86 = bitcast i8* %1 to i64*
  %87 = getelementptr i64, i64* %86, i64 21
  %88 = bitcast i64* %87 to i8*
  %89 = bitcast i8* %88 to i64*
  store i64 3269837735, i64* %89
  %90 = bitcast i8* %1 to i64*
  %91 = getelementptr i64, i64* %90, i64 22
  %92 = bitcast i64* %91 to i8*
  %93 = bitcast i8* %92 to i64*
  store i64 1013565733, i64* %93
  %94 = bitcast i8* %1 to i64*
  %95 = getelementptr i64, i64* %94, i64 23
  %96 = bitcast i64* %95 to i8*
  %97 = bitcast i8* %96 to i64*
  store i64 2928781266, i64* %97
  %98 = bitcast i8* %1 to i64*
  %99 = getelementptr i64, i64* %98, i64 24
  %100 = bitcast i64* %99 to i8*
  %101 = bitcast i8* %100 to i64*
  store i64 3062120167, i64* %101
  %102 = bitcast i8* %1 to i64*
  %103 = getelementptr i64, i64* %102, i64 25
  %104 = bitcast i64* %103 to i8*
  %105 = bitcast i8* %104 to i64*
  store i64 1225708050, i64* %105
  %106 = bitcast i8* %1 to i64*
  %107 = getelementptr i64, i64* %106, i64 26
  %108 = bitcast i64* %107 to i8*
  %109 = bitcast i8* %108 to i64*
  store i64 3767424270, i64* %109
  %110 = bitcast i8* %1 to i64*
  %111 = getelementptr i64, i64* %110, i64 27
  %112 = bitcast i64* %111 to i8*
  %113 = bitcast i8* %112 to i64*
  store i64 3199502442, i64* %113
  %114 = bitcast i8* %1 to i64*
  %115 = getelementptr i64, i64* %114, i64 28
  %116 = bitcast i64* %115 to i8*
  %117 = bitcast i8* %116 to i64*
  store i64 1702651580, i64* %117
  %118 = bitcast i8* %1 to i64*
  %119 = getelementptr i64, i64* %118, i64 29
  %120 = bitcast i64* %119 to i8*
  %121 = bitcast i8* %120 to i64*
  store i64 952209131, i64* %121
  %122 = bitcast i8* %1 to i64*
  %123 = getelementptr i64, i64* %122, i64 30
  %124 = bitcast i64* %123 to i8*
  %125 = bitcast i8* %124 to i64*
  store i64 250265838, i64* %125
  %126 = bitcast i8* %1 to i64*
  %127 = getelementptr i64, i64* %126, i64 31
  %128 = bitcast i64* %127 to i8*
  %129 = bitcast i8* %128 to i64*
  store i64 1684768425, i64* %129
  %130 = bitcast i8* %1 to i64*
  %131 = getelementptr i64, i64* %130, i64 32
  %132 = bitcast i64* %131 to i8*
  %133 = bitcast i8* %132 to i64*
  store i64 213668974, i64* %133
  %134 = bitcast i8* %1 to i64*
  %135 = getelementptr i64, i64* %134, i64 33
  %136 = bitcast i64* %135 to i8*
  %137 = bitcast i8* %136 to i64*
  store i64 337964090, i64* %137
  %138 = bitcast i8* %1 to i64*
  %139 = getelementptr i64, i64* %138, i64 34
  %140 = bitcast i64* %139 to i8*
  %141 = bitcast i8* %140 to i64*
  store i64 2474628599, i64* %141
  %142 = bitcast i8* %1 to i64*
  %143 = getelementptr i64, i64* %142, i64 35
  %144 = bitcast i64* %143 to i8*
  %145 = bitcast i8* %144 to i64*
  store i64 827888263, i64* %145
  %146 = bitcast i8* %1 to i64*
  %147 = getelementptr i64, i64* %146, i64 36
  %148 = bitcast i64* %147 to i8*
  %149 = bitcast i8* %148 to i64*
  store i64 990764384, i64* %149
  %150 = bitcast i8* %1 to i64*
  %151 = getelementptr i64, i64* %150, i64 37
  %152 = bitcast i64* %151 to i8*
  %153 = bitcast i8* %152 to i64*
  store i64 2482066059, i64* %153
  %154 = bitcast i8* %1 to i64*
  %155 = getelementptr i64, i64* %154, i64 38
  %156 = bitcast i64* %155 to i8*
  %157 = bitcast i8* %156 to i64*
  store i64 1616513204, i64* %157
  %158 = bitcast i8* %1 to i64*
  %159 = getelementptr i64, i64* %158, i64 39
  %160 = bitcast i64* %159 to i8*
  %161 = bitcast i8* %160 to i64*
  store i64 1241153464, i64* %161
  %162 = bitcast i8* %1 to i64*
  %163 = getelementptr i64, i64* %162, i64 40
  %164 = bitcast i64* %163 to i8*
  %165 = bitcast i8* %164 to i64*
  store i64 2325506692, i64* %165
  %166 = bitcast i8* %1 to i64*
  %167 = getelementptr i64, i64* %166, i64 41
  %168 = bitcast i64* %167 to i8*
  %169 = bitcast i8* %168 to i64*
  store i64 3336413292, i64* %169
  %170 = bitcast i8* %1 to i64*
  %171 = getelementptr i64, i64* %170, i64 42
  %172 = bitcast i64* %171 to i8*
  %173 = bitcast i8* %172 to i64*
  store i64 1743884936, i64* %173
  %174 = bitcast i8* %1 to i64*
  %175 = getelementptr i64, i64* %174, i64 43
  %176 = bitcast i64* %175 to i8*
  %177 = bitcast i8* %176 to i64*
  store i64 3527008682, i64* %177
  %178 = bitcast i8* %1 to i64*
  %179 = getelementptr i64, i64* %178, i64 44
  %180 = bitcast i64* %179 to i8*
  %181 = bitcast i8* %180 to i64*
  store i64 857170, i64* %181
  %182 = bitcast i8* %1 to i64*
  %183 = getelementptr i64, i64* %182, i64 45
  %184 = bitcast i64* %183 to i8*
  %185 = bitcast i8* %184 to i64*
  store i64 2924828567, i64* %185
  %186 = bitcast i8* %1 to i64*
  %187 = getelementptr i64, i64* %186, i64 46
  %188 = bitcast i64* %187 to i8*
  %189 = bitcast i8* %188 to i64*
  store i64 688309556, i64* %189
  %190 = bitcast i8* %1 to i64*
  %191 = getelementptr i64, i64* %190, i64 47
  %192 = bitcast i64* %191 to i8*
  %193 = bitcast i8* %192 to i64*
  store i64 859484738, i64* %193
  %194 = bitcast i8* %1 to i64*
  %195 = getelementptr i64, i64* %194, i64 48
  %196 = bitcast i64* %195 to i8*
  %197 = bitcast i8* %196 to i64*
  store i64 2971824392, i64* %197
  %198 = bitcast i8* %1 to i64*
  %199 = getelementptr i64, i64* %198, i64 49
  %200 = bitcast i64* %199 to i8*
  %201 = bitcast i8* %200 to i64*
  store i64 1720950776, i64* %201
  %202 = bitcast i8* %1 to i64*
  %203 = getelementptr i64, i64* %202, i64 50
  %204 = bitcast i64* %203 to i8*
  %205 = bitcast i8* %204 to i64*
  store i64 3104896070, i64* %205
  %206 = bitcast i8* %1 to i64*
  %207 = getelementptr i64, i64* %206, i64 51
  %208 = bitcast i64* %207 to i8*
  %209 = bitcast i8* %208 to i64*
  store i64 156691467, i64* %209
  %210 = bitcast i8* %1 to i64*
  %211 = getelementptr i64, i64* %210, i64 52
  %212 = bitcast i64* %211 to i8*
  %213 = bitcast i8* %212 to i64*
  store i64 2344632603, i64* %213
  %214 = bitcast i8* %1 to i64*
  %215 = getelementptr i64, i64* %214, i64 53
  %216 = bitcast i64* %215 to i8*
  %217 = bitcast i8* %216 to i64*
  store i64 3741896403, i64* %217
  %218 = bitcast i8* %1 to i64*
  %219 = getelementptr i64, i64* %218, i64 54
  %220 = bitcast i64* %219 to i8*
  %221 = bitcast i8* %220 to i64*
  store i64 188579560, i64* %221
  %222 = bitcast i8* %1 to i64*
  %223 = getelementptr i64, i64* %222, i64 55
  %224 = bitcast i64* %223 to i8*
  %225 = bitcast i8* %224 to i64*
  store i64 334829707, i64* %225
  %226 = bitcast i8* %1 to i64*
  %227 = getelementptr i64, i64* %226, i64 56
  %228 = bitcast i64* %227 to i8*
  %229 = bitcast i8* %228 to i64*
  store i64 1129787860, i64* %229
  %230 = bitcast i8* %1 to i64*
  %231 = getelementptr i64, i64* %230, i64 57
  %232 = bitcast i64* %231 to i8*
  %233 = bitcast i8* %232 to i64*
  store i64 955246496, i64* %233
  %234 = bitcast i8* %1 to i64*
  %235 = getelementptr i64, i64* %234, i64 58
  %236 = bitcast i64* %235 to i8*
  %237 = bitcast i8* %236 to i64*
  store i64 2431486451, i64* %237
  %238 = bitcast i8* %1 to i64*
  %239 = getelementptr i64, i64* %238, i64 59
  %240 = bitcast i64* %239 to i8*
  %241 = bitcast i8* %240 to i64*
  store i64 2981583155, i64* %241
  %242 = bitcast i8* %1 to i64*
  %243 = getelementptr i64, i64* %242, i64 60
  %244 = bitcast i64* %243 to i8*
  %245 = bitcast i8* %244 to i64*
  store i64 2651437058, i64* %245
  %246 = bitcast i8* %1 to i64*
  %247 = getelementptr i64, i64* %246, i64 61
  %248 = bitcast i64* %247 to i8*
  %249 = bitcast i8* %248 to i64*
  store i64 3687511230, i64* %249
  %250 = bitcast i8* %1 to i64*
  %251 = getelementptr i64, i64* %250, i64 62
  %252 = bitcast i64* %251 to i8*
  %253 = bitcast i8* %252 to i64*
  store i64 2273517397, i64* %253
  %254 = bitcast i8* %1 to i64*
  %255 = getelementptr i64, i64* %254, i64 63
  %256 = bitcast i64* %255 to i8*
  %257 = bitcast i8* %256 to i64*
  store i64 3025290067, i64* %257
  %258 = getelementptr inbounds i8, i8* %1, i64 0
  %259 = insertvalue { i8*, i64, i64 } undef, i8* %258, 0
  %260 = insertvalue { i8*, i64, i64 } %259, i64 64, 1
  %261 = insertvalue { i8*, i64, i64 } %260, i64 64, 2
  store { i8*, i64, i64 } %261, { i8*, i64, i64 }* @main.input
  ret void
}

define void @main.main(i8* nest) #0 {
prologue:
  %1 = alloca { i8*, i64, i64 }
  %2 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id = alloca i32
  %3 = alloca i32*
  %4 = alloca i32**
  %5 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id1 = alloca i32
  %6 = alloca i32*
  %7 = alloca i32**
  %8 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id2 = alloca i32
  %9 = alloca i32*
  %10 = alloca i32**
  %11 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id3 = alloca i32
  %12 = alloca i32*
  %13 = alloca i32**
  %14 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id4 = alloca i32
  %15 = alloca i32*
  %16 = alloca i32**
  %17 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id5 = alloca i32
  %18 = alloca i32*
  %19 = alloca i32**
  %20 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id6 = alloca i32
  %21 = alloca i32*
  %22 = alloca i32**
  %23 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id7 = alloca i32
  %24 = alloca i32*
  %25 = alloca i32**
  %26 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id8 = alloca i32
  %27 = alloca i32*
  %28 = alloca i32**
  %29 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id9 = alloca i32
  %30 = alloca i32*
  %31 = alloca i32**
  %32 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id10 = alloca i32
  %33 = alloca i32*
  %34 = alloca i32**
  %35 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id11 = alloca i32
  %36 = alloca i32*
  %37 = alloca i32**
  %38 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id12 = alloca i32
  %39 = alloca i32*
  %40 = alloca i32**
  %41 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id13 = alloca i32
  %42 = alloca i32*
  %43 = alloca i32**
  %44 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id14 = alloca i32
  %45 = alloca i32*
  %46 = alloca i32**
  %47 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id15 = alloca i32
  %48 = alloca i32*
  %49 = alloca i32**
  %50 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id16 = alloca i32
  %51 = alloca i32*
  %52 = alloca i32**
  %53 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id17 = alloca i32
  %54 = alloca i32*
  %55 = alloca i32**
  %56 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id18 = alloca i32
  %57 = alloca i32*
  %58 = alloca i32**
  %59 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id19 = alloca i32
  %60 = alloca i32*
  %61 = alloca i32**
  %62 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id20 = alloca i32
  %63 = alloca i32*
  %64 = alloca i32**
  %65 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id21 = alloca i32
  %66 = alloca i32*
  %67 = alloca i32**
  %68 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id22 = alloca i32
  %69 = alloca i32*
  %70 = alloca i32**
  %71 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id23 = alloca i32
  %72 = alloca i32*
  %73 = alloca i32**
  %74 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id24 = alloca i32
  %75 = alloca i32*
  %76 = alloca i32**
  %77 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id25 = alloca i32
  %78 = alloca i32*
  %79 = alloca i32**
  %80 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id26 = alloca i32
  %81 = alloca i32*
  %82 = alloca i32**
  %83 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id27 = alloca i32
  %84 = alloca i32*
  %85 = alloca i32**
  %86 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id28 = alloca i32
  %87 = alloca i32*
  %88 = alloca i32**
  %89 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id29 = alloca i32
  %90 = alloca i32*
  %91 = alloca i32**
  %92 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id30 = alloca i32
  %93 = alloca i32*
  %94 = alloca i32**
  %95 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id31 = alloca i32
  %96 = alloca i32*
  %97 = alloca i32**
  %98 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id32 = alloca i32
  %99 = alloca i32*
  %100 = alloca i32**
  %101 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id33 = alloca i32
  %102 = alloca i32*
  %103 = alloca i32**
  %104 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id34 = alloca i32
  %105 = alloca i32*
  %106 = alloca i32**
  %107 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id35 = alloca i32
  %108 = alloca i32*
  %109 = alloca i32**
  %110 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id36 = alloca i32
  %111 = alloca i32*
  %112 = alloca i32**
  %113 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id37 = alloca i32
  %114 = alloca i32*
  %115 = alloca i32**
  %116 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id38 = alloca i32
  %117 = alloca i32*
  %118 = alloca i32**
  %119 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id39 = alloca i32
  %120 = alloca i32*
  %121 = alloca i32**
  %122 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id40 = alloca i32
  %123 = alloca i32*
  %124 = alloca i32**
  %125 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id41 = alloca i32
  %126 = alloca i32*
  %127 = alloca i32**
  %128 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id42 = alloca i32
  %129 = alloca i32*
  %130 = alloca i32**
  %131 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id43 = alloca i32
  %132 = alloca i32*
  %133 = alloca i32**
  %134 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id44 = alloca i32
  %135 = alloca i32*
  %136 = alloca i32**
  %137 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id45 = alloca i32
  %138 = alloca i32*
  %139 = alloca i32**
  %140 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id46 = alloca i32
  %141 = alloca i32*
  %142 = alloca i32**
  %143 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id47 = alloca i32
  %144 = alloca i32*
  %145 = alloca i32**
  %146 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id48 = alloca i32
  %147 = alloca i32*
  %148 = alloca i32**
  %149 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id49 = alloca i32
  %150 = alloca i32*
  %151 = alloca i32**
  %152 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id50 = alloca i32
  %153 = alloca i32*
  %154 = alloca i32**
  %155 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id51 = alloca i32
  %156 = alloca i32*
  %157 = alloca i32**
  %158 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id52 = alloca i32
  %159 = alloca i32*
  %160 = alloca i32**
  %161 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id53 = alloca i32
  %162 = alloca i32*
  %163 = alloca i32**
  %164 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id54 = alloca i32
  %165 = alloca i32*
  %166 = alloca i32**
  %167 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id55 = alloca i32
  %168 = alloca i32*
  %169 = alloca i32**
  %170 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id56 = alloca i32
  %171 = alloca i32*
  %172 = alloca i32**
  %173 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id57 = alloca i32
  %174 = alloca i32*
  %175 = alloca i32**
  %176 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id58 = alloca i32
  %177 = alloca i32*
  %178 = alloca i32**
  %179 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id59 = alloca i32
  %180 = alloca i32*
  %181 = alloca i32**
  %182 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id60 = alloca i32
  %183 = alloca i32*
  %184 = alloca i32**
  %185 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id61 = alloca i32
  %186 = alloca i32*
  %187 = alloca i32**
  %188 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id62 = alloca i32
  %189 = alloca i32*
  %190 = alloca i32**
  %191 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id63 = alloca i32
  %192 = alloca i32*
  %193 = alloca i32**
  %194 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id64 = alloca i32
  %195 = alloca i32*
  %196 = alloca i32**
  %197 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id65 = alloca i32
  %198 = alloca i32*
  %199 = alloca i32**
  %200 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id66 = alloca i32
  %201 = alloca i32*
  %202 = alloca i32**
  %203 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id67 = alloca i32
  %204 = alloca i32*
  %205 = alloca i32**
  %206 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id68 = alloca i32
  %207 = alloca i32*
  %208 = alloca i32**
  %209 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id69 = alloca i32
  %210 = alloca i32*
  %211 = alloca i32**
  %212 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id70 = alloca i32
  %213 = alloca i32*
  %214 = alloca i32**
  %215 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id71 = alloca i32
  %216 = alloca i32*
  %217 = alloca i32**
  %218 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id72 = alloca i32
  %219 = alloca i32*
  %220 = alloca i32**
  %221 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id73 = alloca i32
  %222 = alloca i32*
  %223 = alloca i32**
  %224 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id74 = alloca i32
  %225 = alloca i32*
  %226 = alloca i32**
  %227 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id75 = alloca i32
  %228 = alloca i32*
  %229 = alloca i32**
  %230 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id76 = alloca i32
  %231 = alloca i32*
  %232 = alloca i32**
  %233 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id77 = alloca i32
  %234 = alloca i32*
  %235 = alloca i32**
  %236 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id78 = alloca i32
  %237 = alloca i32*
  %238 = alloca i32**
  %239 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id79 = alloca i32
  %240 = alloca i32*
  %241 = alloca i32**
  %242 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id80 = alloca i32
  %243 = alloca i32*
  %244 = alloca i32**
  %245 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id81 = alloca i32
  %246 = alloca i32*
  %247 = alloca i32**
  %248 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id82 = alloca i32
  %249 = alloca i32*
  %250 = alloca i32**
  %251 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id83 = alloca i32
  %252 = alloca i32*
  %253 = alloca i32**
  %254 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id84 = alloca i32
  %255 = alloca i32*
  %256 = alloca i32**
  %257 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id85 = alloca i32
  %258 = alloca i32*
  %259 = alloca i32**
  %260 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id86 = alloca i32
  %261 = alloca i32*
  %262 = alloca i32**
  %263 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id87 = alloca i32
  %264 = alloca i32*
  %265 = alloca i32**
  %266 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id88 = alloca i32
  %267 = alloca i32*
  %268 = alloca i32**
  %269 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id89 = alloca i32
  %270 = alloca i32*
  %271 = alloca i32**
  %272 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id90 = alloca i32
  %273 = alloca i32*
  %274 = alloca i32**
  %275 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id91 = alloca i32
  %276 = alloca i32*
  %277 = alloca i32**
  %278 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id92 = alloca i32
  %279 = alloca i32*
  %280 = alloca i32**
  %281 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id93 = alloca i32
  %282 = alloca i32*
  %283 = alloca i32**
  %284 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id94 = alloca i32
  %285 = alloca i32*
  %286 = alloca i32**
  %287 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id95 = alloca i32
  %288 = alloca i32*
  %289 = alloca i32**
  %290 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id96 = alloca i32
  %291 = alloca i32*
  %292 = alloca i32**
  %293 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id97 = alloca i32
  %294 = alloca i32*
  %295 = alloca i32**
  %296 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id98 = alloca i32
  %297 = alloca i32*
  %298 = alloca i32**
  %299 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id99 = alloca i32
  %300 = alloca i32*
  %301 = alloca i32**
  %302 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id100 = alloca i32
  %303 = alloca i32*
  %304 = alloca i32**
  %305 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id101 = alloca i32
  %306 = alloca i32*
  %307 = alloca i32**
  %308 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id102 = alloca i32
  %309 = alloca i32*
  %310 = alloca i32**
  %311 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id103 = alloca i32
  %312 = alloca i32*
  %313 = alloca i32**
  %314 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id104 = alloca i32
  %315 = alloca i32*
  %316 = alloca i32**
  %317 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id105 = alloca i32
  %318 = alloca i32*
  %319 = alloca i32**
  %320 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id106 = alloca i32
  %321 = alloca i32*
  %322 = alloca i32**
  %323 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id107 = alloca i32
  %324 = alloca i32*
  %325 = alloca i32**
  %326 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id108 = alloca i32
  %327 = alloca i32*
  %328 = alloca i32**
  %329 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id109 = alloca i32
  %330 = alloca i32*
  %331 = alloca i32**
  %332 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id110 = alloca i32
  %333 = alloca i32*
  %334 = alloca i32**
  %335 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id111 = alloca i32
  %336 = alloca i32*
  %337 = alloca i32**
  %338 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id112 = alloca i32
  %339 = alloca i32*
  %340 = alloca i32**
  %341 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id113 = alloca i32
  %342 = alloca i32*
  %343 = alloca i32**
  %344 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id114 = alloca i32
  %345 = alloca i32*
  %346 = alloca i32**
  %347 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id115 = alloca i32
  %348 = alloca i32*
  %349 = alloca i32**
  %350 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id116 = alloca i32
  %351 = alloca i32*
  %352 = alloca i32**
  %353 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id117 = alloca i32
  %354 = alloca i32*
  %355 = alloca i32**
  %356 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id118 = alloca i32
  %357 = alloca i32*
  %358 = alloca i32**
  %359 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id119 = alloca i32
  %360 = alloca i32*
  %361 = alloca i32**
  %362 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id120 = alloca i32
  %363 = alloca i32*
  %364 = alloca i32**
  %365 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id121 = alloca i32
  %366 = alloca i32*
  %367 = alloca i32**
  %368 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id122 = alloca i32
  %369 = alloca i32*
  %370 = alloca i32**
  %371 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id123 = alloca i32
  %372 = alloca i32*
  %373 = alloca i32**
  %374 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id124 = alloca i32
  %375 = alloca i32*
  %376 = alloca i32**
  %377 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id125 = alloca i32
  %378 = alloca i32*
  %379 = alloca i32**
  %varargs = alloca [2 x { i8*, i8* }]
  %380 = alloca { i8*, i64 }
  %381 = alloca i64
  %382 = alloca { i8*, i64, i64 }
  %383 = alloca { i64, { i8*, i8* } }
  %384 = alloca { i8*, i64, i64 }
  %385 = alloca i64
  %varargs126 = alloca [1 x { i8*, i8* }]
  %386 = alloca i64
  %387 = alloca { i8*, i64 }
  %388 = alloca { i8*, i64, i64 }
  %389 = alloca { i64, { i8*, i8* } }
  %390 = alloca { i8*, i64 }
  %391 = alloca { i8*, i64, i64 }
  %392 = alloca { i64, { i8*, i8* } }
  %393 = alloca { i8*, i64, i64 }
  br label %.0.entry

.0.entry:                                         ; preds = %prologue
  call void @main.load_values(i8* nest undef)
  %394 = load { i8*, i64, i64 }, { i8*, i64, i64 }* @main.input
  store { i8*, i64, i64 } %394, { i8*, i64, i64 }* %1
  call void @main.checkSort(i8* nest undef, { i8*, i64, i64 }* byval %1)
  %395 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %396 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %397 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %398 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %399 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %400 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %401 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %402 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %403 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %404 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %405 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %406 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %407 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %408 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %409 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %410 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %411 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %412 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %413 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %414 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %415 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %416 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %417 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %418 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %419 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %420 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %421 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %422 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %423 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %424 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %425 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %426 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %427 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %428 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %429 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %430 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %431 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %432 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %433 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %434 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %435 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %436 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %437 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %438 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %439 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %440 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %441 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %442 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %443 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %444 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %445 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %446 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %447 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %448 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %449 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %450 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %451 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %452 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %453 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %454 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %455 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %456 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %457 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %458 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %459 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %460 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %461 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %462 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %463 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %464 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %465 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %466 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %467 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %468 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %469 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %470 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %471 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %472 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %473 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %474 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %475 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %476 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %477 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %478 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %479 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %480 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %481 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %482 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %483 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %484 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %485 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %486 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %487 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %488 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %489 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %490 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %491 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %492 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %493 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %494 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %495 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %496 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %497 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %498 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %499 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %500 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %501 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %502 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %503 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %504 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %505 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %506 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %507 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %508 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %509 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %510 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %511 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %512 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %513 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %514 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %515 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %516 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %517 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %518 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %519 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %520 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %521 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %522 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %2, i32 0, i32 0
  store %FIFO* %395, %FIFO** %522
  %523 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %2, i32 0, i32 1
  store %FIFO* %396, %FIFO** %523
  %524 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %2, i32 0, i32 2
  store %FIFO* %397, %FIFO** %524
  %525 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %2 to i8*
  store i32* %thread_id, i32** %3
  %526 = bitcast i32*** %4 to i8**
  store i32** %3, i32*** %4
  %527 = load i8*, i8** %526
  call void @pthread_create(i8* %527, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper to i8*), i8* %525)
  %528 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %5, i32 0, i32 0
  store %FIFO* %396, %FIFO** %528
  %529 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %5, i32 0, i32 1
  store %FIFO* %398, %FIFO** %529
  %530 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %5, i32 0, i32 2
  store %FIFO* %399, %FIFO** %530
  %531 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %5 to i8*
  store i32* %thread_id1, i32** %6
  %532 = bitcast i32*** %7 to i8**
  store i32** %6, i32*** %7
  %533 = load i8*, i8** %532
  call void @pthread_create(i8* %533, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.1 to i8*), i8* %531)
  %534 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %8, i32 0, i32 0
  store %FIFO* %397, %FIFO** %534
  %535 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %8, i32 0, i32 1
  store %FIFO* %400, %FIFO** %535
  %536 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %8, i32 0, i32 2
  store %FIFO* %401, %FIFO** %536
  %537 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %8 to i8*
  store i32* %thread_id2, i32** %9
  %538 = bitcast i32*** %10 to i8**
  store i32** %9, i32*** %10
  %539 = load i8*, i8** %538
  call void @pthread_create(i8* %539, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.2 to i8*), i8* %537)
  %540 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %11, i32 0, i32 0
  store %FIFO* %398, %FIFO** %540
  %541 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %11, i32 0, i32 1
  store %FIFO* %402, %FIFO** %541
  %542 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %11, i32 0, i32 2
  store %FIFO* %403, %FIFO** %542
  %543 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %11 to i8*
  store i32* %thread_id3, i32** %12
  %544 = bitcast i32*** %13 to i8**
  store i32** %12, i32*** %13
  %545 = load i8*, i8** %544
  call void @pthread_create(i8* %545, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.3 to i8*), i8* %543)
  %546 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %14, i32 0, i32 0
  store %FIFO* %399, %FIFO** %546
  %547 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %14, i32 0, i32 1
  store %FIFO* %404, %FIFO** %547
  %548 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %14, i32 0, i32 2
  store %FIFO* %405, %FIFO** %548
  %549 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %14 to i8*
  store i32* %thread_id4, i32** %15
  %550 = bitcast i32*** %16 to i8**
  store i32** %15, i32*** %16
  %551 = load i8*, i8** %550
  call void @pthread_create(i8* %551, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.4 to i8*), i8* %549)
  %552 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %17, i32 0, i32 0
  store %FIFO* %400, %FIFO** %552
  %553 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %17, i32 0, i32 1
  store %FIFO* %406, %FIFO** %553
  %554 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %17, i32 0, i32 2
  store %FIFO* %407, %FIFO** %554
  %555 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %17 to i8*
  store i32* %thread_id5, i32** %18
  %556 = bitcast i32*** %19 to i8**
  store i32** %18, i32*** %19
  %557 = load i8*, i8** %556
  call void @pthread_create(i8* %557, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.5 to i8*), i8* %555)
  %558 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %20, i32 0, i32 0
  store %FIFO* %401, %FIFO** %558
  %559 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %20, i32 0, i32 1
  store %FIFO* %408, %FIFO** %559
  %560 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %20, i32 0, i32 2
  store %FIFO* %409, %FIFO** %560
  %561 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %20 to i8*
  store i32* %thread_id6, i32** %21
  %562 = bitcast i32*** %22 to i8**
  store i32** %21, i32*** %22
  %563 = load i8*, i8** %562
  call void @pthread_create(i8* %563, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.6 to i8*), i8* %561)
  %564 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %23, i32 0, i32 0
  store %FIFO* %402, %FIFO** %564
  %565 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %23, i32 0, i32 1
  store %FIFO* %410, %FIFO** %565
  %566 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %23, i32 0, i32 2
  store %FIFO* %411, %FIFO** %566
  %567 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %23 to i8*
  store i32* %thread_id7, i32** %24
  %568 = bitcast i32*** %25 to i8**
  store i32** %24, i32*** %25
  %569 = load i8*, i8** %568
  call void @pthread_create(i8* %569, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.7 to i8*), i8* %567)
  %570 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %26, i32 0, i32 0
  store %FIFO* %403, %FIFO** %570
  %571 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %26, i32 0, i32 1
  store %FIFO* %412, %FIFO** %571
  %572 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %26, i32 0, i32 2
  store %FIFO* %413, %FIFO** %572
  %573 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %26 to i8*
  store i32* %thread_id8, i32** %27
  %574 = bitcast i32*** %28 to i8**
  store i32** %27, i32*** %28
  %575 = load i8*, i8** %574
  call void @pthread_create(i8* %575, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.8 to i8*), i8* %573)
  %576 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %29, i32 0, i32 0
  store %FIFO* %404, %FIFO** %576
  %577 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %29, i32 0, i32 1
  store %FIFO* %414, %FIFO** %577
  %578 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %29, i32 0, i32 2
  store %FIFO* %415, %FIFO** %578
  %579 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %29 to i8*
  store i32* %thread_id9, i32** %30
  %580 = bitcast i32*** %31 to i8**
  store i32** %30, i32*** %31
  %581 = load i8*, i8** %580
  call void @pthread_create(i8* %581, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.9 to i8*), i8* %579)
  %582 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %32, i32 0, i32 0
  store %FIFO* %405, %FIFO** %582
  %583 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %32, i32 0, i32 1
  store %FIFO* %416, %FIFO** %583
  %584 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %32, i32 0, i32 2
  store %FIFO* %417, %FIFO** %584
  %585 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %32 to i8*
  store i32* %thread_id10, i32** %33
  %586 = bitcast i32*** %34 to i8**
  store i32** %33, i32*** %34
  %587 = load i8*, i8** %586
  call void @pthread_create(i8* %587, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.10 to i8*), i8* %585)
  %588 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %35, i32 0, i32 0
  store %FIFO* %406, %FIFO** %588
  %589 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %35, i32 0, i32 1
  store %FIFO* %418, %FIFO** %589
  %590 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %35, i32 0, i32 2
  store %FIFO* %419, %FIFO** %590
  %591 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %35 to i8*
  store i32* %thread_id11, i32** %36
  %592 = bitcast i32*** %37 to i8**
  store i32** %36, i32*** %37
  %593 = load i8*, i8** %592
  call void @pthread_create(i8* %593, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.11 to i8*), i8* %591)
  %594 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %38, i32 0, i32 0
  store %FIFO* %407, %FIFO** %594
  %595 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %38, i32 0, i32 1
  store %FIFO* %420, %FIFO** %595
  %596 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %38, i32 0, i32 2
  store %FIFO* %421, %FIFO** %596
  %597 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %38 to i8*
  store i32* %thread_id12, i32** %39
  %598 = bitcast i32*** %40 to i8**
  store i32** %39, i32*** %40
  %599 = load i8*, i8** %598
  call void @pthread_create(i8* %599, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.12 to i8*), i8* %597)
  %600 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %41, i32 0, i32 0
  store %FIFO* %408, %FIFO** %600
  %601 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %41, i32 0, i32 1
  store %FIFO* %422, %FIFO** %601
  %602 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %41, i32 0, i32 2
  store %FIFO* %423, %FIFO** %602
  %603 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %41 to i8*
  store i32* %thread_id13, i32** %42
  %604 = bitcast i32*** %43 to i8**
  store i32** %42, i32*** %43
  %605 = load i8*, i8** %604
  call void @pthread_create(i8* %605, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.13 to i8*), i8* %603)
  %606 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %44, i32 0, i32 0
  store %FIFO* %409, %FIFO** %606
  %607 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %44, i32 0, i32 1
  store %FIFO* %424, %FIFO** %607
  %608 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %44, i32 0, i32 2
  store %FIFO* %425, %FIFO** %608
  %609 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %44 to i8*
  store i32* %thread_id14, i32** %45
  %610 = bitcast i32*** %46 to i8**
  store i32** %45, i32*** %46
  %611 = load i8*, i8** %610
  call void @pthread_create(i8* %611, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.14 to i8*), i8* %609)
  %612 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %47, i32 0, i32 0
  store %FIFO* %410, %FIFO** %612
  %613 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %47, i32 0, i32 1
  store %FIFO* %426, %FIFO** %613
  %614 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %47, i32 0, i32 2
  store %FIFO* %427, %FIFO** %614
  %615 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %47 to i8*
  store i32* %thread_id15, i32** %48
  %616 = bitcast i32*** %49 to i8**
  store i32** %48, i32*** %49
  %617 = load i8*, i8** %616
  call void @pthread_create(i8* %617, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.15 to i8*), i8* %615)
  %618 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %50, i32 0, i32 0
  store %FIFO* %411, %FIFO** %618
  %619 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %50, i32 0, i32 1
  store %FIFO* %428, %FIFO** %619
  %620 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %50, i32 0, i32 2
  store %FIFO* %429, %FIFO** %620
  %621 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %50 to i8*
  store i32* %thread_id16, i32** %51
  %622 = bitcast i32*** %52 to i8**
  store i32** %51, i32*** %52
  %623 = load i8*, i8** %622
  call void @pthread_create(i8* %623, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.16 to i8*), i8* %621)
  %624 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %53, i32 0, i32 0
  store %FIFO* %412, %FIFO** %624
  %625 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %53, i32 0, i32 1
  store %FIFO* %430, %FIFO** %625
  %626 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %53, i32 0, i32 2
  store %FIFO* %431, %FIFO** %626
  %627 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %53 to i8*
  store i32* %thread_id17, i32** %54
  %628 = bitcast i32*** %55 to i8**
  store i32** %54, i32*** %55
  %629 = load i8*, i8** %628
  call void @pthread_create(i8* %629, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.17 to i8*), i8* %627)
  %630 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %56, i32 0, i32 0
  store %FIFO* %413, %FIFO** %630
  %631 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %56, i32 0, i32 1
  store %FIFO* %432, %FIFO** %631
  %632 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %56, i32 0, i32 2
  store %FIFO* %433, %FIFO** %632
  %633 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %56 to i8*
  store i32* %thread_id18, i32** %57
  %634 = bitcast i32*** %58 to i8**
  store i32** %57, i32*** %58
  %635 = load i8*, i8** %634
  call void @pthread_create(i8* %635, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.18 to i8*), i8* %633)
  %636 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %59, i32 0, i32 0
  store %FIFO* %414, %FIFO** %636
  %637 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %59, i32 0, i32 1
  store %FIFO* %434, %FIFO** %637
  %638 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %59, i32 0, i32 2
  store %FIFO* %435, %FIFO** %638
  %639 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %59 to i8*
  store i32* %thread_id19, i32** %60
  %640 = bitcast i32*** %61 to i8**
  store i32** %60, i32*** %61
  %641 = load i8*, i8** %640
  call void @pthread_create(i8* %641, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.19 to i8*), i8* %639)
  %642 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %62, i32 0, i32 0
  store %FIFO* %415, %FIFO** %642
  %643 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %62, i32 0, i32 1
  store %FIFO* %436, %FIFO** %643
  %644 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %62, i32 0, i32 2
  store %FIFO* %437, %FIFO** %644
  %645 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %62 to i8*
  store i32* %thread_id20, i32** %63
  %646 = bitcast i32*** %64 to i8**
  store i32** %63, i32*** %64
  %647 = load i8*, i8** %646
  call void @pthread_create(i8* %647, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.20 to i8*), i8* %645)
  %648 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %65, i32 0, i32 0
  store %FIFO* %416, %FIFO** %648
  %649 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %65, i32 0, i32 1
  store %FIFO* %438, %FIFO** %649
  %650 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %65, i32 0, i32 2
  store %FIFO* %439, %FIFO** %650
  %651 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %65 to i8*
  store i32* %thread_id21, i32** %66
  %652 = bitcast i32*** %67 to i8**
  store i32** %66, i32*** %67
  %653 = load i8*, i8** %652
  call void @pthread_create(i8* %653, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.21 to i8*), i8* %651)
  %654 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %68, i32 0, i32 0
  store %FIFO* %417, %FIFO** %654
  %655 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %68, i32 0, i32 1
  store %FIFO* %440, %FIFO** %655
  %656 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %68, i32 0, i32 2
  store %FIFO* %441, %FIFO** %656
  %657 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %68 to i8*
  store i32* %thread_id22, i32** %69
  %658 = bitcast i32*** %70 to i8**
  store i32** %69, i32*** %70
  %659 = load i8*, i8** %658
  call void @pthread_create(i8* %659, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.22 to i8*), i8* %657)
  %660 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %71, i32 0, i32 0
  store %FIFO* %418, %FIFO** %660
  %661 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %71, i32 0, i32 1
  store %FIFO* %442, %FIFO** %661
  %662 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %71, i32 0, i32 2
  store %FIFO* %443, %FIFO** %662
  %663 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %71 to i8*
  store i32* %thread_id23, i32** %72
  %664 = bitcast i32*** %73 to i8**
  store i32** %72, i32*** %73
  %665 = load i8*, i8** %664
  call void @pthread_create(i8* %665, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.23 to i8*), i8* %663)
  %666 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %74, i32 0, i32 0
  store %FIFO* %419, %FIFO** %666
  %667 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %74, i32 0, i32 1
  store %FIFO* %444, %FIFO** %667
  %668 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %74, i32 0, i32 2
  store %FIFO* %445, %FIFO** %668
  %669 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %74 to i8*
  store i32* %thread_id24, i32** %75
  %670 = bitcast i32*** %76 to i8**
  store i32** %75, i32*** %76
  %671 = load i8*, i8** %670
  call void @pthread_create(i8* %671, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.24 to i8*), i8* %669)
  %672 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %77, i32 0, i32 0
  store %FIFO* %420, %FIFO** %672
  %673 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %77, i32 0, i32 1
  store %FIFO* %446, %FIFO** %673
  %674 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %77, i32 0, i32 2
  store %FIFO* %447, %FIFO** %674
  %675 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %77 to i8*
  store i32* %thread_id25, i32** %78
  %676 = bitcast i32*** %79 to i8**
  store i32** %78, i32*** %79
  %677 = load i8*, i8** %676
  call void @pthread_create(i8* %677, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.25 to i8*), i8* %675)
  %678 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %80, i32 0, i32 0
  store %FIFO* %421, %FIFO** %678
  %679 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %80, i32 0, i32 1
  store %FIFO* %448, %FIFO** %679
  %680 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %80, i32 0, i32 2
  store %FIFO* %449, %FIFO** %680
  %681 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %80 to i8*
  store i32* %thread_id26, i32** %81
  %682 = bitcast i32*** %82 to i8**
  store i32** %81, i32*** %82
  %683 = load i8*, i8** %682
  call void @pthread_create(i8* %683, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.26 to i8*), i8* %681)
  %684 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %83, i32 0, i32 0
  store %FIFO* %422, %FIFO** %684
  %685 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %83, i32 0, i32 1
  store %FIFO* %450, %FIFO** %685
  %686 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %83, i32 0, i32 2
  store %FIFO* %451, %FIFO** %686
  %687 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %83 to i8*
  store i32* %thread_id27, i32** %84
  %688 = bitcast i32*** %85 to i8**
  store i32** %84, i32*** %85
  %689 = load i8*, i8** %688
  call void @pthread_create(i8* %689, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.27 to i8*), i8* %687)
  %690 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %86, i32 0, i32 0
  store %FIFO* %423, %FIFO** %690
  %691 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %86, i32 0, i32 1
  store %FIFO* %452, %FIFO** %691
  %692 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %86, i32 0, i32 2
  store %FIFO* %453, %FIFO** %692
  %693 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %86 to i8*
  store i32* %thread_id28, i32** %87
  %694 = bitcast i32*** %88 to i8**
  store i32** %87, i32*** %88
  %695 = load i8*, i8** %694
  call void @pthread_create(i8* %695, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.28 to i8*), i8* %693)
  %696 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %89, i32 0, i32 0
  store %FIFO* %424, %FIFO** %696
  %697 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %89, i32 0, i32 1
  store %FIFO* %454, %FIFO** %697
  %698 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %89, i32 0, i32 2
  store %FIFO* %455, %FIFO** %698
  %699 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %89 to i8*
  store i32* %thread_id29, i32** %90
  %700 = bitcast i32*** %91 to i8**
  store i32** %90, i32*** %91
  %701 = load i8*, i8** %700
  call void @pthread_create(i8* %701, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.29 to i8*), i8* %699)
  %702 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %92, i32 0, i32 0
  store %FIFO* %425, %FIFO** %702
  %703 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %92, i32 0, i32 1
  store %FIFO* %456, %FIFO** %703
  %704 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %92, i32 0, i32 2
  store %FIFO* %457, %FIFO** %704
  %705 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %92 to i8*
  store i32* %thread_id30, i32** %93
  %706 = bitcast i32*** %94 to i8**
  store i32** %93, i32*** %94
  %707 = load i8*, i8** %706
  call void @pthread_create(i8* %707, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.30 to i8*), i8* %705)
  %708 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %95, i32 0, i32 0
  store %FIFO* %426, %FIFO** %708
  %709 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %95, i32 0, i32 1
  store %FIFO* %458, %FIFO** %709
  %710 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %95, i32 0, i32 2
  store %FIFO* %459, %FIFO** %710
  %711 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %95 to i8*
  store i32* %thread_id31, i32** %96
  %712 = bitcast i32*** %97 to i8**
  store i32** %96, i32*** %97
  %713 = load i8*, i8** %712
  call void @pthread_create(i8* %713, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.31 to i8*), i8* %711)
  %714 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %98, i32 0, i32 0
  store %FIFO* %427, %FIFO** %714
  %715 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %98, i32 0, i32 1
  store %FIFO* %460, %FIFO** %715
  %716 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %98, i32 0, i32 2
  store %FIFO* %461, %FIFO** %716
  %717 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %98 to i8*
  store i32* %thread_id32, i32** %99
  %718 = bitcast i32*** %100 to i8**
  store i32** %99, i32*** %100
  %719 = load i8*, i8** %718
  call void @pthread_create(i8* %719, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.32 to i8*), i8* %717)
  %720 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %101, i32 0, i32 0
  store %FIFO* %428, %FIFO** %720
  %721 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %101, i32 0, i32 1
  store %FIFO* %462, %FIFO** %721
  %722 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %101, i32 0, i32 2
  store %FIFO* %463, %FIFO** %722
  %723 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %101 to i8*
  store i32* %thread_id33, i32** %102
  %724 = bitcast i32*** %103 to i8**
  store i32** %102, i32*** %103
  %725 = load i8*, i8** %724
  call void @pthread_create(i8* %725, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.33 to i8*), i8* %723)
  %726 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %104, i32 0, i32 0
  store %FIFO* %429, %FIFO** %726
  %727 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %104, i32 0, i32 1
  store %FIFO* %464, %FIFO** %727
  %728 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %104, i32 0, i32 2
  store %FIFO* %465, %FIFO** %728
  %729 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %104 to i8*
  store i32* %thread_id34, i32** %105
  %730 = bitcast i32*** %106 to i8**
  store i32** %105, i32*** %106
  %731 = load i8*, i8** %730
  call void @pthread_create(i8* %731, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.34 to i8*), i8* %729)
  %732 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %107, i32 0, i32 0
  store %FIFO* %430, %FIFO** %732
  %733 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %107, i32 0, i32 1
  store %FIFO* %466, %FIFO** %733
  %734 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %107, i32 0, i32 2
  store %FIFO* %467, %FIFO** %734
  %735 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %107 to i8*
  store i32* %thread_id35, i32** %108
  %736 = bitcast i32*** %109 to i8**
  store i32** %108, i32*** %109
  %737 = load i8*, i8** %736
  call void @pthread_create(i8* %737, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.35 to i8*), i8* %735)
  %738 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %110, i32 0, i32 0
  store %FIFO* %431, %FIFO** %738
  %739 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %110, i32 0, i32 1
  store %FIFO* %468, %FIFO** %739
  %740 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %110, i32 0, i32 2
  store %FIFO* %469, %FIFO** %740
  %741 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %110 to i8*
  store i32* %thread_id36, i32** %111
  %742 = bitcast i32*** %112 to i8**
  store i32** %111, i32*** %112
  %743 = load i8*, i8** %742
  call void @pthread_create(i8* %743, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.36 to i8*), i8* %741)
  %744 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %113, i32 0, i32 0
  store %FIFO* %432, %FIFO** %744
  %745 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %113, i32 0, i32 1
  store %FIFO* %470, %FIFO** %745
  %746 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %113, i32 0, i32 2
  store %FIFO* %471, %FIFO** %746
  %747 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %113 to i8*
  store i32* %thread_id37, i32** %114
  %748 = bitcast i32*** %115 to i8**
  store i32** %114, i32*** %115
  %749 = load i8*, i8** %748
  call void @pthread_create(i8* %749, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.37 to i8*), i8* %747)
  %750 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %116, i32 0, i32 0
  store %FIFO* %433, %FIFO** %750
  %751 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %116, i32 0, i32 1
  store %FIFO* %472, %FIFO** %751
  %752 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %116, i32 0, i32 2
  store %FIFO* %473, %FIFO** %752
  %753 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %116 to i8*
  store i32* %thread_id38, i32** %117
  %754 = bitcast i32*** %118 to i8**
  store i32** %117, i32*** %118
  %755 = load i8*, i8** %754
  call void @pthread_create(i8* %755, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.38 to i8*), i8* %753)
  %756 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %119, i32 0, i32 0
  store %FIFO* %434, %FIFO** %756
  %757 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %119, i32 0, i32 1
  store %FIFO* %474, %FIFO** %757
  %758 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %119, i32 0, i32 2
  store %FIFO* %475, %FIFO** %758
  %759 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %119 to i8*
  store i32* %thread_id39, i32** %120
  %760 = bitcast i32*** %121 to i8**
  store i32** %120, i32*** %121
  %761 = load i8*, i8** %760
  call void @pthread_create(i8* %761, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.39 to i8*), i8* %759)
  %762 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %122, i32 0, i32 0
  store %FIFO* %435, %FIFO** %762
  %763 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %122, i32 0, i32 1
  store %FIFO* %476, %FIFO** %763
  %764 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %122, i32 0, i32 2
  store %FIFO* %477, %FIFO** %764
  %765 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %122 to i8*
  store i32* %thread_id40, i32** %123
  %766 = bitcast i32*** %124 to i8**
  store i32** %123, i32*** %124
  %767 = load i8*, i8** %766
  call void @pthread_create(i8* %767, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.40 to i8*), i8* %765)
  %768 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %125, i32 0, i32 0
  store %FIFO* %436, %FIFO** %768
  %769 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %125, i32 0, i32 1
  store %FIFO* %478, %FIFO** %769
  %770 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %125, i32 0, i32 2
  store %FIFO* %479, %FIFO** %770
  %771 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %125 to i8*
  store i32* %thread_id41, i32** %126
  %772 = bitcast i32*** %127 to i8**
  store i32** %126, i32*** %127
  %773 = load i8*, i8** %772
  call void @pthread_create(i8* %773, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.41 to i8*), i8* %771)
  %774 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %128, i32 0, i32 0
  store %FIFO* %437, %FIFO** %774
  %775 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %128, i32 0, i32 1
  store %FIFO* %480, %FIFO** %775
  %776 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %128, i32 0, i32 2
  store %FIFO* %481, %FIFO** %776
  %777 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %128 to i8*
  store i32* %thread_id42, i32** %129
  %778 = bitcast i32*** %130 to i8**
  store i32** %129, i32*** %130
  %779 = load i8*, i8** %778
  call void @pthread_create(i8* %779, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.42 to i8*), i8* %777)
  %780 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %131, i32 0, i32 0
  store %FIFO* %438, %FIFO** %780
  %781 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %131, i32 0, i32 1
  store %FIFO* %482, %FIFO** %781
  %782 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %131, i32 0, i32 2
  store %FIFO* %483, %FIFO** %782
  %783 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %131 to i8*
  store i32* %thread_id43, i32** %132
  %784 = bitcast i32*** %133 to i8**
  store i32** %132, i32*** %133
  %785 = load i8*, i8** %784
  call void @pthread_create(i8* %785, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.43 to i8*), i8* %783)
  %786 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %134, i32 0, i32 0
  store %FIFO* %439, %FIFO** %786
  %787 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %134, i32 0, i32 1
  store %FIFO* %484, %FIFO** %787
  %788 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %134, i32 0, i32 2
  store %FIFO* %485, %FIFO** %788
  %789 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %134 to i8*
  store i32* %thread_id44, i32** %135
  %790 = bitcast i32*** %136 to i8**
  store i32** %135, i32*** %136
  %791 = load i8*, i8** %790
  call void @pthread_create(i8* %791, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.44 to i8*), i8* %789)
  %792 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %137, i32 0, i32 0
  store %FIFO* %440, %FIFO** %792
  %793 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %137, i32 0, i32 1
  store %FIFO* %486, %FIFO** %793
  %794 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %137, i32 0, i32 2
  store %FIFO* %487, %FIFO** %794
  %795 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %137 to i8*
  store i32* %thread_id45, i32** %138
  %796 = bitcast i32*** %139 to i8**
  store i32** %138, i32*** %139
  %797 = load i8*, i8** %796
  call void @pthread_create(i8* %797, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.45 to i8*), i8* %795)
  %798 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %140, i32 0, i32 0
  store %FIFO* %441, %FIFO** %798
  %799 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %140, i32 0, i32 1
  store %FIFO* %488, %FIFO** %799
  %800 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %140, i32 0, i32 2
  store %FIFO* %489, %FIFO** %800
  %801 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %140 to i8*
  store i32* %thread_id46, i32** %141
  %802 = bitcast i32*** %142 to i8**
  store i32** %141, i32*** %142
  %803 = load i8*, i8** %802
  call void @pthread_create(i8* %803, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.46 to i8*), i8* %801)
  %804 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %143, i32 0, i32 0
  store %FIFO* %442, %FIFO** %804
  %805 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %143, i32 0, i32 1
  store %FIFO* %490, %FIFO** %805
  %806 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %143, i32 0, i32 2
  store %FIFO* %491, %FIFO** %806
  %807 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %143 to i8*
  store i32* %thread_id47, i32** %144
  %808 = bitcast i32*** %145 to i8**
  store i32** %144, i32*** %145
  %809 = load i8*, i8** %808
  call void @pthread_create(i8* %809, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.47 to i8*), i8* %807)
  %810 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %146, i32 0, i32 0
  store %FIFO* %443, %FIFO** %810
  %811 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %146, i32 0, i32 1
  store %FIFO* %492, %FIFO** %811
  %812 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %146, i32 0, i32 2
  store %FIFO* %493, %FIFO** %812
  %813 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %146 to i8*
  store i32* %thread_id48, i32** %147
  %814 = bitcast i32*** %148 to i8**
  store i32** %147, i32*** %148
  %815 = load i8*, i8** %814
  call void @pthread_create(i8* %815, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.48 to i8*), i8* %813)
  %816 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %149, i32 0, i32 0
  store %FIFO* %444, %FIFO** %816
  %817 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %149, i32 0, i32 1
  store %FIFO* %494, %FIFO** %817
  %818 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %149, i32 0, i32 2
  store %FIFO* %495, %FIFO** %818
  %819 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %149 to i8*
  store i32* %thread_id49, i32** %150
  %820 = bitcast i32*** %151 to i8**
  store i32** %150, i32*** %151
  %821 = load i8*, i8** %820
  call void @pthread_create(i8* %821, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.49 to i8*), i8* %819)
  %822 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %152, i32 0, i32 0
  store %FIFO* %445, %FIFO** %822
  %823 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %152, i32 0, i32 1
  store %FIFO* %496, %FIFO** %823
  %824 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %152, i32 0, i32 2
  store %FIFO* %497, %FIFO** %824
  %825 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %152 to i8*
  store i32* %thread_id50, i32** %153
  %826 = bitcast i32*** %154 to i8**
  store i32** %153, i32*** %154
  %827 = load i8*, i8** %826
  call void @pthread_create(i8* %827, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.50 to i8*), i8* %825)
  %828 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %155, i32 0, i32 0
  store %FIFO* %446, %FIFO** %828
  %829 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %155, i32 0, i32 1
  store %FIFO* %498, %FIFO** %829
  %830 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %155, i32 0, i32 2
  store %FIFO* %499, %FIFO** %830
  %831 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %155 to i8*
  store i32* %thread_id51, i32** %156
  %832 = bitcast i32*** %157 to i8**
  store i32** %156, i32*** %157
  %833 = load i8*, i8** %832
  call void @pthread_create(i8* %833, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.51 to i8*), i8* %831)
  %834 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %158, i32 0, i32 0
  store %FIFO* %447, %FIFO** %834
  %835 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %158, i32 0, i32 1
  store %FIFO* %500, %FIFO** %835
  %836 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %158, i32 0, i32 2
  store %FIFO* %501, %FIFO** %836
  %837 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %158 to i8*
  store i32* %thread_id52, i32** %159
  %838 = bitcast i32*** %160 to i8**
  store i32** %159, i32*** %160
  %839 = load i8*, i8** %838
  call void @pthread_create(i8* %839, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.52 to i8*), i8* %837)
  %840 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %161, i32 0, i32 0
  store %FIFO* %448, %FIFO** %840
  %841 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %161, i32 0, i32 1
  store %FIFO* %502, %FIFO** %841
  %842 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %161, i32 0, i32 2
  store %FIFO* %503, %FIFO** %842
  %843 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %161 to i8*
  store i32* %thread_id53, i32** %162
  %844 = bitcast i32*** %163 to i8**
  store i32** %162, i32*** %163
  %845 = load i8*, i8** %844
  call void @pthread_create(i8* %845, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.53 to i8*), i8* %843)
  %846 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %164, i32 0, i32 0
  store %FIFO* %449, %FIFO** %846
  %847 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %164, i32 0, i32 1
  store %FIFO* %504, %FIFO** %847
  %848 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %164, i32 0, i32 2
  store %FIFO* %505, %FIFO** %848
  %849 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %164 to i8*
  store i32* %thread_id54, i32** %165
  %850 = bitcast i32*** %166 to i8**
  store i32** %165, i32*** %166
  %851 = load i8*, i8** %850
  call void @pthread_create(i8* %851, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.54 to i8*), i8* %849)
  %852 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %167, i32 0, i32 0
  store %FIFO* %450, %FIFO** %852
  %853 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %167, i32 0, i32 1
  store %FIFO* %506, %FIFO** %853
  %854 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %167, i32 0, i32 2
  store %FIFO* %507, %FIFO** %854
  %855 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %167 to i8*
  store i32* %thread_id55, i32** %168
  %856 = bitcast i32*** %169 to i8**
  store i32** %168, i32*** %169
  %857 = load i8*, i8** %856
  call void @pthread_create(i8* %857, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.55 to i8*), i8* %855)
  %858 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %170, i32 0, i32 0
  store %FIFO* %451, %FIFO** %858
  %859 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %170, i32 0, i32 1
  store %FIFO* %508, %FIFO** %859
  %860 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %170, i32 0, i32 2
  store %FIFO* %509, %FIFO** %860
  %861 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %170 to i8*
  store i32* %thread_id56, i32** %171
  %862 = bitcast i32*** %172 to i8**
  store i32** %171, i32*** %172
  %863 = load i8*, i8** %862
  call void @pthread_create(i8* %863, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.56 to i8*), i8* %861)
  %864 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %173, i32 0, i32 0
  store %FIFO* %452, %FIFO** %864
  %865 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %173, i32 0, i32 1
  store %FIFO* %510, %FIFO** %865
  %866 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %173, i32 0, i32 2
  store %FIFO* %511, %FIFO** %866
  %867 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %173 to i8*
  store i32* %thread_id57, i32** %174
  %868 = bitcast i32*** %175 to i8**
  store i32** %174, i32*** %175
  %869 = load i8*, i8** %868
  call void @pthread_create(i8* %869, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.57 to i8*), i8* %867)
  %870 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %176, i32 0, i32 0
  store %FIFO* %453, %FIFO** %870
  %871 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %176, i32 0, i32 1
  store %FIFO* %512, %FIFO** %871
  %872 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %176, i32 0, i32 2
  store %FIFO* %513, %FIFO** %872
  %873 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %176 to i8*
  store i32* %thread_id58, i32** %177
  %874 = bitcast i32*** %178 to i8**
  store i32** %177, i32*** %178
  %875 = load i8*, i8** %874
  call void @pthread_create(i8* %875, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.58 to i8*), i8* %873)
  %876 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %179, i32 0, i32 0
  store %FIFO* %454, %FIFO** %876
  %877 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %179, i32 0, i32 1
  store %FIFO* %514, %FIFO** %877
  %878 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %179, i32 0, i32 2
  store %FIFO* %515, %FIFO** %878
  %879 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %179 to i8*
  store i32* %thread_id59, i32** %180
  %880 = bitcast i32*** %181 to i8**
  store i32** %180, i32*** %181
  %881 = load i8*, i8** %880
  call void @pthread_create(i8* %881, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.59 to i8*), i8* %879)
  %882 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %182, i32 0, i32 0
  store %FIFO* %455, %FIFO** %882
  %883 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %182, i32 0, i32 1
  store %FIFO* %516, %FIFO** %883
  %884 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %182, i32 0, i32 2
  store %FIFO* %517, %FIFO** %884
  %885 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %182 to i8*
  store i32* %thread_id60, i32** %183
  %886 = bitcast i32*** %184 to i8**
  store i32** %183, i32*** %184
  %887 = load i8*, i8** %886
  call void @pthread_create(i8* %887, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.60 to i8*), i8* %885)
  %888 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %185, i32 0, i32 0
  store %FIFO* %456, %FIFO** %888
  %889 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %185, i32 0, i32 1
  store %FIFO* %518, %FIFO** %889
  %890 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %185, i32 0, i32 2
  store %FIFO* %519, %FIFO** %890
  %891 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %185 to i8*
  store i32* %thread_id61, i32** %186
  %892 = bitcast i32*** %187 to i8**
  store i32** %186, i32*** %187
  %893 = load i8*, i8** %892
  call void @pthread_create(i8* %893, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.61 to i8*), i8* %891)
  %894 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %188, i32 0, i32 0
  store %FIFO* %457, %FIFO** %894
  %895 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %188, i32 0, i32 1
  store %FIFO* %520, %FIFO** %895
  %896 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %188, i32 0, i32 2
  store %FIFO* %521, %FIFO** %896
  %897 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %188 to i8*
  store i32* %thread_id62, i32** %189
  %898 = bitcast i32*** %190 to i8**
  store i32** %189, i32*** %190
  %899 = load i8*, i8** %898
  call void @pthread_create(i8* %899, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.62 to i8*), i8* %897)
  %900 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %901 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %902 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %903 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %904 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %905 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %906 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %907 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %908 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %909 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %910 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %911 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %912 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %913 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %914 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %915 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %916 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %917 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %918 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %919 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %920 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %921 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %922 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %923 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %924 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %925 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %926 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %927 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %928 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %929 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %930 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %931 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %932 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %933 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %934 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %935 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %936 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %937 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %938 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %939 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %940 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %941 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %942 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %943 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %944 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %945 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %946 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %947 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %948 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %949 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %950 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %951 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %952 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %953 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %954 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %955 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %956 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %957 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %958 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %959 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %960 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %961 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %962 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %963 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %191, i32 0, i32 0
  store %FIFO* %458, %FIFO** %963
  %964 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %191, i32 0, i32 1
  store %FIFO* %490, %FIFO** %964
  %965 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %191, i32 0, i32 2
  store %FIFO* %900, %FIFO** %965
  %966 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %191 to i8*
  store i32* %thread_id63, i32** %192
  %967 = bitcast i32*** %193 to i8**
  store i32** %192, i32*** %193
  %968 = load i8*, i8** %967
  call void @pthread_create(i8* %968, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.63 to i8*), i8* %966)
  %969 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %194, i32 0, i32 0
  store %FIFO* %459, %FIFO** %969
  %970 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %194, i32 0, i32 1
  store %FIFO* %491, %FIFO** %970
  %971 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %194, i32 0, i32 2
  store %FIFO* %901, %FIFO** %971
  %972 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %194 to i8*
  store i32* %thread_id64, i32** %195
  %973 = bitcast i32*** %196 to i8**
  store i32** %195, i32*** %196
  %974 = load i8*, i8** %973
  call void @pthread_create(i8* %974, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.64 to i8*), i8* %972)
  %975 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %197, i32 0, i32 0
  store %FIFO* %460, %FIFO** %975
  %976 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %197, i32 0, i32 1
  store %FIFO* %492, %FIFO** %976
  %977 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %197, i32 0, i32 2
  store %FIFO* %902, %FIFO** %977
  %978 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %197 to i8*
  store i32* %thread_id65, i32** %198
  %979 = bitcast i32*** %199 to i8**
  store i32** %198, i32*** %199
  %980 = load i8*, i8** %979
  call void @pthread_create(i8* %980, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.65 to i8*), i8* %978)
  %981 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %200, i32 0, i32 0
  store %FIFO* %461, %FIFO** %981
  %982 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %200, i32 0, i32 1
  store %FIFO* %493, %FIFO** %982
  %983 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %200, i32 0, i32 2
  store %FIFO* %903, %FIFO** %983
  %984 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %200 to i8*
  store i32* %thread_id66, i32** %201
  %985 = bitcast i32*** %202 to i8**
  store i32** %201, i32*** %202
  %986 = load i8*, i8** %985
  call void @pthread_create(i8* %986, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.66 to i8*), i8* %984)
  %987 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %203, i32 0, i32 0
  store %FIFO* %462, %FIFO** %987
  %988 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %203, i32 0, i32 1
  store %FIFO* %494, %FIFO** %988
  %989 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %203, i32 0, i32 2
  store %FIFO* %904, %FIFO** %989
  %990 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %203 to i8*
  store i32* %thread_id67, i32** %204
  %991 = bitcast i32*** %205 to i8**
  store i32** %204, i32*** %205
  %992 = load i8*, i8** %991
  call void @pthread_create(i8* %992, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.67 to i8*), i8* %990)
  %993 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %206, i32 0, i32 0
  store %FIFO* %463, %FIFO** %993
  %994 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %206, i32 0, i32 1
  store %FIFO* %495, %FIFO** %994
  %995 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %206, i32 0, i32 2
  store %FIFO* %905, %FIFO** %995
  %996 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %206 to i8*
  store i32* %thread_id68, i32** %207
  %997 = bitcast i32*** %208 to i8**
  store i32** %207, i32*** %208
  %998 = load i8*, i8** %997
  call void @pthread_create(i8* %998, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.68 to i8*), i8* %996)
  %999 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %209, i32 0, i32 0
  store %FIFO* %464, %FIFO** %999
  %1000 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %209, i32 0, i32 1
  store %FIFO* %496, %FIFO** %1000
  %1001 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %209, i32 0, i32 2
  store %FIFO* %906, %FIFO** %1001
  %1002 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %209 to i8*
  store i32* %thread_id69, i32** %210
  %1003 = bitcast i32*** %211 to i8**
  store i32** %210, i32*** %211
  %1004 = load i8*, i8** %1003
  call void @pthread_create(i8* %1004, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.69 to i8*), i8* %1002)
  %1005 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %212, i32 0, i32 0
  store %FIFO* %465, %FIFO** %1005
  %1006 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %212, i32 0, i32 1
  store %FIFO* %497, %FIFO** %1006
  %1007 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %212, i32 0, i32 2
  store %FIFO* %907, %FIFO** %1007
  %1008 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %212 to i8*
  store i32* %thread_id70, i32** %213
  %1009 = bitcast i32*** %214 to i8**
  store i32** %213, i32*** %214
  %1010 = load i8*, i8** %1009
  call void @pthread_create(i8* %1010, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.70 to i8*), i8* %1008)
  %1011 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %215, i32 0, i32 0
  store %FIFO* %466, %FIFO** %1011
  %1012 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %215, i32 0, i32 1
  store %FIFO* %498, %FIFO** %1012
  %1013 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %215, i32 0, i32 2
  store %FIFO* %908, %FIFO** %1013
  %1014 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %215 to i8*
  store i32* %thread_id71, i32** %216
  %1015 = bitcast i32*** %217 to i8**
  store i32** %216, i32*** %217
  %1016 = load i8*, i8** %1015
  call void @pthread_create(i8* %1016, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.71 to i8*), i8* %1014)
  %1017 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %218, i32 0, i32 0
  store %FIFO* %467, %FIFO** %1017
  %1018 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %218, i32 0, i32 1
  store %FIFO* %499, %FIFO** %1018
  %1019 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %218, i32 0, i32 2
  store %FIFO* %909, %FIFO** %1019
  %1020 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %218 to i8*
  store i32* %thread_id72, i32** %219
  %1021 = bitcast i32*** %220 to i8**
  store i32** %219, i32*** %220
  %1022 = load i8*, i8** %1021
  call void @pthread_create(i8* %1022, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.72 to i8*), i8* %1020)
  %1023 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %221, i32 0, i32 0
  store %FIFO* %468, %FIFO** %1023
  %1024 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %221, i32 0, i32 1
  store %FIFO* %500, %FIFO** %1024
  %1025 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %221, i32 0, i32 2
  store %FIFO* %910, %FIFO** %1025
  %1026 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %221 to i8*
  store i32* %thread_id73, i32** %222
  %1027 = bitcast i32*** %223 to i8**
  store i32** %222, i32*** %223
  %1028 = load i8*, i8** %1027
  call void @pthread_create(i8* %1028, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.73 to i8*), i8* %1026)
  %1029 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %224, i32 0, i32 0
  store %FIFO* %469, %FIFO** %1029
  %1030 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %224, i32 0, i32 1
  store %FIFO* %501, %FIFO** %1030
  %1031 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %224, i32 0, i32 2
  store %FIFO* %911, %FIFO** %1031
  %1032 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %224 to i8*
  store i32* %thread_id74, i32** %225
  %1033 = bitcast i32*** %226 to i8**
  store i32** %225, i32*** %226
  %1034 = load i8*, i8** %1033
  call void @pthread_create(i8* %1034, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.74 to i8*), i8* %1032)
  %1035 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %227, i32 0, i32 0
  store %FIFO* %470, %FIFO** %1035
  %1036 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %227, i32 0, i32 1
  store %FIFO* %502, %FIFO** %1036
  %1037 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %227, i32 0, i32 2
  store %FIFO* %912, %FIFO** %1037
  %1038 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %227 to i8*
  store i32* %thread_id75, i32** %228
  %1039 = bitcast i32*** %229 to i8**
  store i32** %228, i32*** %229
  %1040 = load i8*, i8** %1039
  call void @pthread_create(i8* %1040, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.75 to i8*), i8* %1038)
  %1041 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %230, i32 0, i32 0
  store %FIFO* %471, %FIFO** %1041
  %1042 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %230, i32 0, i32 1
  store %FIFO* %503, %FIFO** %1042
  %1043 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %230, i32 0, i32 2
  store %FIFO* %913, %FIFO** %1043
  %1044 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %230 to i8*
  store i32* %thread_id76, i32** %231
  %1045 = bitcast i32*** %232 to i8**
  store i32** %231, i32*** %232
  %1046 = load i8*, i8** %1045
  call void @pthread_create(i8* %1046, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.76 to i8*), i8* %1044)
  %1047 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %233, i32 0, i32 0
  store %FIFO* %472, %FIFO** %1047
  %1048 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %233, i32 0, i32 1
  store %FIFO* %504, %FIFO** %1048
  %1049 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %233, i32 0, i32 2
  store %FIFO* %914, %FIFO** %1049
  %1050 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %233 to i8*
  store i32* %thread_id77, i32** %234
  %1051 = bitcast i32*** %235 to i8**
  store i32** %234, i32*** %235
  %1052 = load i8*, i8** %1051
  call void @pthread_create(i8* %1052, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.77 to i8*), i8* %1050)
  %1053 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %236, i32 0, i32 0
  store %FIFO* %473, %FIFO** %1053
  %1054 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %236, i32 0, i32 1
  store %FIFO* %505, %FIFO** %1054
  %1055 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %236, i32 0, i32 2
  store %FIFO* %915, %FIFO** %1055
  %1056 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %236 to i8*
  store i32* %thread_id78, i32** %237
  %1057 = bitcast i32*** %238 to i8**
  store i32** %237, i32*** %238
  %1058 = load i8*, i8** %1057
  call void @pthread_create(i8* %1058, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.78 to i8*), i8* %1056)
  %1059 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %239, i32 0, i32 0
  store %FIFO* %474, %FIFO** %1059
  %1060 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %239, i32 0, i32 1
  store %FIFO* %506, %FIFO** %1060
  %1061 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %239, i32 0, i32 2
  store %FIFO* %916, %FIFO** %1061
  %1062 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %239 to i8*
  store i32* %thread_id79, i32** %240
  %1063 = bitcast i32*** %241 to i8**
  store i32** %240, i32*** %241
  %1064 = load i8*, i8** %1063
  call void @pthread_create(i8* %1064, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.79 to i8*), i8* %1062)
  %1065 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %242, i32 0, i32 0
  store %FIFO* %475, %FIFO** %1065
  %1066 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %242, i32 0, i32 1
  store %FIFO* %507, %FIFO** %1066
  %1067 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %242, i32 0, i32 2
  store %FIFO* %917, %FIFO** %1067
  %1068 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %242 to i8*
  store i32* %thread_id80, i32** %243
  %1069 = bitcast i32*** %244 to i8**
  store i32** %243, i32*** %244
  %1070 = load i8*, i8** %1069
  call void @pthread_create(i8* %1070, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.80 to i8*), i8* %1068)
  %1071 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %245, i32 0, i32 0
  store %FIFO* %476, %FIFO** %1071
  %1072 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %245, i32 0, i32 1
  store %FIFO* %508, %FIFO** %1072
  %1073 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %245, i32 0, i32 2
  store %FIFO* %918, %FIFO** %1073
  %1074 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %245 to i8*
  store i32* %thread_id81, i32** %246
  %1075 = bitcast i32*** %247 to i8**
  store i32** %246, i32*** %247
  %1076 = load i8*, i8** %1075
  call void @pthread_create(i8* %1076, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.81 to i8*), i8* %1074)
  %1077 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %248, i32 0, i32 0
  store %FIFO* %477, %FIFO** %1077
  %1078 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %248, i32 0, i32 1
  store %FIFO* %509, %FIFO** %1078
  %1079 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %248, i32 0, i32 2
  store %FIFO* %919, %FIFO** %1079
  %1080 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %248 to i8*
  store i32* %thread_id82, i32** %249
  %1081 = bitcast i32*** %250 to i8**
  store i32** %249, i32*** %250
  %1082 = load i8*, i8** %1081
  call void @pthread_create(i8* %1082, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.82 to i8*), i8* %1080)
  %1083 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %251, i32 0, i32 0
  store %FIFO* %478, %FIFO** %1083
  %1084 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %251, i32 0, i32 1
  store %FIFO* %510, %FIFO** %1084
  %1085 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %251, i32 0, i32 2
  store %FIFO* %920, %FIFO** %1085
  %1086 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %251 to i8*
  store i32* %thread_id83, i32** %252
  %1087 = bitcast i32*** %253 to i8**
  store i32** %252, i32*** %253
  %1088 = load i8*, i8** %1087
  call void @pthread_create(i8* %1088, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.83 to i8*), i8* %1086)
  %1089 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %254, i32 0, i32 0
  store %FIFO* %479, %FIFO** %1089
  %1090 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %254, i32 0, i32 1
  store %FIFO* %511, %FIFO** %1090
  %1091 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %254, i32 0, i32 2
  store %FIFO* %921, %FIFO** %1091
  %1092 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %254 to i8*
  store i32* %thread_id84, i32** %255
  %1093 = bitcast i32*** %256 to i8**
  store i32** %255, i32*** %256
  %1094 = load i8*, i8** %1093
  call void @pthread_create(i8* %1094, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.84 to i8*), i8* %1092)
  %1095 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %257, i32 0, i32 0
  store %FIFO* %480, %FIFO** %1095
  %1096 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %257, i32 0, i32 1
  store %FIFO* %512, %FIFO** %1096
  %1097 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %257, i32 0, i32 2
  store %FIFO* %922, %FIFO** %1097
  %1098 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %257 to i8*
  store i32* %thread_id85, i32** %258
  %1099 = bitcast i32*** %259 to i8**
  store i32** %258, i32*** %259
  %1100 = load i8*, i8** %1099
  call void @pthread_create(i8* %1100, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.85 to i8*), i8* %1098)
  %1101 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %260, i32 0, i32 0
  store %FIFO* %481, %FIFO** %1101
  %1102 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %260, i32 0, i32 1
  store %FIFO* %513, %FIFO** %1102
  %1103 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %260, i32 0, i32 2
  store %FIFO* %923, %FIFO** %1103
  %1104 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %260 to i8*
  store i32* %thread_id86, i32** %261
  %1105 = bitcast i32*** %262 to i8**
  store i32** %261, i32*** %262
  %1106 = load i8*, i8** %1105
  call void @pthread_create(i8* %1106, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.86 to i8*), i8* %1104)
  %1107 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %263, i32 0, i32 0
  store %FIFO* %482, %FIFO** %1107
  %1108 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %263, i32 0, i32 1
  store %FIFO* %514, %FIFO** %1108
  %1109 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %263, i32 0, i32 2
  store %FIFO* %924, %FIFO** %1109
  %1110 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %263 to i8*
  store i32* %thread_id87, i32** %264
  %1111 = bitcast i32*** %265 to i8**
  store i32** %264, i32*** %265
  %1112 = load i8*, i8** %1111
  call void @pthread_create(i8* %1112, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.87 to i8*), i8* %1110)
  %1113 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %266, i32 0, i32 0
  store %FIFO* %483, %FIFO** %1113
  %1114 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %266, i32 0, i32 1
  store %FIFO* %515, %FIFO** %1114
  %1115 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %266, i32 0, i32 2
  store %FIFO* %925, %FIFO** %1115
  %1116 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %266 to i8*
  store i32* %thread_id88, i32** %267
  %1117 = bitcast i32*** %268 to i8**
  store i32** %267, i32*** %268
  %1118 = load i8*, i8** %1117
  call void @pthread_create(i8* %1118, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.88 to i8*), i8* %1116)
  %1119 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %269, i32 0, i32 0
  store %FIFO* %484, %FIFO** %1119
  %1120 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %269, i32 0, i32 1
  store %FIFO* %516, %FIFO** %1120
  %1121 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %269, i32 0, i32 2
  store %FIFO* %926, %FIFO** %1121
  %1122 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %269 to i8*
  store i32* %thread_id89, i32** %270
  %1123 = bitcast i32*** %271 to i8**
  store i32** %270, i32*** %271
  %1124 = load i8*, i8** %1123
  call void @pthread_create(i8* %1124, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.89 to i8*), i8* %1122)
  %1125 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %272, i32 0, i32 0
  store %FIFO* %485, %FIFO** %1125
  %1126 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %272, i32 0, i32 1
  store %FIFO* %517, %FIFO** %1126
  %1127 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %272, i32 0, i32 2
  store %FIFO* %927, %FIFO** %1127
  %1128 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %272 to i8*
  store i32* %thread_id90, i32** %273
  %1129 = bitcast i32*** %274 to i8**
  store i32** %273, i32*** %274
  %1130 = load i8*, i8** %1129
  call void @pthread_create(i8* %1130, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.90 to i8*), i8* %1128)
  %1131 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %275, i32 0, i32 0
  store %FIFO* %486, %FIFO** %1131
  %1132 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %275, i32 0, i32 1
  store %FIFO* %518, %FIFO** %1132
  %1133 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %275, i32 0, i32 2
  store %FIFO* %928, %FIFO** %1133
  %1134 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %275 to i8*
  store i32* %thread_id91, i32** %276
  %1135 = bitcast i32*** %277 to i8**
  store i32** %276, i32*** %277
  %1136 = load i8*, i8** %1135
  call void @pthread_create(i8* %1136, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.91 to i8*), i8* %1134)
  %1137 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %278, i32 0, i32 0
  store %FIFO* %487, %FIFO** %1137
  %1138 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %278, i32 0, i32 1
  store %FIFO* %519, %FIFO** %1138
  %1139 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %278, i32 0, i32 2
  store %FIFO* %929, %FIFO** %1139
  %1140 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %278 to i8*
  store i32* %thread_id92, i32** %279
  %1141 = bitcast i32*** %280 to i8**
  store i32** %279, i32*** %280
  %1142 = load i8*, i8** %1141
  call void @pthread_create(i8* %1142, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.92 to i8*), i8* %1140)
  %1143 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %281, i32 0, i32 0
  store %FIFO* %488, %FIFO** %1143
  %1144 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %281, i32 0, i32 1
  store %FIFO* %520, %FIFO** %1144
  %1145 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %281, i32 0, i32 2
  store %FIFO* %930, %FIFO** %1145
  %1146 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %281 to i8*
  store i32* %thread_id93, i32** %282
  %1147 = bitcast i32*** %283 to i8**
  store i32** %282, i32*** %283
  %1148 = load i8*, i8** %1147
  call void @pthread_create(i8* %1148, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.93 to i8*), i8* %1146)
  %1149 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %284, i32 0, i32 0
  store %FIFO* %489, %FIFO** %1149
  %1150 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %284, i32 0, i32 1
  store %FIFO* %521, %FIFO** %1150
  %1151 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %284, i32 0, i32 2
  store %FIFO* %931, %FIFO** %1151
  %1152 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %284 to i8*
  store i32* %thread_id94, i32** %285
  %1153 = bitcast i32*** %286 to i8**
  store i32** %285, i32*** %286
  %1154 = load i8*, i8** %1153
  call void @pthread_create(i8* %1154, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.94 to i8*), i8* %1152)
  %1155 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %287, i32 0, i32 0
  store %FIFO* %900, %FIFO** %1155
  %1156 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %287, i32 0, i32 1
  store %FIFO* %916, %FIFO** %1156
  %1157 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %287, i32 0, i32 2
  store %FIFO* %932, %FIFO** %1157
  %1158 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %287 to i8*
  store i32* %thread_id95, i32** %288
  %1159 = bitcast i32*** %289 to i8**
  store i32** %288, i32*** %289
  %1160 = load i8*, i8** %1159
  call void @pthread_create(i8* %1160, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.95 to i8*), i8* %1158)
  %1161 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %290, i32 0, i32 0
  store %FIFO* %901, %FIFO** %1161
  %1162 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %290, i32 0, i32 1
  store %FIFO* %917, %FIFO** %1162
  %1163 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %290, i32 0, i32 2
  store %FIFO* %933, %FIFO** %1163
  %1164 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %290 to i8*
  store i32* %thread_id96, i32** %291
  %1165 = bitcast i32*** %292 to i8**
  store i32** %291, i32*** %292
  %1166 = load i8*, i8** %1165
  call void @pthread_create(i8* %1166, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.96 to i8*), i8* %1164)
  %1167 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %293, i32 0, i32 0
  store %FIFO* %902, %FIFO** %1167
  %1168 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %293, i32 0, i32 1
  store %FIFO* %918, %FIFO** %1168
  %1169 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %293, i32 0, i32 2
  store %FIFO* %934, %FIFO** %1169
  %1170 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %293 to i8*
  store i32* %thread_id97, i32** %294
  %1171 = bitcast i32*** %295 to i8**
  store i32** %294, i32*** %295
  %1172 = load i8*, i8** %1171
  call void @pthread_create(i8* %1172, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.97 to i8*), i8* %1170)
  %1173 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %296, i32 0, i32 0
  store %FIFO* %903, %FIFO** %1173
  %1174 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %296, i32 0, i32 1
  store %FIFO* %919, %FIFO** %1174
  %1175 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %296, i32 0, i32 2
  store %FIFO* %935, %FIFO** %1175
  %1176 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %296 to i8*
  store i32* %thread_id98, i32** %297
  %1177 = bitcast i32*** %298 to i8**
  store i32** %297, i32*** %298
  %1178 = load i8*, i8** %1177
  call void @pthread_create(i8* %1178, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.98 to i8*), i8* %1176)
  %1179 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %299, i32 0, i32 0
  store %FIFO* %904, %FIFO** %1179
  %1180 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %299, i32 0, i32 1
  store %FIFO* %920, %FIFO** %1180
  %1181 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %299, i32 0, i32 2
  store %FIFO* %936, %FIFO** %1181
  %1182 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %299 to i8*
  store i32* %thread_id99, i32** %300
  %1183 = bitcast i32*** %301 to i8**
  store i32** %300, i32*** %301
  %1184 = load i8*, i8** %1183
  call void @pthread_create(i8* %1184, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.99 to i8*), i8* %1182)
  %1185 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %302, i32 0, i32 0
  store %FIFO* %905, %FIFO** %1185
  %1186 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %302, i32 0, i32 1
  store %FIFO* %921, %FIFO** %1186
  %1187 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %302, i32 0, i32 2
  store %FIFO* %937, %FIFO** %1187
  %1188 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %302 to i8*
  store i32* %thread_id100, i32** %303
  %1189 = bitcast i32*** %304 to i8**
  store i32** %303, i32*** %304
  %1190 = load i8*, i8** %1189
  call void @pthread_create(i8* %1190, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.100 to i8*), i8* %1188)
  %1191 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %305, i32 0, i32 0
  store %FIFO* %906, %FIFO** %1191
  %1192 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %305, i32 0, i32 1
  store %FIFO* %922, %FIFO** %1192
  %1193 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %305, i32 0, i32 2
  store %FIFO* %938, %FIFO** %1193
  %1194 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %305 to i8*
  store i32* %thread_id101, i32** %306
  %1195 = bitcast i32*** %307 to i8**
  store i32** %306, i32*** %307
  %1196 = load i8*, i8** %1195
  call void @pthread_create(i8* %1196, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.101 to i8*), i8* %1194)
  %1197 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %308, i32 0, i32 0
  store %FIFO* %907, %FIFO** %1197
  %1198 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %308, i32 0, i32 1
  store %FIFO* %923, %FIFO** %1198
  %1199 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %308, i32 0, i32 2
  store %FIFO* %939, %FIFO** %1199
  %1200 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %308 to i8*
  store i32* %thread_id102, i32** %309
  %1201 = bitcast i32*** %310 to i8**
  store i32** %309, i32*** %310
  %1202 = load i8*, i8** %1201
  call void @pthread_create(i8* %1202, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.102 to i8*), i8* %1200)
  %1203 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %311, i32 0, i32 0
  store %FIFO* %908, %FIFO** %1203
  %1204 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %311, i32 0, i32 1
  store %FIFO* %924, %FIFO** %1204
  %1205 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %311, i32 0, i32 2
  store %FIFO* %940, %FIFO** %1205
  %1206 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %311 to i8*
  store i32* %thread_id103, i32** %312
  %1207 = bitcast i32*** %313 to i8**
  store i32** %312, i32*** %313
  %1208 = load i8*, i8** %1207
  call void @pthread_create(i8* %1208, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.103 to i8*), i8* %1206)
  %1209 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %314, i32 0, i32 0
  store %FIFO* %909, %FIFO** %1209
  %1210 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %314, i32 0, i32 1
  store %FIFO* %925, %FIFO** %1210
  %1211 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %314, i32 0, i32 2
  store %FIFO* %941, %FIFO** %1211
  %1212 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %314 to i8*
  store i32* %thread_id104, i32** %315
  %1213 = bitcast i32*** %316 to i8**
  store i32** %315, i32*** %316
  %1214 = load i8*, i8** %1213
  call void @pthread_create(i8* %1214, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.104 to i8*), i8* %1212)
  %1215 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %317, i32 0, i32 0
  store %FIFO* %910, %FIFO** %1215
  %1216 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %317, i32 0, i32 1
  store %FIFO* %926, %FIFO** %1216
  %1217 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %317, i32 0, i32 2
  store %FIFO* %942, %FIFO** %1217
  %1218 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %317 to i8*
  store i32* %thread_id105, i32** %318
  %1219 = bitcast i32*** %319 to i8**
  store i32** %318, i32*** %319
  %1220 = load i8*, i8** %1219
  call void @pthread_create(i8* %1220, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.105 to i8*), i8* %1218)
  %1221 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %320, i32 0, i32 0
  store %FIFO* %911, %FIFO** %1221
  %1222 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %320, i32 0, i32 1
  store %FIFO* %927, %FIFO** %1222
  %1223 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %320, i32 0, i32 2
  store %FIFO* %943, %FIFO** %1223
  %1224 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %320 to i8*
  store i32* %thread_id106, i32** %321
  %1225 = bitcast i32*** %322 to i8**
  store i32** %321, i32*** %322
  %1226 = load i8*, i8** %1225
  call void @pthread_create(i8* %1226, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.106 to i8*), i8* %1224)
  %1227 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %323, i32 0, i32 0
  store %FIFO* %912, %FIFO** %1227
  %1228 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %323, i32 0, i32 1
  store %FIFO* %928, %FIFO** %1228
  %1229 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %323, i32 0, i32 2
  store %FIFO* %944, %FIFO** %1229
  %1230 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %323 to i8*
  store i32* %thread_id107, i32** %324
  %1231 = bitcast i32*** %325 to i8**
  store i32** %324, i32*** %325
  %1232 = load i8*, i8** %1231
  call void @pthread_create(i8* %1232, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.107 to i8*), i8* %1230)
  %1233 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %326, i32 0, i32 0
  store %FIFO* %913, %FIFO** %1233
  %1234 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %326, i32 0, i32 1
  store %FIFO* %929, %FIFO** %1234
  %1235 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %326, i32 0, i32 2
  store %FIFO* %945, %FIFO** %1235
  %1236 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %326 to i8*
  store i32* %thread_id108, i32** %327
  %1237 = bitcast i32*** %328 to i8**
  store i32** %327, i32*** %328
  %1238 = load i8*, i8** %1237
  call void @pthread_create(i8* %1238, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.108 to i8*), i8* %1236)
  %1239 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %329, i32 0, i32 0
  store %FIFO* %914, %FIFO** %1239
  %1240 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %329, i32 0, i32 1
  store %FIFO* %930, %FIFO** %1240
  %1241 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %329, i32 0, i32 2
  store %FIFO* %946, %FIFO** %1241
  %1242 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %329 to i8*
  store i32* %thread_id109, i32** %330
  %1243 = bitcast i32*** %331 to i8**
  store i32** %330, i32*** %331
  %1244 = load i8*, i8** %1243
  call void @pthread_create(i8* %1244, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.109 to i8*), i8* %1242)
  %1245 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %332, i32 0, i32 0
  store %FIFO* %915, %FIFO** %1245
  %1246 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %332, i32 0, i32 1
  store %FIFO* %931, %FIFO** %1246
  %1247 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %332, i32 0, i32 2
  store %FIFO* %947, %FIFO** %1247
  %1248 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %332 to i8*
  store i32* %thread_id110, i32** %333
  %1249 = bitcast i32*** %334 to i8**
  store i32** %333, i32*** %334
  %1250 = load i8*, i8** %1249
  call void @pthread_create(i8* %1250, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.110 to i8*), i8* %1248)
  %1251 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %335, i32 0, i32 0
  store %FIFO* %932, %FIFO** %1251
  %1252 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %335, i32 0, i32 1
  store %FIFO* %940, %FIFO** %1252
  %1253 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %335, i32 0, i32 2
  store %FIFO* %948, %FIFO** %1253
  %1254 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %335 to i8*
  store i32* %thread_id111, i32** %336
  %1255 = bitcast i32*** %337 to i8**
  store i32** %336, i32*** %337
  %1256 = load i8*, i8** %1255
  call void @pthread_create(i8* %1256, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.111 to i8*), i8* %1254)
  %1257 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %338, i32 0, i32 0
  store %FIFO* %933, %FIFO** %1257
  %1258 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %338, i32 0, i32 1
  store %FIFO* %941, %FIFO** %1258
  %1259 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %338, i32 0, i32 2
  store %FIFO* %949, %FIFO** %1259
  %1260 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %338 to i8*
  store i32* %thread_id112, i32** %339
  %1261 = bitcast i32*** %340 to i8**
  store i32** %339, i32*** %340
  %1262 = load i8*, i8** %1261
  call void @pthread_create(i8* %1262, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.112 to i8*), i8* %1260)
  %1263 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %341, i32 0, i32 0
  store %FIFO* %934, %FIFO** %1263
  %1264 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %341, i32 0, i32 1
  store %FIFO* %942, %FIFO** %1264
  %1265 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %341, i32 0, i32 2
  store %FIFO* %950, %FIFO** %1265
  %1266 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %341 to i8*
  store i32* %thread_id113, i32** %342
  %1267 = bitcast i32*** %343 to i8**
  store i32** %342, i32*** %343
  %1268 = load i8*, i8** %1267
  call void @pthread_create(i8* %1268, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.113 to i8*), i8* %1266)
  %1269 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %344, i32 0, i32 0
  store %FIFO* %935, %FIFO** %1269
  %1270 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %344, i32 0, i32 1
  store %FIFO* %943, %FIFO** %1270
  %1271 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %344, i32 0, i32 2
  store %FIFO* %951, %FIFO** %1271
  %1272 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %344 to i8*
  store i32* %thread_id114, i32** %345
  %1273 = bitcast i32*** %346 to i8**
  store i32** %345, i32*** %346
  %1274 = load i8*, i8** %1273
  call void @pthread_create(i8* %1274, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.114 to i8*), i8* %1272)
  %1275 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %347, i32 0, i32 0
  store %FIFO* %936, %FIFO** %1275
  %1276 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %347, i32 0, i32 1
  store %FIFO* %944, %FIFO** %1276
  %1277 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %347, i32 0, i32 2
  store %FIFO* %952, %FIFO** %1277
  %1278 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %347 to i8*
  store i32* %thread_id115, i32** %348
  %1279 = bitcast i32*** %349 to i8**
  store i32** %348, i32*** %349
  %1280 = load i8*, i8** %1279
  call void @pthread_create(i8* %1280, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.115 to i8*), i8* %1278)
  %1281 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %350, i32 0, i32 0
  store %FIFO* %937, %FIFO** %1281
  %1282 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %350, i32 0, i32 1
  store %FIFO* %945, %FIFO** %1282
  %1283 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %350, i32 0, i32 2
  store %FIFO* %953, %FIFO** %1283
  %1284 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %350 to i8*
  store i32* %thread_id116, i32** %351
  %1285 = bitcast i32*** %352 to i8**
  store i32** %351, i32*** %352
  %1286 = load i8*, i8** %1285
  call void @pthread_create(i8* %1286, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.116 to i8*), i8* %1284)
  %1287 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %353, i32 0, i32 0
  store %FIFO* %938, %FIFO** %1287
  %1288 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %353, i32 0, i32 1
  store %FIFO* %946, %FIFO** %1288
  %1289 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %353, i32 0, i32 2
  store %FIFO* %954, %FIFO** %1289
  %1290 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %353 to i8*
  store i32* %thread_id117, i32** %354
  %1291 = bitcast i32*** %355 to i8**
  store i32** %354, i32*** %355
  %1292 = load i8*, i8** %1291
  call void @pthread_create(i8* %1292, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.117 to i8*), i8* %1290)
  %1293 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %356, i32 0, i32 0
  store %FIFO* %939, %FIFO** %1293
  %1294 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %356, i32 0, i32 1
  store %FIFO* %947, %FIFO** %1294
  %1295 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %356, i32 0, i32 2
  store %FIFO* %955, %FIFO** %1295
  %1296 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %356 to i8*
  store i32* %thread_id118, i32** %357
  %1297 = bitcast i32*** %358 to i8**
  store i32** %357, i32*** %358
  %1298 = load i8*, i8** %1297
  call void @pthread_create(i8* %1298, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.118 to i8*), i8* %1296)
  %1299 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %359, i32 0, i32 0
  store %FIFO* %948, %FIFO** %1299
  %1300 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %359, i32 0, i32 1
  store %FIFO* %952, %FIFO** %1300
  %1301 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %359, i32 0, i32 2
  store %FIFO* %956, %FIFO** %1301
  %1302 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %359 to i8*
  store i32* %thread_id119, i32** %360
  %1303 = bitcast i32*** %361 to i8**
  store i32** %360, i32*** %361
  %1304 = load i8*, i8** %1303
  call void @pthread_create(i8* %1304, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.119 to i8*), i8* %1302)
  %1305 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %362, i32 0, i32 0
  store %FIFO* %949, %FIFO** %1305
  %1306 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %362, i32 0, i32 1
  store %FIFO* %953, %FIFO** %1306
  %1307 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %362, i32 0, i32 2
  store %FIFO* %957, %FIFO** %1307
  %1308 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %362 to i8*
  store i32* %thread_id120, i32** %363
  %1309 = bitcast i32*** %364 to i8**
  store i32** %363, i32*** %364
  %1310 = load i8*, i8** %1309
  call void @pthread_create(i8* %1310, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.120 to i8*), i8* %1308)
  %1311 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %365, i32 0, i32 0
  store %FIFO* %950, %FIFO** %1311
  %1312 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %365, i32 0, i32 1
  store %FIFO* %954, %FIFO** %1312
  %1313 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %365, i32 0, i32 2
  store %FIFO* %958, %FIFO** %1313
  %1314 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %365 to i8*
  store i32* %thread_id121, i32** %366
  %1315 = bitcast i32*** %367 to i8**
  store i32** %366, i32*** %367
  %1316 = load i8*, i8** %1315
  call void @pthread_create(i8* %1316, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.121 to i8*), i8* %1314)
  %1317 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %368, i32 0, i32 0
  store %FIFO* %951, %FIFO** %1317
  %1318 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %368, i32 0, i32 1
  store %FIFO* %955, %FIFO** %1318
  %1319 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %368, i32 0, i32 2
  store %FIFO* %959, %FIFO** %1319
  %1320 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %368 to i8*
  store i32* %thread_id122, i32** %369
  %1321 = bitcast i32*** %370 to i8**
  store i32** %369, i32*** %370
  %1322 = load i8*, i8** %1321
  call void @pthread_create(i8* %1322, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.122 to i8*), i8* %1320)
  %1323 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %371, i32 0, i32 0
  store %FIFO* %956, %FIFO** %1323
  %1324 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %371, i32 0, i32 1
  store %FIFO* %958, %FIFO** %1324
  %1325 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %371, i32 0, i32 2
  store %FIFO* %960, %FIFO** %1325
  %1326 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %371 to i8*
  store i32* %thread_id123, i32** %372
  %1327 = bitcast i32*** %373 to i8**
  store i32** %372, i32*** %373
  %1328 = load i8*, i8** %1327
  call void @pthread_create(i8* %1328, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.123 to i8*), i8* %1326)
  %1329 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %374, i32 0, i32 0
  store %FIFO* %957, %FIFO** %1329
  %1330 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %374, i32 0, i32 1
  store %FIFO* %959, %FIFO** %1330
  %1331 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %374, i32 0, i32 2
  store %FIFO* %961, %FIFO** %1331
  %1332 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %374 to i8*
  store i32* %thread_id124, i32** %375
  %1333 = bitcast i32*** %376 to i8**
  store i32** %375, i32*** %376
  %1334 = load i8*, i8** %1333
  call void @pthread_create(i8* %1334, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.124 to i8*), i8* %1332)
  %1335 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %377, i32 0, i32 0
  store %FIFO* %960, %FIFO** %1335
  %1336 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %377, i32 0, i32 1
  store %FIFO* %961, %FIFO** %1336
  %1337 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %377, i32 0, i32 2
  store %FIFO* %962, %FIFO** %1337
  %1338 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %377 to i8*
  store i32* %thread_id125, i32** %378
  %1339 = bitcast i32*** %379 to i8**
  store i32** %378, i32*** %379
  %1340 = load i8*, i8** %1339
  call void @pthread_create(i8* %1340, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.125 to i8*), i8* %1338)
  %1341 = load { i8*, i64, i64 }, { i8*, i64, i64 }* @main.input
  %1342 = extractvalue { i8*, i64, i64 } %1341, 1
  %1343 = bitcast [2 x { i8*, i8* }]* %varargs to i8*
  %1344 = bitcast i8* %1343 to { i8*, i8* }*
  %1345 = getelementptr { i8*, i8* }, { i8*, i8* }* %1344, i64 0
  %1346 = bitcast { i8*, i8* }* %1345 to i8*
  store { i8*, i64 } { i8* getelementptr inbounds ([9 x i8], [9 x i8]* @3, i32 0, i32 0), i64 9 }, { i8*, i64 }* %380
  %1347 = bitcast { i8*, i64 }* %380 to i8*
  %1348 = insertvalue { i8*, i8* } { i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_string, i32 0, i32 0), i8* undef }, i8* %1347, 1
  %1349 = bitcast i8* %1346 to { i8*, i8* }*
  store { i8*, i8* } %1348, { i8*, i8* }* %1349
  %1350 = bitcast i8* %1343 to { i8*, i8* }*
  %1351 = getelementptr { i8*, i8* }, { i8*, i8* }* %1350, i64 1
  %1352 = bitcast { i8*, i8* }* %1351 to i8*
  store i64 %1342, i64* %381
  %1353 = bitcast i64* %381 to i8*
  %1354 = insertvalue { i8*, i8* } { i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_int, i32 0, i32 0), i8* undef }, i8* %1353, 1
  %1355 = bitcast i8* %1352 to { i8*, i8* }*
  store { i8*, i8* } %1354, { i8*, i8* }* %1355
  %1356 = getelementptr inbounds i8, i8* %1343, i64 0
  %1357 = insertvalue { i8*, i64, i64 } undef, i8* %1356, 0
  %1358 = insertvalue { i8*, i64, i64 } %1357, i64 2, 1
  %1359 = insertvalue { i8*, i64, i64 } %1358, i64 2, 2
  store { i8*, i64, i64 } %1359, { i8*, i64, i64 }* %382
  call void @fmt.Println({ i64, { i8*, i8* } }* sret %383, i8* nest undef, { i8*, i64, i64 }* byval %382)
  %1360 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %383, i32 0, i32 0
  %1361 = load i64, i64* %1360
  %1362 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %383, i32 0, i32 1
  %1363 = load { i8*, i8* }, { i8*, i8* }* %1362
  %1364 = load { i8*, i64, i64 }, { i8*, i64, i64 }* @main.input
  %1365 = extractvalue { i8*, i64, i64 } %1364, 1
  br label %.1.rangeindex.loop

.1.rangeindex.loop:                               ; preds = %.2.rangeindex.body, %.0.entry
  %1366 = phi i64 [ -1, %.0.entry ], [ %1367, %.2.rangeindex.body ]
  %1367 = add i64 %1366, 1
  %1368 = icmp slt i64 %1367, %1365
  %1369 = zext i1 %1368 to i8
  %1370 = trunc i8 %1369 to i1
  br i1 %1370, label %.2.rangeindex.body, label %.3.rangeindex.done

.2.rangeindex.body:                               ; preds = %.1.rangeindex.loop
  %1371 = extractvalue { i8*, i64, i64 } %1364, 0
  %1372 = bitcast i8* %1371 to i64*
  %1373 = getelementptr i64, i64* %1372, i64 %1367
  %1374 = bitcast i64* %1373 to i8*
  %1375 = bitcast i8* %1374 to i64*
  %1376 = load i64, i64* %1375
  call void @fifo_write(%FIFO* %395, i64 %1376)
  br label %.1.rangeindex.loop

.3.rangeindex.done:                               ; preds = %.1.rangeindex.loop
  call void @fifo_write(%FIFO* %395, i64 -1)
  %1377 = load { i8*, i64, i64 }, { i8*, i64, i64 }* @main.input
  %1378 = extractvalue { i8*, i64, i64 } %1377, 1
  call void @__go_make_slice2({ i8*, i64, i64 }* sret %384, i8* nest undef, i8* getelementptr inbounds (%sliceType, %sliceType* @__go_td_AN3_inte, i32 0, i32 0, i32 0), i64 %1378, i64 %1378)
  %1379 = load { i8*, i64, i64 }, { i8*, i64, i64 }* %384
  %1380 = load { i8*, i64, i64 }, { i8*, i64, i64 }* @main.input
  %1381 = extractvalue { i8*, i64, i64 } %1380, 1
  br label %.4.rangeindex.loop

.4.rangeindex.loop:                               ; preds = %.7.if.then, %.5.rangeindex.body, %.3.rangeindex.done
  %1382 = phi i64 [ -1, %.3.rangeindex.done ], [ %1383, %.5.rangeindex.body ], [ %1383, %.7.if.then ]
  %1383 = add i64 %1382, 1
  %1384 = icmp slt i64 %1383, %1381
  %1385 = zext i1 %1384 to i8
  %1386 = trunc i8 %1385 to i1
  br i1 %1386, label %.5.rangeindex.body, label %.6.rangeindex.done

.5.rangeindex.body:                               ; preds = %.4.rangeindex.loop
  %1387 = extractvalue { i8*, i64, i64 } %1379, 0
  %1388 = bitcast i8* %1387 to i64*
  %1389 = getelementptr i64, i64* %1388, i64 %1383
  %1390 = bitcast i64* %1389 to i8*
  %1391 = call i64 @fifo_read(%FIFO* %962)
  store i64 %1391, i64* %385
  %1392 = load i64, i64* %385
  %1393 = bitcast i8* %1390 to i64*
  store i64 %1392, i64* %1393
  %1394 = extractvalue { i8*, i64, i64 } %1379, 0
  %1395 = bitcast i8* %1394 to i64*
  %1396 = getelementptr i64, i64* %1395, i64 %1383
  %1397 = bitcast i64* %1396 to i8*
  %1398 = bitcast i8* %1397 to i64*
  %1399 = load i64, i64* %1398
  %1400 = bitcast [1 x { i8*, i8* }]* %varargs126 to i8*
  %1401 = bitcast i8* %1400 to { i8*, i8* }*
  %1402 = getelementptr { i8*, i8* }, { i8*, i8* }* %1401, i64 0
  %1403 = bitcast { i8*, i8* }* %1402 to i8*
  store i64 %1399, i64* %386
  %1404 = bitcast i64* %386 to i8*
  %1405 = insertvalue { i8*, i8* } { i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_int, i32 0, i32 0), i8* undef }, i8* %1404, 1
  %1406 = bitcast i8* %1403 to { i8*, i8* }*
  store { i8*, i8* } %1405, { i8*, i8* }* %1406
  %1407 = getelementptr inbounds i8, i8* %1400, i64 0
  %1408 = insertvalue { i8*, i64, i64 } undef, i8* %1407, 0
  %1409 = insertvalue { i8*, i64, i64 } %1408, i64 1, 1
  %1410 = insertvalue { i8*, i64, i64 } %1409, i64 1, 2
  store { i8*, i64 } { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @4, i32 0, i32 0), i64 4 }, { i8*, i64 }* %387
  %1411 = getelementptr inbounds { i8*, i64 }, { i8*, i64 }* %387, i32 0, i32 0
  %1412 = load i8*, i8** %1411
  %1413 = getelementptr inbounds { i8*, i64 }, { i8*, i64 }* %387, i32 0, i32 1
  %1414 = load i64, i64* %1413
  store { i8*, i64, i64 } %1410, { i8*, i64, i64 }* %388
  call void @fmt.Printf({ i64, { i8*, i8* } }* sret %389, i8* nest undef, i8* %1412, i64 %1414, { i8*, i64, i64 }* byval %388)
  %1415 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %389, i32 0, i32 0
  %1416 = load i64, i64* %1415
  %1417 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %389, i32 0, i32 1
  %1418 = load { i8*, i8* }, { i8*, i8* }* %1417
  %1419 = srem i64 %1383, 8
  %1420 = icmp eq i64 %1419, 7
  %1421 = zext i1 %1420 to i8
  %1422 = trunc i8 %1421 to i1
  br i1 %1422, label %.7.if.then, label %.4.rangeindex.loop

.6.rangeindex.done:                               ; preds = %.4.rangeindex.loop
  store { i8*, i64, i64 } %1379, { i8*, i64, i64 }* %393
  call void @main.checkSort(i8* nest undef, { i8*, i64, i64 }* byval %393)
  ret void

.7.if.then:                                       ; preds = %.5.rangeindex.body
  store { i8*, i64 } { i8* getelementptr inbounds ([1 x i8], [1 x i8]* @5, i32 0, i32 0), i64 1 }, { i8*, i64 }* %390
  %1423 = getelementptr inbounds { i8*, i64 }, { i8*, i64 }* %390, i32 0, i32 0
  %1424 = load i8*, i8** %1423
  %1425 = getelementptr inbounds { i8*, i64 }, { i8*, i64 }* %390, i32 0, i32 1
  %1426 = load i64, i64* %1425
  store { i8*, i64, i64 } zeroinitializer, { i8*, i64, i64 }* %391
  call void @fmt.Printf({ i64, { i8*, i8* } }* sret %392, i8* nest undef, i8* %1424, i64 %1426, { i8*, i64, i64 }* byval %391)
  %1427 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %392, i32 0, i32 0
  %1428 = load i64, i64* %1427
  %1429 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %392, i32 0, i32 1
  %1430 = load { i8*, i8* }, { i8*, i8* }* %1429
  br label %.4.rangeindex.loop
}

define internal void @18(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper(i8*) #0 {
entry:
  call void @18(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @19(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.1(i8*) #0 {
entry:
  call void @19(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @20(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.2(i8*) #0 {
entry:
  call void @20(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @21(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.3(i8*) #0 {
entry:
  call void @21(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @22(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.4(i8*) #0 {
entry:
  call void @22(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @23(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.5(i8*) #0 {
entry:
  call void @23(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @24(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.6(i8*) #0 {
entry:
  call void @24(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @25(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.7(i8*) #0 {
entry:
  call void @25(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @26(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.8(i8*) #0 {
entry:
  call void @26(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @27(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.9(i8*) #0 {
entry:
  call void @27(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @28(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.10(i8*) #0 {
entry:
  call void @28(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @29(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.11(i8*) #0 {
entry:
  call void @29(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @30(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.12(i8*) #0 {
entry:
  call void @30(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @31(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.13(i8*) #0 {
entry:
  call void @31(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @32(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.14(i8*) #0 {
entry:
  call void @32(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @33(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.15(i8*) #0 {
entry:
  call void @33(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @34(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.16(i8*) #0 {
entry:
  call void @34(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @35(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.17(i8*) #0 {
entry:
  call void @35(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @36(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.18(i8*) #0 {
entry:
  call void @36(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @37(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.19(i8*) #0 {
entry:
  call void @37(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @38(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.20(i8*) #0 {
entry:
  call void @38(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @39(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.21(i8*) #0 {
entry:
  call void @39(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @40(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.22(i8*) #0 {
entry:
  call void @40(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @41(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.23(i8*) #0 {
entry:
  call void @41(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @42(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.24(i8*) #0 {
entry:
  call void @42(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @43(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.25(i8*) #0 {
entry:
  call void @43(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @44(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.26(i8*) #0 {
entry:
  call void @44(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @45(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.27(i8*) #0 {
entry:
  call void @45(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @46(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.28(i8*) #0 {
entry:
  call void @46(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @47(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.29(i8*) #0 {
entry:
  call void @47(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @48(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.30(i8*) #0 {
entry:
  call void @48(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @49(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.31(i8*) #0 {
entry:
  call void @49(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @50(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.32(i8*) #0 {
entry:
  call void @50(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @51(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.33(i8*) #0 {
entry:
  call void @51(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @52(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.34(i8*) #0 {
entry:
  call void @52(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @53(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.35(i8*) #0 {
entry:
  call void @53(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @54(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.36(i8*) #0 {
entry:
  call void @54(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @55(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.37(i8*) #0 {
entry:
  call void @55(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @56(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.38(i8*) #0 {
entry:
  call void @56(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @57(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.39(i8*) #0 {
entry:
  call void @57(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @58(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.40(i8*) #0 {
entry:
  call void @58(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @59(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.41(i8*) #0 {
entry:
  call void @59(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @60(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.42(i8*) #0 {
entry:
  call void @60(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @61(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.43(i8*) #0 {
entry:
  call void @61(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @62(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.44(i8*) #0 {
entry:
  call void @62(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @63(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.45(i8*) #0 {
entry:
  call void @63(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @64(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.46(i8*) #0 {
entry:
  call void @64(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @65(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.47(i8*) #0 {
entry:
  call void @65(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @66(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.48(i8*) #0 {
entry:
  call void @66(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @67(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.49(i8*) #0 {
entry:
  call void @67(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @68(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.50(i8*) #0 {
entry:
  call void @68(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @69(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.51(i8*) #0 {
entry:
  call void @69(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @70(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.52(i8*) #0 {
entry:
  call void @70(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @71(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.53(i8*) #0 {
entry:
  call void @71(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @72(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.54(i8*) #0 {
entry:
  call void @72(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @73(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.55(i8*) #0 {
entry:
  call void @73(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @74(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.56(i8*) #0 {
entry:
  call void @74(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @75(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.57(i8*) #0 {
entry:
  call void @75(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @76(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.58(i8*) #0 {
entry:
  call void @76(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @77(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.59(i8*) #0 {
entry:
  call void @77(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @78(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.60(i8*) #0 {
entry:
  call void @78(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @79(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.61(i8*) #0 {
entry:
  call void @79(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @80(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.62(i8*) #0 {
entry:
  call void @80(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @81(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.merge(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal void @main.merge(i8* nest, %FIFO* %in_left, %FIFO* %in_right, %FIFO* %out) #0 {
prologue:
  %1 = alloca i64
  %2 = alloca i64
  %3 = alloca i64
  %4 = alloca i64
  %5 = alloca i64
  %6 = alloca i64
  %7 = alloca i64
  %8 = alloca i64
  br label %.0.entry

.0.entry:                                         ; preds = %prologue
  %9 = call i64 @fifo_read(%FIFO* %in_left)
  store i64 %9, i64* %1
  %10 = load i64, i64* %1
  %11 = call i64 @fifo_read(%FIFO* %in_right)
  store i64 %11, i64* %2
  %12 = load i64, i64* %2
  br label %.1.for.body

.1.for.body:                                      ; preds = %.11.if.then, %.10.if.else, %.9.if.then, %.7.if.then, %.5.if.then, %.2.if.then, %.0.entry
  %l = phi i64 [ %10, %.0.entry ], [ %17, %.2.if.then ], [ %l, %.5.if.then ], [ %32, %.7.if.then ], [ %l, %.9.if.then ], [ %42, %.11.if.then ], [ %l, %.10.if.else ]
  %r = phi i64 [ %12, %.0.entry ], [ %19, %.2.if.then ], [ %27, %.5.if.then ], [ %r, %.7.if.then ], [ %37, %.9.if.then ], [ %r, %.11.if.then ], [ %r, %.10.if.else ]
  %13 = icmp eq i64 %l, -1
  %14 = zext i1 %13 to i8
  %15 = trunc i8 %14 to i1
  br i1 %15, label %.4.cond.true, label %.3.if.else

.2.if.then:                                       ; preds = %.4.cond.true
  call void @fifo_write(%FIFO* %out, i64 -1)
  %16 = call i64 @fifo_read(%FIFO* %in_left)
  store i64 %16, i64* %3
  %17 = load i64, i64* %3
  %18 = call i64 @fifo_read(%FIFO* %in_right)
  store i64 %18, i64* %4
  %19 = load i64, i64* %4
  br label %.1.for.body

.3.if.else:                                       ; preds = %.4.cond.true, %.1.for.body
  %20 = icmp eq i64 %l, -1
  %21 = zext i1 %20 to i8
  %22 = trunc i8 %21 to i1
  br i1 %22, label %.5.if.then, label %.6.if.else

.4.cond.true:                                     ; preds = %.1.for.body
  %23 = icmp eq i64 %r, -1
  %24 = zext i1 %23 to i8
  %25 = trunc i8 %24 to i1
  br i1 %25, label %.2.if.then, label %.3.if.else

.5.if.then:                                       ; preds = %.3.if.else
  call void @fifo_write(%FIFO* %out, i64 %r)
  %26 = call i64 @fifo_read(%FIFO* %in_right)
  store i64 %26, i64* %5
  %27 = load i64, i64* %5
  br label %.1.for.body

.6.if.else:                                       ; preds = %.3.if.else
  %28 = icmp eq i64 %r, -1
  %29 = zext i1 %28 to i8
  %30 = trunc i8 %29 to i1
  br i1 %30, label %.7.if.then, label %.8.if.else

.7.if.then:                                       ; preds = %.6.if.else
  call void @fifo_write(%FIFO* %out, i64 %l)
  %31 = call i64 @fifo_read(%FIFO* %in_left)
  store i64 %31, i64* %6
  %32 = load i64, i64* %6
  br label %.1.for.body

.8.if.else:                                       ; preds = %.6.if.else
  %33 = icmp sle i64 %r, %l
  %34 = zext i1 %33 to i8
  %35 = trunc i8 %34 to i1
  br i1 %35, label %.9.if.then, label %.10.if.else

.9.if.then:                                       ; preds = %.8.if.else
  call void @fifo_write(%FIFO* %out, i64 %r)
  %36 = call i64 @fifo_read(%FIFO* %in_right)
  store i64 %36, i64* %7
  %37 = load i64, i64* %7
  br label %.1.for.body

.10.if.else:                                      ; preds = %.8.if.else
  %38 = icmp sle i64 %l, %r
  %39 = zext i1 %38 to i8
  %40 = trunc i8 %39 to i1
  br i1 %40, label %.11.if.then, label %.1.for.body

.11.if.then:                                      ; preds = %.10.if.else
  call void @fifo_write(%FIFO* %out, i64 %l)
  %41 = call i64 @fifo_read(%FIFO* %in_left)
  store i64 %41, i64* %8
  %42 = load i64, i64* %8
  br label %.1.for.body
}

define internal i8* @auto_pthread_wrapper.63(i8*) #0 {
entry:
  call void @81(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @82(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.merge(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.64(i8*) #0 {
entry:
  call void @82(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @83(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.merge(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.65(i8*) #0 {
entry:
  call void @83(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @84(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.merge(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.66(i8*) #0 {
entry:
  call void @84(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @85(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.merge(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.67(i8*) #0 {
entry:
  call void @85(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @86(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.merge(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.68(i8*) #0 {
entry:
  call void @86(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @87(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.merge(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.69(i8*) #0 {
entry:
  call void @87(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @88(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.merge(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.70(i8*) #0 {
entry:
  call void @88(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @89(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.merge(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.71(i8*) #0 {
entry:
  call void @89(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @90(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.merge(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.72(i8*) #0 {
entry:
  call void @90(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @91(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.merge(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.73(i8*) #0 {
entry:
  call void @91(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @92(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.merge(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.74(i8*) #0 {
entry:
  call void @92(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @93(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.merge(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.75(i8*) #0 {
entry:
  call void @93(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @94(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.merge(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.76(i8*) #0 {
entry:
  call void @94(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @95(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.merge(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.77(i8*) #0 {
entry:
  call void @95(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @96(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.merge(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.78(i8*) #0 {
entry:
  call void @96(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @97(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.merge(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.79(i8*) #0 {
entry:
  call void @97(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @98(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.merge(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.80(i8*) #0 {
entry:
  call void @98(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @99(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.merge(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.81(i8*) #0 {
entry:
  call void @99(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @100(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.merge(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.82(i8*) #0 {
entry:
  call void @100(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @101(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.merge(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.83(i8*) #0 {
entry:
  call void @101(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @102(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.merge(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.84(i8*) #0 {
entry:
  call void @102(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @103(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.merge(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.85(i8*) #0 {
entry:
  call void @103(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @104(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.merge(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.86(i8*) #0 {
entry:
  call void @104(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @105(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.merge(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.87(i8*) #0 {
entry:
  call void @105(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @106(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.merge(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.88(i8*) #0 {
entry:
  call void @106(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @107(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.merge(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.89(i8*) #0 {
entry:
  call void @107(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @108(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.merge(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.90(i8*) #0 {
entry:
  call void @108(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @109(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.merge(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.91(i8*) #0 {
entry:
  call void @109(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @110(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.merge(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.92(i8*) #0 {
entry:
  call void @110(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @111(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.merge(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.93(i8*) #0 {
entry:
  call void @111(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @112(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.merge(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.94(i8*) #0 {
entry:
  call void @112(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @113(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.merge(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.95(i8*) #0 {
entry:
  call void @113(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @114(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.merge(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.96(i8*) #0 {
entry:
  call void @114(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @115(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.merge(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.97(i8*) #0 {
entry:
  call void @115(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @116(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.merge(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.98(i8*) #0 {
entry:
  call void @116(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @117(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.merge(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.99(i8*) #0 {
entry:
  call void @117(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @118(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.merge(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.100(i8*) #0 {
entry:
  call void @118(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @119(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.merge(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.101(i8*) #0 {
entry:
  call void @119(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @120(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.merge(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.102(i8*) #0 {
entry:
  call void @120(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @121(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.merge(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.103(i8*) #0 {
entry:
  call void @121(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @122(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.merge(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.104(i8*) #0 {
entry:
  call void @122(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @123(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.merge(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.105(i8*) #0 {
entry:
  call void @123(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @124(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.merge(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.106(i8*) #0 {
entry:
  call void @124(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @125(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.merge(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.107(i8*) #0 {
entry:
  call void @125(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @126(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.merge(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.108(i8*) #0 {
entry:
  call void @126(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @127(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.merge(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.109(i8*) #0 {
entry:
  call void @127(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @128(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.merge(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.110(i8*) #0 {
entry:
  call void @128(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @129(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.merge(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.111(i8*) #0 {
entry:
  call void @129(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @130(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.merge(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.112(i8*) #0 {
entry:
  call void @130(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @131(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.merge(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.113(i8*) #0 {
entry:
  call void @131(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @132(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.merge(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.114(i8*) #0 {
entry:
  call void @132(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @133(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.merge(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.115(i8*) #0 {
entry:
  call void @133(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @134(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.merge(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.116(i8*) #0 {
entry:
  call void @134(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @135(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.merge(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.117(i8*) #0 {
entry:
  call void @135(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @136(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.merge(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.118(i8*) #0 {
entry:
  call void @136(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @137(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.merge(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.119(i8*) #0 {
entry:
  call void @137(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @138(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.merge(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.120(i8*) #0 {
entry:
  call void @138(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @139(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.merge(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.121(i8*) #0 {
entry:
  call void @139(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @140(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.merge(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.122(i8*) #0 {
entry:
  call void @140(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @141(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.merge(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.123(i8*) #0 {
entry:
  call void @141(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @142(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.merge(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.124(i8*) #0 {
entry:
  call void @142(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @143(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.merge(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.125(i8*) #0 {
entry:
  call void @143(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

declare void @fmt.Printf({ i64, { i8*, i8* } }* sret, i8* nest, i8*, i64, { i8*, i64, i64 }* byval)

define void @__go_init_main(i8*) #0 {
entry:
  ret void
}

attributes #0 = { "disable-tail-calls"="true" "split-stack" }

!0 = !{!"branch_weights", i32 1, i32 1000}
