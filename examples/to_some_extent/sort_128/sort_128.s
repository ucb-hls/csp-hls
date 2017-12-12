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
  %slicelit = alloca [128 x i64]
  br label %.0.entry

.0.entry:                                         ; preds = %prologue
  %1 = bitcast [128 x i64]* %slicelit to i8*
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
  %258 = bitcast i8* %1 to i64*
  %259 = getelementptr i64, i64* %258, i64 64
  %260 = bitcast i64* %259 to i8*
  %261 = bitcast i8* %260 to i64*
  store i64 2894245200, i64* %261
  %262 = bitcast i8* %1 to i64*
  %263 = getelementptr i64, i64* %262, i64 65
  %264 = bitcast i64* %263 to i8*
  %265 = bitcast i8* %264 to i64*
  store i64 1942928367, i64* %265
  %266 = bitcast i8* %1 to i64*
  %267 = getelementptr i64, i64* %266, i64 66
  %268 = bitcast i64* %267 to i8*
  %269 = bitcast i8* %268 to i64*
  store i64 2258053571, i64* %269
  %270 = bitcast i8* %1 to i64*
  %271 = getelementptr i64, i64* %270, i64 67
  %272 = bitcast i64* %271 to i8*
  %273 = bitcast i8* %272 to i64*
  store i64 3848661259, i64* %273
  %274 = bitcast i8* %1 to i64*
  %275 = getelementptr i64, i64* %274, i64 68
  %276 = bitcast i64* %275 to i8*
  %277 = bitcast i8* %276 to i64*
  store i64 2222038483, i64* %277
  %278 = bitcast i8* %1 to i64*
  %279 = getelementptr i64, i64* %278, i64 69
  %280 = bitcast i64* %279 to i8*
  %281 = bitcast i8* %280 to i64*
  store i64 2686925273, i64* %281
  %282 = bitcast i8* %1 to i64*
  %283 = getelementptr i64, i64* %282, i64 70
  %284 = bitcast i64* %283 to i8*
  %285 = bitcast i8* %284 to i64*
  store i64 3442776410, i64* %285
  %286 = bitcast i8* %1 to i64*
  %287 = getelementptr i64, i64* %286, i64 71
  %288 = bitcast i64* %287 to i8*
  %289 = bitcast i8* %288 to i64*
  store i64 2831365696, i64* %289
  %290 = bitcast i8* %1 to i64*
  %291 = getelementptr i64, i64* %290, i64 72
  %292 = bitcast i64* %291 to i8*
  %293 = bitcast i8* %292 to i64*
  store i64 1070940061, i64* %293
  %294 = bitcast i8* %1 to i64*
  %295 = getelementptr i64, i64* %294, i64 73
  %296 = bitcast i64* %295 to i8*
  %297 = bitcast i8* %296 to i64*
  store i64 1388297898, i64* %297
  %298 = bitcast i8* %1 to i64*
  %299 = getelementptr i64, i64* %298, i64 74
  %300 = bitcast i64* %299 to i8*
  %301 = bitcast i8* %300 to i64*
  store i64 18687223, i64* %301
  %302 = bitcast i8* %1 to i64*
  %303 = getelementptr i64, i64* %302, i64 75
  %304 = bitcast i64* %303 to i8*
  %305 = bitcast i8* %304 to i64*
  store i64 1607479964, i64* %305
  %306 = bitcast i8* %1 to i64*
  %307 = getelementptr i64, i64* %306, i64 76
  %308 = bitcast i64* %307 to i8*
  %309 = bitcast i8* %308 to i64*
  store i64 1342410857, i64* %309
  %310 = bitcast i8* %1 to i64*
  %311 = getelementptr i64, i64* %310, i64 77
  %312 = bitcast i64* %311 to i8*
  %313 = bitcast i8* %312 to i64*
  store i64 1952136165, i64* %313
  %314 = bitcast i8* %1 to i64*
  %315 = getelementptr i64, i64* %314, i64 78
  %316 = bitcast i64* %315 to i8*
  %317 = bitcast i8* %316 to i64*
  store i64 2869034817, i64* %317
  %318 = bitcast i8* %1 to i64*
  %319 = getelementptr i64, i64* %318, i64 79
  %320 = bitcast i64* %319 to i8*
  %321 = bitcast i8* %320 to i64*
  store i64 2791120240, i64* %321
  %322 = bitcast i8* %1 to i64*
  %323 = getelementptr i64, i64* %322, i64 80
  %324 = bitcast i64* %323 to i8*
  %325 = bitcast i8* %324 to i64*
  store i64 2952991, i64* %325
  %326 = bitcast i8* %1 to i64*
  %327 = getelementptr i64, i64* %326, i64 81
  %328 = bitcast i64* %327 to i8*
  %329 = bitcast i8* %328 to i64*
  store i64 1359631527, i64* %329
  %330 = bitcast i8* %1 to i64*
  %331 = getelementptr i64, i64* %330, i64 82
  %332 = bitcast i64* %331 to i8*
  %333 = bitcast i8* %332 to i64*
  store i64 1014283887, i64* %333
  %334 = bitcast i8* %1 to i64*
  %335 = getelementptr i64, i64* %334, i64 83
  %336 = bitcast i64* %335 to i8*
  %337 = bitcast i8* %336 to i64*
  store i64 2987183663, i64* %337
  %338 = bitcast i8* %1 to i64*
  %339 = getelementptr i64, i64* %338, i64 84
  %340 = bitcast i64* %339 to i8*
  %341 = bitcast i8* %340 to i64*
  store i64 3335203669, i64* %341
  %342 = bitcast i8* %1 to i64*
  %343 = getelementptr i64, i64* %342, i64 85
  %344 = bitcast i64* %343 to i8*
  %345 = bitcast i8* %344 to i64*
  store i64 2097839153, i64* %345
  %346 = bitcast i8* %1 to i64*
  %347 = getelementptr i64, i64* %346, i64 86
  %348 = bitcast i64* %347 to i8*
  %349 = bitcast i8* %348 to i64*
  store i64 3877339232, i64* %349
  %350 = bitcast i8* %1 to i64*
  %351 = getelementptr i64, i64* %350, i64 87
  %352 = bitcast i64* %351 to i8*
  %353 = bitcast i8* %352 to i64*
  store i64 1196102363, i64* %353
  %354 = bitcast i8* %1 to i64*
  %355 = getelementptr i64, i64* %354, i64 88
  %356 = bitcast i64* %355 to i8*
  %357 = bitcast i8* %356 to i64*
  store i64 2083234033, i64* %357
  %358 = bitcast i8* %1 to i64*
  %359 = getelementptr i64, i64* %358, i64 89
  %360 = bitcast i64* %359 to i8*
  %361 = bitcast i8* %360 to i64*
  store i64 661722357, i64* %361
  %362 = bitcast i8* %1 to i64*
  %363 = getelementptr i64, i64* %362, i64 90
  %364 = bitcast i64* %363 to i8*
  %365 = bitcast i8* %364 to i64*
  store i64 2729648155, i64* %365
  %366 = bitcast i8* %1 to i64*
  %367 = getelementptr i64, i64* %366, i64 91
  %368 = bitcast i64* %367 to i8*
  %369 = bitcast i8* %368 to i64*
  store i64 1602437763, i64* %369
  %370 = bitcast i8* %1 to i64*
  %371 = getelementptr i64, i64* %370, i64 92
  %372 = bitcast i64* %371 to i8*
  %373 = bitcast i8* %372 to i64*
  store i64 1522245321, i64* %373
  %374 = bitcast i8* %1 to i64*
  %375 = getelementptr i64, i64* %374, i64 93
  %376 = bitcast i64* %375 to i8*
  %377 = bitcast i8* %376 to i64*
  store i64 2221291320, i64* %377
  %378 = bitcast i8* %1 to i64*
  %379 = getelementptr i64, i64* %378, i64 94
  %380 = bitcast i64* %379 to i8*
  %381 = bitcast i8* %380 to i64*
  store i64 1828700760, i64* %381
  %382 = bitcast i8* %1 to i64*
  %383 = getelementptr i64, i64* %382, i64 95
  %384 = bitcast i64* %383 to i8*
  %385 = bitcast i8* %384 to i64*
  store i64 1365074511, i64* %385
  %386 = bitcast i8* %1 to i64*
  %387 = getelementptr i64, i64* %386, i64 96
  %388 = bitcast i64* %387 to i8*
  %389 = bitcast i8* %388 to i64*
  store i64 2968066978, i64* %389
  %390 = bitcast i8* %1 to i64*
  %391 = getelementptr i64, i64* %390, i64 97
  %392 = bitcast i64* %391 to i8*
  %393 = bitcast i8* %392 to i64*
  store i64 805651708, i64* %393
  %394 = bitcast i8* %1 to i64*
  %395 = getelementptr i64, i64* %394, i64 98
  %396 = bitcast i64* %395 to i8*
  %397 = bitcast i8* %396 to i64*
  store i64 544380992, i64* %397
  %398 = bitcast i8* %1 to i64*
  %399 = getelementptr i64, i64* %398, i64 99
  %400 = bitcast i64* %399 to i8*
  %401 = bitcast i8* %400 to i64*
  store i64 340740524, i64* %401
  %402 = bitcast i8* %1 to i64*
  %403 = getelementptr i64, i64* %402, i64 100
  %404 = bitcast i64* %403 to i8*
  %405 = bitcast i8* %404 to i64*
  store i64 2245809894, i64* %405
  %406 = bitcast i8* %1 to i64*
  %407 = getelementptr i64, i64* %406, i64 101
  %408 = bitcast i64* %407 to i8*
  %409 = bitcast i8* %408 to i64*
  store i64 3215966230, i64* %409
  %410 = bitcast i8* %1 to i64*
  %411 = getelementptr i64, i64* %410, i64 102
  %412 = bitcast i64* %411 to i8*
  %413 = bitcast i8* %412 to i64*
  store i64 1986713915, i64* %413
  %414 = bitcast i8* %1 to i64*
  %415 = getelementptr i64, i64* %414, i64 103
  %416 = bitcast i64* %415 to i8*
  %417 = bitcast i8* %416 to i64*
  store i64 278422354, i64* %417
  %418 = bitcast i8* %1 to i64*
  %419 = getelementptr i64, i64* %418, i64 104
  %420 = bitcast i64* %419 to i8*
  %421 = bitcast i8* %420 to i64*
  store i64 1211743289, i64* %421
  %422 = bitcast i8* %1 to i64*
  %423 = getelementptr i64, i64* %422, i64 105
  %424 = bitcast i64* %423 to i8*
  %425 = bitcast i8* %424 to i64*
  store i64 791422096, i64* %425
  %426 = bitcast i8* %1 to i64*
  %427 = getelementptr i64, i64* %426, i64 106
  %428 = bitcast i64* %427 to i8*
  %429 = bitcast i8* %428 to i64*
  store i64 2794082828, i64* %429
  %430 = bitcast i8* %1 to i64*
  %431 = getelementptr i64, i64* %430, i64 107
  %432 = bitcast i64* %431 to i8*
  %433 = bitcast i8* %432 to i64*
  store i64 2315859199, i64* %433
  %434 = bitcast i8* %1 to i64*
  %435 = getelementptr i64, i64* %434, i64 108
  %436 = bitcast i64* %435 to i8*
  %437 = bitcast i8* %436 to i64*
  store i64 2278300586, i64* %437
  %438 = bitcast i8* %1 to i64*
  %439 = getelementptr i64, i64* %438, i64 109
  %440 = bitcast i64* %439 to i8*
  %441 = bitcast i8* %440 to i64*
  store i64 4131312073, i64* %441
  %442 = bitcast i8* %1 to i64*
  %443 = getelementptr i64, i64* %442, i64 110
  %444 = bitcast i64* %443 to i8*
  %445 = bitcast i8* %444 to i64*
  store i64 242161714, i64* %445
  %446 = bitcast i8* %1 to i64*
  %447 = getelementptr i64, i64* %446, i64 111
  %448 = bitcast i64* %447 to i8*
  %449 = bitcast i8* %448 to i64*
  store i64 1715968229, i64* %449
  %450 = bitcast i8* %1 to i64*
  %451 = getelementptr i64, i64* %450, i64 112
  %452 = bitcast i64* %451 to i8*
  %453 = bitcast i8* %452 to i64*
  store i64 3047239700, i64* %453
  %454 = bitcast i8* %1 to i64*
  %455 = getelementptr i64, i64* %454, i64 113
  %456 = bitcast i64* %455 to i8*
  %457 = bitcast i8* %456 to i64*
  store i64 1107991604, i64* %457
  %458 = bitcast i8* %1 to i64*
  %459 = getelementptr i64, i64* %458, i64 114
  %460 = bitcast i64* %459 to i8*
  %461 = bitcast i8* %460 to i64*
  store i64 2482810377, i64* %461
  %462 = bitcast i8* %1 to i64*
  %463 = getelementptr i64, i64* %462, i64 115
  %464 = bitcast i64* %463 to i8*
  %465 = bitcast i8* %464 to i64*
  store i64 1532185308, i64* %465
  %466 = bitcast i8* %1 to i64*
  %467 = getelementptr i64, i64* %466, i64 116
  %468 = bitcast i64* %467 to i8*
  %469 = bitcast i8* %468 to i64*
  store i64 4120945155, i64* %469
  %470 = bitcast i8* %1 to i64*
  %471 = getelementptr i64, i64* %470, i64 117
  %472 = bitcast i64* %471 to i8*
  %473 = bitcast i8* %472 to i64*
  store i64 274154457, i64* %473
  %474 = bitcast i8* %1 to i64*
  %475 = getelementptr i64, i64* %474, i64 118
  %476 = bitcast i64* %475 to i8*
  %477 = bitcast i8* %476 to i64*
  store i64 1808146213, i64* %477
  %478 = bitcast i8* %1 to i64*
  %479 = getelementptr i64, i64* %478, i64 119
  %480 = bitcast i64* %479 to i8*
  %481 = bitcast i8* %480 to i64*
  store i64 1746749344, i64* %481
  %482 = bitcast i8* %1 to i64*
  %483 = getelementptr i64, i64* %482, i64 120
  %484 = bitcast i64* %483 to i8*
  %485 = bitcast i8* %484 to i64*
  store i64 478885317, i64* %485
  %486 = bitcast i8* %1 to i64*
  %487 = getelementptr i64, i64* %486, i64 121
  %488 = bitcast i64* %487 to i8*
  %489 = bitcast i8* %488 to i64*
  store i64 804500403, i64* %489
  %490 = bitcast i8* %1 to i64*
  %491 = getelementptr i64, i64* %490, i64 122
  %492 = bitcast i64* %491 to i8*
  %493 = bitcast i8* %492 to i64*
  store i64 233911012, i64* %493
  %494 = bitcast i8* %1 to i64*
  %495 = getelementptr i64, i64* %494, i64 123
  %496 = bitcast i64* %495 to i8*
  %497 = bitcast i8* %496 to i64*
  store i64 2888944526, i64* %497
  %498 = bitcast i8* %1 to i64*
  %499 = getelementptr i64, i64* %498, i64 124
  %500 = bitcast i64* %499 to i8*
  %501 = bitcast i8* %500 to i64*
  store i64 1922137168, i64* %501
  %502 = bitcast i8* %1 to i64*
  %503 = getelementptr i64, i64* %502, i64 125
  %504 = bitcast i64* %503 to i8*
  %505 = bitcast i8* %504 to i64*
  store i64 1475190126, i64* %505
  %506 = bitcast i8* %1 to i64*
  %507 = getelementptr i64, i64* %506, i64 126
  %508 = bitcast i64* %507 to i8*
  %509 = bitcast i8* %508 to i64*
  store i64 2218721552, i64* %509
  %510 = bitcast i8* %1 to i64*
  %511 = getelementptr i64, i64* %510, i64 127
  %512 = bitcast i64* %511 to i8*
  %513 = bitcast i8* %512 to i64*
  store i64 3644993925, i64* %513
  %514 = getelementptr inbounds i8, i8* %1, i64 0
  %515 = insertvalue { i8*, i64, i64 } undef, i8* %514, 0
  %516 = insertvalue { i8*, i64, i64 } %515, i64 128, 1
  %517 = insertvalue { i8*, i64, i64 } %516, i64 128, 2
  store { i8*, i64, i64 } %517, { i8*, i64, i64 }* @main.input
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
  %380 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id126 = alloca i32
  %381 = alloca i32*
  %382 = alloca i32**
  %383 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id127 = alloca i32
  %384 = alloca i32*
  %385 = alloca i32**
  %386 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id128 = alloca i32
  %387 = alloca i32*
  %388 = alloca i32**
  %389 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id129 = alloca i32
  %390 = alloca i32*
  %391 = alloca i32**
  %392 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id130 = alloca i32
  %393 = alloca i32*
  %394 = alloca i32**
  %395 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id131 = alloca i32
  %396 = alloca i32*
  %397 = alloca i32**
  %398 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id132 = alloca i32
  %399 = alloca i32*
  %400 = alloca i32**
  %401 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id133 = alloca i32
  %402 = alloca i32*
  %403 = alloca i32**
  %404 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id134 = alloca i32
  %405 = alloca i32*
  %406 = alloca i32**
  %407 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id135 = alloca i32
  %408 = alloca i32*
  %409 = alloca i32**
  %410 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id136 = alloca i32
  %411 = alloca i32*
  %412 = alloca i32**
  %413 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id137 = alloca i32
  %414 = alloca i32*
  %415 = alloca i32**
  %416 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id138 = alloca i32
  %417 = alloca i32*
  %418 = alloca i32**
  %419 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id139 = alloca i32
  %420 = alloca i32*
  %421 = alloca i32**
  %422 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id140 = alloca i32
  %423 = alloca i32*
  %424 = alloca i32**
  %425 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id141 = alloca i32
  %426 = alloca i32*
  %427 = alloca i32**
  %428 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id142 = alloca i32
  %429 = alloca i32*
  %430 = alloca i32**
  %431 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id143 = alloca i32
  %432 = alloca i32*
  %433 = alloca i32**
  %434 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id144 = alloca i32
  %435 = alloca i32*
  %436 = alloca i32**
  %437 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id145 = alloca i32
  %438 = alloca i32*
  %439 = alloca i32**
  %440 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id146 = alloca i32
  %441 = alloca i32*
  %442 = alloca i32**
  %443 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id147 = alloca i32
  %444 = alloca i32*
  %445 = alloca i32**
  %446 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id148 = alloca i32
  %447 = alloca i32*
  %448 = alloca i32**
  %449 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id149 = alloca i32
  %450 = alloca i32*
  %451 = alloca i32**
  %452 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id150 = alloca i32
  %453 = alloca i32*
  %454 = alloca i32**
  %455 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id151 = alloca i32
  %456 = alloca i32*
  %457 = alloca i32**
  %458 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id152 = alloca i32
  %459 = alloca i32*
  %460 = alloca i32**
  %461 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id153 = alloca i32
  %462 = alloca i32*
  %463 = alloca i32**
  %464 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id154 = alloca i32
  %465 = alloca i32*
  %466 = alloca i32**
  %467 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id155 = alloca i32
  %468 = alloca i32*
  %469 = alloca i32**
  %470 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id156 = alloca i32
  %471 = alloca i32*
  %472 = alloca i32**
  %473 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id157 = alloca i32
  %474 = alloca i32*
  %475 = alloca i32**
  %476 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id158 = alloca i32
  %477 = alloca i32*
  %478 = alloca i32**
  %479 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id159 = alloca i32
  %480 = alloca i32*
  %481 = alloca i32**
  %482 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id160 = alloca i32
  %483 = alloca i32*
  %484 = alloca i32**
  %485 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id161 = alloca i32
  %486 = alloca i32*
  %487 = alloca i32**
  %488 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id162 = alloca i32
  %489 = alloca i32*
  %490 = alloca i32**
  %491 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id163 = alloca i32
  %492 = alloca i32*
  %493 = alloca i32**
  %494 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id164 = alloca i32
  %495 = alloca i32*
  %496 = alloca i32**
  %497 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id165 = alloca i32
  %498 = alloca i32*
  %499 = alloca i32**
  %500 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id166 = alloca i32
  %501 = alloca i32*
  %502 = alloca i32**
  %503 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id167 = alloca i32
  %504 = alloca i32*
  %505 = alloca i32**
  %506 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id168 = alloca i32
  %507 = alloca i32*
  %508 = alloca i32**
  %509 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id169 = alloca i32
  %510 = alloca i32*
  %511 = alloca i32**
  %512 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id170 = alloca i32
  %513 = alloca i32*
  %514 = alloca i32**
  %515 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id171 = alloca i32
  %516 = alloca i32*
  %517 = alloca i32**
  %518 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id172 = alloca i32
  %519 = alloca i32*
  %520 = alloca i32**
  %521 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id173 = alloca i32
  %522 = alloca i32*
  %523 = alloca i32**
  %524 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id174 = alloca i32
  %525 = alloca i32*
  %526 = alloca i32**
  %527 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id175 = alloca i32
  %528 = alloca i32*
  %529 = alloca i32**
  %530 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id176 = alloca i32
  %531 = alloca i32*
  %532 = alloca i32**
  %533 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id177 = alloca i32
  %534 = alloca i32*
  %535 = alloca i32**
  %536 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id178 = alloca i32
  %537 = alloca i32*
  %538 = alloca i32**
  %539 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id179 = alloca i32
  %540 = alloca i32*
  %541 = alloca i32**
  %542 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id180 = alloca i32
  %543 = alloca i32*
  %544 = alloca i32**
  %545 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id181 = alloca i32
  %546 = alloca i32*
  %547 = alloca i32**
  %548 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id182 = alloca i32
  %549 = alloca i32*
  %550 = alloca i32**
  %551 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id183 = alloca i32
  %552 = alloca i32*
  %553 = alloca i32**
  %554 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id184 = alloca i32
  %555 = alloca i32*
  %556 = alloca i32**
  %557 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id185 = alloca i32
  %558 = alloca i32*
  %559 = alloca i32**
  %560 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id186 = alloca i32
  %561 = alloca i32*
  %562 = alloca i32**
  %563 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id187 = alloca i32
  %564 = alloca i32*
  %565 = alloca i32**
  %566 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id188 = alloca i32
  %567 = alloca i32*
  %568 = alloca i32**
  %569 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id189 = alloca i32
  %570 = alloca i32*
  %571 = alloca i32**
  %572 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id190 = alloca i32
  %573 = alloca i32*
  %574 = alloca i32**
  %575 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id191 = alloca i32
  %576 = alloca i32*
  %577 = alloca i32**
  %578 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id192 = alloca i32
  %579 = alloca i32*
  %580 = alloca i32**
  %581 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id193 = alloca i32
  %582 = alloca i32*
  %583 = alloca i32**
  %584 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id194 = alloca i32
  %585 = alloca i32*
  %586 = alloca i32**
  %587 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id195 = alloca i32
  %588 = alloca i32*
  %589 = alloca i32**
  %590 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id196 = alloca i32
  %591 = alloca i32*
  %592 = alloca i32**
  %593 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id197 = alloca i32
  %594 = alloca i32*
  %595 = alloca i32**
  %596 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id198 = alloca i32
  %597 = alloca i32*
  %598 = alloca i32**
  %599 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id199 = alloca i32
  %600 = alloca i32*
  %601 = alloca i32**
  %602 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id200 = alloca i32
  %603 = alloca i32*
  %604 = alloca i32**
  %605 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id201 = alloca i32
  %606 = alloca i32*
  %607 = alloca i32**
  %608 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id202 = alloca i32
  %609 = alloca i32*
  %610 = alloca i32**
  %611 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id203 = alloca i32
  %612 = alloca i32*
  %613 = alloca i32**
  %614 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id204 = alloca i32
  %615 = alloca i32*
  %616 = alloca i32**
  %617 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id205 = alloca i32
  %618 = alloca i32*
  %619 = alloca i32**
  %620 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id206 = alloca i32
  %621 = alloca i32*
  %622 = alloca i32**
  %623 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id207 = alloca i32
  %624 = alloca i32*
  %625 = alloca i32**
  %626 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id208 = alloca i32
  %627 = alloca i32*
  %628 = alloca i32**
  %629 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id209 = alloca i32
  %630 = alloca i32*
  %631 = alloca i32**
  %632 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id210 = alloca i32
  %633 = alloca i32*
  %634 = alloca i32**
  %635 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id211 = alloca i32
  %636 = alloca i32*
  %637 = alloca i32**
  %638 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id212 = alloca i32
  %639 = alloca i32*
  %640 = alloca i32**
  %641 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id213 = alloca i32
  %642 = alloca i32*
  %643 = alloca i32**
  %644 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id214 = alloca i32
  %645 = alloca i32*
  %646 = alloca i32**
  %647 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id215 = alloca i32
  %648 = alloca i32*
  %649 = alloca i32**
  %650 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id216 = alloca i32
  %651 = alloca i32*
  %652 = alloca i32**
  %653 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id217 = alloca i32
  %654 = alloca i32*
  %655 = alloca i32**
  %656 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id218 = alloca i32
  %657 = alloca i32*
  %658 = alloca i32**
  %659 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id219 = alloca i32
  %660 = alloca i32*
  %661 = alloca i32**
  %662 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id220 = alloca i32
  %663 = alloca i32*
  %664 = alloca i32**
  %665 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id221 = alloca i32
  %666 = alloca i32*
  %667 = alloca i32**
  %668 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id222 = alloca i32
  %669 = alloca i32*
  %670 = alloca i32**
  %671 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id223 = alloca i32
  %672 = alloca i32*
  %673 = alloca i32**
  %674 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id224 = alloca i32
  %675 = alloca i32*
  %676 = alloca i32**
  %677 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id225 = alloca i32
  %678 = alloca i32*
  %679 = alloca i32**
  %680 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id226 = alloca i32
  %681 = alloca i32*
  %682 = alloca i32**
  %683 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id227 = alloca i32
  %684 = alloca i32*
  %685 = alloca i32**
  %686 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id228 = alloca i32
  %687 = alloca i32*
  %688 = alloca i32**
  %689 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id229 = alloca i32
  %690 = alloca i32*
  %691 = alloca i32**
  %692 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id230 = alloca i32
  %693 = alloca i32*
  %694 = alloca i32**
  %695 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id231 = alloca i32
  %696 = alloca i32*
  %697 = alloca i32**
  %698 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id232 = alloca i32
  %699 = alloca i32*
  %700 = alloca i32**
  %701 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id233 = alloca i32
  %702 = alloca i32*
  %703 = alloca i32**
  %704 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id234 = alloca i32
  %705 = alloca i32*
  %706 = alloca i32**
  %707 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id235 = alloca i32
  %708 = alloca i32*
  %709 = alloca i32**
  %710 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id236 = alloca i32
  %711 = alloca i32*
  %712 = alloca i32**
  %713 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id237 = alloca i32
  %714 = alloca i32*
  %715 = alloca i32**
  %716 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id238 = alloca i32
  %717 = alloca i32*
  %718 = alloca i32**
  %719 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id239 = alloca i32
  %720 = alloca i32*
  %721 = alloca i32**
  %722 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id240 = alloca i32
  %723 = alloca i32*
  %724 = alloca i32**
  %725 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id241 = alloca i32
  %726 = alloca i32*
  %727 = alloca i32**
  %728 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id242 = alloca i32
  %729 = alloca i32*
  %730 = alloca i32**
  %731 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id243 = alloca i32
  %732 = alloca i32*
  %733 = alloca i32**
  %734 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id244 = alloca i32
  %735 = alloca i32*
  %736 = alloca i32**
  %737 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id245 = alloca i32
  %738 = alloca i32*
  %739 = alloca i32**
  %740 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id246 = alloca i32
  %741 = alloca i32*
  %742 = alloca i32**
  %743 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id247 = alloca i32
  %744 = alloca i32*
  %745 = alloca i32**
  %746 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id248 = alloca i32
  %747 = alloca i32*
  %748 = alloca i32**
  %749 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id249 = alloca i32
  %750 = alloca i32*
  %751 = alloca i32**
  %752 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id250 = alloca i32
  %753 = alloca i32*
  %754 = alloca i32**
  %755 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id251 = alloca i32
  %756 = alloca i32*
  %757 = alloca i32**
  %758 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id252 = alloca i32
  %759 = alloca i32*
  %760 = alloca i32**
  %761 = alloca { %FIFO*, %FIFO*, %FIFO* }
  %thread_id253 = alloca i32
  %762 = alloca i32*
  %763 = alloca i32**
  %varargs = alloca [2 x { i8*, i8* }]
  %764 = alloca { i8*, i64 }
  %765 = alloca i64
  %766 = alloca { i8*, i64, i64 }
  %767 = alloca { i64, { i8*, i8* } }
  %768 = alloca { i8*, i64, i64 }
  %769 = alloca i64
  %varargs254 = alloca [1 x { i8*, i8* }]
  %770 = alloca i64
  %771 = alloca { i8*, i64 }
  %772 = alloca { i8*, i64, i64 }
  %773 = alloca { i64, { i8*, i8* } }
  %774 = alloca { i8*, i64 }
  %775 = alloca { i8*, i64, i64 }
  %776 = alloca { i64, { i8*, i8* } }
  %777 = alloca { i8*, i64, i64 }
  br label %.0.entry

.0.entry:                                         ; preds = %prologue
  call void @main.load_values(i8* nest undef)
  %778 = load { i8*, i64, i64 }, { i8*, i64, i64 }* @main.input
  store { i8*, i64, i64 } %778, { i8*, i64, i64 }* %1
  call void @main.checkSort(i8* nest undef, { i8*, i64, i64 }* byval %1)
  %779 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %780 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %781 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %782 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %783 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %784 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %785 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %786 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %787 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %788 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %789 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %790 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %791 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %792 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %793 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %794 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %795 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %796 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %797 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %798 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %799 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %800 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %801 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %802 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %803 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %804 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %805 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %806 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %807 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %808 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %809 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %810 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %811 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %812 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %813 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %814 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %815 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %816 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %817 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %818 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %819 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %820 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %821 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %822 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %823 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %824 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %825 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %826 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %827 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %828 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %829 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %830 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %831 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %832 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %833 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %834 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %835 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %836 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %837 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %838 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %839 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %840 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %841 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %842 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %843 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %844 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %845 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %846 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %847 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %848 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %849 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %850 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %851 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %852 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %853 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %854 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %855 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %856 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %857 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %858 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %859 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %860 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %861 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %862 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %863 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %864 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %865 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %866 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %867 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %868 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %869 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %870 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %871 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %872 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %873 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %874 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %875 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %876 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %877 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %878 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %879 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %880 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %881 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %882 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %883 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %884 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %885 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %886 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %887 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %888 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %889 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %890 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %891 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %892 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %893 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %894 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %895 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %896 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %897 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %898 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %899 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
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
  %963 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %964 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %965 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %966 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %967 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %968 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %969 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %970 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %971 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %972 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %973 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %974 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %975 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %976 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %977 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %978 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %979 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %980 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %981 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %982 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %983 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %984 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %985 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %986 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %987 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %988 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %989 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %990 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %991 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %992 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %993 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %994 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %995 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %996 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %997 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %998 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %999 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1000 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1001 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1002 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1003 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1004 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1005 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1006 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1007 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1008 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1009 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1010 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1011 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1012 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1013 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1014 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1015 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1016 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1017 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1018 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1019 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1020 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1021 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1022 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1023 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1024 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1025 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1026 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1027 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1028 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1029 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1030 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1031 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1032 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1033 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1034 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %2, i32 0, i32 0
  store %FIFO* %779, %FIFO** %1034
  %1035 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %2, i32 0, i32 1
  store %FIFO* %780, %FIFO** %1035
  %1036 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %2, i32 0, i32 2
  store %FIFO* %781, %FIFO** %1036
  %1037 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %2 to i8*
  store i32* %thread_id, i32** %3
  %1038 = bitcast i32*** %4 to i8**
  store i32** %3, i32*** %4
  %1039 = load i8*, i8** %1038
  call void @pthread_create(i8* %1039, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper to i8*), i8* %1037)
  %1040 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %5, i32 0, i32 0
  store %FIFO* %780, %FIFO** %1040
  %1041 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %5, i32 0, i32 1
  store %FIFO* %782, %FIFO** %1041
  %1042 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %5, i32 0, i32 2
  store %FIFO* %783, %FIFO** %1042
  %1043 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %5 to i8*
  store i32* %thread_id1, i32** %6
  %1044 = bitcast i32*** %7 to i8**
  store i32** %6, i32*** %7
  %1045 = load i8*, i8** %1044
  call void @pthread_create(i8* %1045, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.1 to i8*), i8* %1043)
  %1046 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %8, i32 0, i32 0
  store %FIFO* %781, %FIFO** %1046
  %1047 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %8, i32 0, i32 1
  store %FIFO* %784, %FIFO** %1047
  %1048 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %8, i32 0, i32 2
  store %FIFO* %785, %FIFO** %1048
  %1049 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %8 to i8*
  store i32* %thread_id2, i32** %9
  %1050 = bitcast i32*** %10 to i8**
  store i32** %9, i32*** %10
  %1051 = load i8*, i8** %1050
  call void @pthread_create(i8* %1051, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.2 to i8*), i8* %1049)
  %1052 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %11, i32 0, i32 0
  store %FIFO* %782, %FIFO** %1052
  %1053 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %11, i32 0, i32 1
  store %FIFO* %786, %FIFO** %1053
  %1054 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %11, i32 0, i32 2
  store %FIFO* %787, %FIFO** %1054
  %1055 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %11 to i8*
  store i32* %thread_id3, i32** %12
  %1056 = bitcast i32*** %13 to i8**
  store i32** %12, i32*** %13
  %1057 = load i8*, i8** %1056
  call void @pthread_create(i8* %1057, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.3 to i8*), i8* %1055)
  %1058 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %14, i32 0, i32 0
  store %FIFO* %783, %FIFO** %1058
  %1059 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %14, i32 0, i32 1
  store %FIFO* %788, %FIFO** %1059
  %1060 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %14, i32 0, i32 2
  store %FIFO* %789, %FIFO** %1060
  %1061 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %14 to i8*
  store i32* %thread_id4, i32** %15
  %1062 = bitcast i32*** %16 to i8**
  store i32** %15, i32*** %16
  %1063 = load i8*, i8** %1062
  call void @pthread_create(i8* %1063, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.4 to i8*), i8* %1061)
  %1064 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %17, i32 0, i32 0
  store %FIFO* %784, %FIFO** %1064
  %1065 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %17, i32 0, i32 1
  store %FIFO* %790, %FIFO** %1065
  %1066 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %17, i32 0, i32 2
  store %FIFO* %791, %FIFO** %1066
  %1067 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %17 to i8*
  store i32* %thread_id5, i32** %18
  %1068 = bitcast i32*** %19 to i8**
  store i32** %18, i32*** %19
  %1069 = load i8*, i8** %1068
  call void @pthread_create(i8* %1069, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.5 to i8*), i8* %1067)
  %1070 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %20, i32 0, i32 0
  store %FIFO* %785, %FIFO** %1070
  %1071 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %20, i32 0, i32 1
  store %FIFO* %792, %FIFO** %1071
  %1072 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %20, i32 0, i32 2
  store %FIFO* %793, %FIFO** %1072
  %1073 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %20 to i8*
  store i32* %thread_id6, i32** %21
  %1074 = bitcast i32*** %22 to i8**
  store i32** %21, i32*** %22
  %1075 = load i8*, i8** %1074
  call void @pthread_create(i8* %1075, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.6 to i8*), i8* %1073)
  %1076 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %23, i32 0, i32 0
  store %FIFO* %786, %FIFO** %1076
  %1077 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %23, i32 0, i32 1
  store %FIFO* %794, %FIFO** %1077
  %1078 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %23, i32 0, i32 2
  store %FIFO* %795, %FIFO** %1078
  %1079 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %23 to i8*
  store i32* %thread_id7, i32** %24
  %1080 = bitcast i32*** %25 to i8**
  store i32** %24, i32*** %25
  %1081 = load i8*, i8** %1080
  call void @pthread_create(i8* %1081, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.7 to i8*), i8* %1079)
  %1082 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %26, i32 0, i32 0
  store %FIFO* %787, %FIFO** %1082
  %1083 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %26, i32 0, i32 1
  store %FIFO* %796, %FIFO** %1083
  %1084 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %26, i32 0, i32 2
  store %FIFO* %797, %FIFO** %1084
  %1085 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %26 to i8*
  store i32* %thread_id8, i32** %27
  %1086 = bitcast i32*** %28 to i8**
  store i32** %27, i32*** %28
  %1087 = load i8*, i8** %1086
  call void @pthread_create(i8* %1087, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.8 to i8*), i8* %1085)
  %1088 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %29, i32 0, i32 0
  store %FIFO* %788, %FIFO** %1088
  %1089 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %29, i32 0, i32 1
  store %FIFO* %798, %FIFO** %1089
  %1090 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %29, i32 0, i32 2
  store %FIFO* %799, %FIFO** %1090
  %1091 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %29 to i8*
  store i32* %thread_id9, i32** %30
  %1092 = bitcast i32*** %31 to i8**
  store i32** %30, i32*** %31
  %1093 = load i8*, i8** %1092
  call void @pthread_create(i8* %1093, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.9 to i8*), i8* %1091)
  %1094 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %32, i32 0, i32 0
  store %FIFO* %789, %FIFO** %1094
  %1095 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %32, i32 0, i32 1
  store %FIFO* %800, %FIFO** %1095
  %1096 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %32, i32 0, i32 2
  store %FIFO* %801, %FIFO** %1096
  %1097 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %32 to i8*
  store i32* %thread_id10, i32** %33
  %1098 = bitcast i32*** %34 to i8**
  store i32** %33, i32*** %34
  %1099 = load i8*, i8** %1098
  call void @pthread_create(i8* %1099, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.10 to i8*), i8* %1097)
  %1100 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %35, i32 0, i32 0
  store %FIFO* %790, %FIFO** %1100
  %1101 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %35, i32 0, i32 1
  store %FIFO* %802, %FIFO** %1101
  %1102 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %35, i32 0, i32 2
  store %FIFO* %803, %FIFO** %1102
  %1103 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %35 to i8*
  store i32* %thread_id11, i32** %36
  %1104 = bitcast i32*** %37 to i8**
  store i32** %36, i32*** %37
  %1105 = load i8*, i8** %1104
  call void @pthread_create(i8* %1105, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.11 to i8*), i8* %1103)
  %1106 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %38, i32 0, i32 0
  store %FIFO* %791, %FIFO** %1106
  %1107 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %38, i32 0, i32 1
  store %FIFO* %804, %FIFO** %1107
  %1108 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %38, i32 0, i32 2
  store %FIFO* %805, %FIFO** %1108
  %1109 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %38 to i8*
  store i32* %thread_id12, i32** %39
  %1110 = bitcast i32*** %40 to i8**
  store i32** %39, i32*** %40
  %1111 = load i8*, i8** %1110
  call void @pthread_create(i8* %1111, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.12 to i8*), i8* %1109)
  %1112 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %41, i32 0, i32 0
  store %FIFO* %792, %FIFO** %1112
  %1113 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %41, i32 0, i32 1
  store %FIFO* %806, %FIFO** %1113
  %1114 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %41, i32 0, i32 2
  store %FIFO* %807, %FIFO** %1114
  %1115 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %41 to i8*
  store i32* %thread_id13, i32** %42
  %1116 = bitcast i32*** %43 to i8**
  store i32** %42, i32*** %43
  %1117 = load i8*, i8** %1116
  call void @pthread_create(i8* %1117, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.13 to i8*), i8* %1115)
  %1118 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %44, i32 0, i32 0
  store %FIFO* %793, %FIFO** %1118
  %1119 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %44, i32 0, i32 1
  store %FIFO* %808, %FIFO** %1119
  %1120 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %44, i32 0, i32 2
  store %FIFO* %809, %FIFO** %1120
  %1121 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %44 to i8*
  store i32* %thread_id14, i32** %45
  %1122 = bitcast i32*** %46 to i8**
  store i32** %45, i32*** %46
  %1123 = load i8*, i8** %1122
  call void @pthread_create(i8* %1123, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.14 to i8*), i8* %1121)
  %1124 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %47, i32 0, i32 0
  store %FIFO* %794, %FIFO** %1124
  %1125 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %47, i32 0, i32 1
  store %FIFO* %810, %FIFO** %1125
  %1126 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %47, i32 0, i32 2
  store %FIFO* %811, %FIFO** %1126
  %1127 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %47 to i8*
  store i32* %thread_id15, i32** %48
  %1128 = bitcast i32*** %49 to i8**
  store i32** %48, i32*** %49
  %1129 = load i8*, i8** %1128
  call void @pthread_create(i8* %1129, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.15 to i8*), i8* %1127)
  %1130 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %50, i32 0, i32 0
  store %FIFO* %795, %FIFO** %1130
  %1131 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %50, i32 0, i32 1
  store %FIFO* %812, %FIFO** %1131
  %1132 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %50, i32 0, i32 2
  store %FIFO* %813, %FIFO** %1132
  %1133 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %50 to i8*
  store i32* %thread_id16, i32** %51
  %1134 = bitcast i32*** %52 to i8**
  store i32** %51, i32*** %52
  %1135 = load i8*, i8** %1134
  call void @pthread_create(i8* %1135, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.16 to i8*), i8* %1133)
  %1136 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %53, i32 0, i32 0
  store %FIFO* %796, %FIFO** %1136
  %1137 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %53, i32 0, i32 1
  store %FIFO* %814, %FIFO** %1137
  %1138 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %53, i32 0, i32 2
  store %FIFO* %815, %FIFO** %1138
  %1139 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %53 to i8*
  store i32* %thread_id17, i32** %54
  %1140 = bitcast i32*** %55 to i8**
  store i32** %54, i32*** %55
  %1141 = load i8*, i8** %1140
  call void @pthread_create(i8* %1141, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.17 to i8*), i8* %1139)
  %1142 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %56, i32 0, i32 0
  store %FIFO* %797, %FIFO** %1142
  %1143 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %56, i32 0, i32 1
  store %FIFO* %816, %FIFO** %1143
  %1144 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %56, i32 0, i32 2
  store %FIFO* %817, %FIFO** %1144
  %1145 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %56 to i8*
  store i32* %thread_id18, i32** %57
  %1146 = bitcast i32*** %58 to i8**
  store i32** %57, i32*** %58
  %1147 = load i8*, i8** %1146
  call void @pthread_create(i8* %1147, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.18 to i8*), i8* %1145)
  %1148 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %59, i32 0, i32 0
  store %FIFO* %798, %FIFO** %1148
  %1149 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %59, i32 0, i32 1
  store %FIFO* %818, %FIFO** %1149
  %1150 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %59, i32 0, i32 2
  store %FIFO* %819, %FIFO** %1150
  %1151 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %59 to i8*
  store i32* %thread_id19, i32** %60
  %1152 = bitcast i32*** %61 to i8**
  store i32** %60, i32*** %61
  %1153 = load i8*, i8** %1152
  call void @pthread_create(i8* %1153, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.19 to i8*), i8* %1151)
  %1154 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %62, i32 0, i32 0
  store %FIFO* %799, %FIFO** %1154
  %1155 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %62, i32 0, i32 1
  store %FIFO* %820, %FIFO** %1155
  %1156 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %62, i32 0, i32 2
  store %FIFO* %821, %FIFO** %1156
  %1157 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %62 to i8*
  store i32* %thread_id20, i32** %63
  %1158 = bitcast i32*** %64 to i8**
  store i32** %63, i32*** %64
  %1159 = load i8*, i8** %1158
  call void @pthread_create(i8* %1159, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.20 to i8*), i8* %1157)
  %1160 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %65, i32 0, i32 0
  store %FIFO* %800, %FIFO** %1160
  %1161 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %65, i32 0, i32 1
  store %FIFO* %822, %FIFO** %1161
  %1162 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %65, i32 0, i32 2
  store %FIFO* %823, %FIFO** %1162
  %1163 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %65 to i8*
  store i32* %thread_id21, i32** %66
  %1164 = bitcast i32*** %67 to i8**
  store i32** %66, i32*** %67
  %1165 = load i8*, i8** %1164
  call void @pthread_create(i8* %1165, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.21 to i8*), i8* %1163)
  %1166 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %68, i32 0, i32 0
  store %FIFO* %801, %FIFO** %1166
  %1167 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %68, i32 0, i32 1
  store %FIFO* %824, %FIFO** %1167
  %1168 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %68, i32 0, i32 2
  store %FIFO* %825, %FIFO** %1168
  %1169 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %68 to i8*
  store i32* %thread_id22, i32** %69
  %1170 = bitcast i32*** %70 to i8**
  store i32** %69, i32*** %70
  %1171 = load i8*, i8** %1170
  call void @pthread_create(i8* %1171, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.22 to i8*), i8* %1169)
  %1172 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %71, i32 0, i32 0
  store %FIFO* %802, %FIFO** %1172
  %1173 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %71, i32 0, i32 1
  store %FIFO* %826, %FIFO** %1173
  %1174 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %71, i32 0, i32 2
  store %FIFO* %827, %FIFO** %1174
  %1175 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %71 to i8*
  store i32* %thread_id23, i32** %72
  %1176 = bitcast i32*** %73 to i8**
  store i32** %72, i32*** %73
  %1177 = load i8*, i8** %1176
  call void @pthread_create(i8* %1177, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.23 to i8*), i8* %1175)
  %1178 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %74, i32 0, i32 0
  store %FIFO* %803, %FIFO** %1178
  %1179 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %74, i32 0, i32 1
  store %FIFO* %828, %FIFO** %1179
  %1180 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %74, i32 0, i32 2
  store %FIFO* %829, %FIFO** %1180
  %1181 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %74 to i8*
  store i32* %thread_id24, i32** %75
  %1182 = bitcast i32*** %76 to i8**
  store i32** %75, i32*** %76
  %1183 = load i8*, i8** %1182
  call void @pthread_create(i8* %1183, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.24 to i8*), i8* %1181)
  %1184 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %77, i32 0, i32 0
  store %FIFO* %804, %FIFO** %1184
  %1185 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %77, i32 0, i32 1
  store %FIFO* %830, %FIFO** %1185
  %1186 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %77, i32 0, i32 2
  store %FIFO* %831, %FIFO** %1186
  %1187 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %77 to i8*
  store i32* %thread_id25, i32** %78
  %1188 = bitcast i32*** %79 to i8**
  store i32** %78, i32*** %79
  %1189 = load i8*, i8** %1188
  call void @pthread_create(i8* %1189, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.25 to i8*), i8* %1187)
  %1190 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %80, i32 0, i32 0
  store %FIFO* %805, %FIFO** %1190
  %1191 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %80, i32 0, i32 1
  store %FIFO* %832, %FIFO** %1191
  %1192 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %80, i32 0, i32 2
  store %FIFO* %833, %FIFO** %1192
  %1193 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %80 to i8*
  store i32* %thread_id26, i32** %81
  %1194 = bitcast i32*** %82 to i8**
  store i32** %81, i32*** %82
  %1195 = load i8*, i8** %1194
  call void @pthread_create(i8* %1195, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.26 to i8*), i8* %1193)
  %1196 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %83, i32 0, i32 0
  store %FIFO* %806, %FIFO** %1196
  %1197 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %83, i32 0, i32 1
  store %FIFO* %834, %FIFO** %1197
  %1198 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %83, i32 0, i32 2
  store %FIFO* %835, %FIFO** %1198
  %1199 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %83 to i8*
  store i32* %thread_id27, i32** %84
  %1200 = bitcast i32*** %85 to i8**
  store i32** %84, i32*** %85
  %1201 = load i8*, i8** %1200
  call void @pthread_create(i8* %1201, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.27 to i8*), i8* %1199)
  %1202 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %86, i32 0, i32 0
  store %FIFO* %807, %FIFO** %1202
  %1203 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %86, i32 0, i32 1
  store %FIFO* %836, %FIFO** %1203
  %1204 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %86, i32 0, i32 2
  store %FIFO* %837, %FIFO** %1204
  %1205 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %86 to i8*
  store i32* %thread_id28, i32** %87
  %1206 = bitcast i32*** %88 to i8**
  store i32** %87, i32*** %88
  %1207 = load i8*, i8** %1206
  call void @pthread_create(i8* %1207, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.28 to i8*), i8* %1205)
  %1208 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %89, i32 0, i32 0
  store %FIFO* %808, %FIFO** %1208
  %1209 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %89, i32 0, i32 1
  store %FIFO* %838, %FIFO** %1209
  %1210 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %89, i32 0, i32 2
  store %FIFO* %839, %FIFO** %1210
  %1211 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %89 to i8*
  store i32* %thread_id29, i32** %90
  %1212 = bitcast i32*** %91 to i8**
  store i32** %90, i32*** %91
  %1213 = load i8*, i8** %1212
  call void @pthread_create(i8* %1213, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.29 to i8*), i8* %1211)
  %1214 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %92, i32 0, i32 0
  store %FIFO* %809, %FIFO** %1214
  %1215 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %92, i32 0, i32 1
  store %FIFO* %840, %FIFO** %1215
  %1216 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %92, i32 0, i32 2
  store %FIFO* %841, %FIFO** %1216
  %1217 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %92 to i8*
  store i32* %thread_id30, i32** %93
  %1218 = bitcast i32*** %94 to i8**
  store i32** %93, i32*** %94
  %1219 = load i8*, i8** %1218
  call void @pthread_create(i8* %1219, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.30 to i8*), i8* %1217)
  %1220 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %95, i32 0, i32 0
  store %FIFO* %810, %FIFO** %1220
  %1221 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %95, i32 0, i32 1
  store %FIFO* %842, %FIFO** %1221
  %1222 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %95, i32 0, i32 2
  store %FIFO* %843, %FIFO** %1222
  %1223 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %95 to i8*
  store i32* %thread_id31, i32** %96
  %1224 = bitcast i32*** %97 to i8**
  store i32** %96, i32*** %97
  %1225 = load i8*, i8** %1224
  call void @pthread_create(i8* %1225, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.31 to i8*), i8* %1223)
  %1226 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %98, i32 0, i32 0
  store %FIFO* %811, %FIFO** %1226
  %1227 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %98, i32 0, i32 1
  store %FIFO* %844, %FIFO** %1227
  %1228 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %98, i32 0, i32 2
  store %FIFO* %845, %FIFO** %1228
  %1229 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %98 to i8*
  store i32* %thread_id32, i32** %99
  %1230 = bitcast i32*** %100 to i8**
  store i32** %99, i32*** %100
  %1231 = load i8*, i8** %1230
  call void @pthread_create(i8* %1231, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.32 to i8*), i8* %1229)
  %1232 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %101, i32 0, i32 0
  store %FIFO* %812, %FIFO** %1232
  %1233 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %101, i32 0, i32 1
  store %FIFO* %846, %FIFO** %1233
  %1234 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %101, i32 0, i32 2
  store %FIFO* %847, %FIFO** %1234
  %1235 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %101 to i8*
  store i32* %thread_id33, i32** %102
  %1236 = bitcast i32*** %103 to i8**
  store i32** %102, i32*** %103
  %1237 = load i8*, i8** %1236
  call void @pthread_create(i8* %1237, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.33 to i8*), i8* %1235)
  %1238 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %104, i32 0, i32 0
  store %FIFO* %813, %FIFO** %1238
  %1239 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %104, i32 0, i32 1
  store %FIFO* %848, %FIFO** %1239
  %1240 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %104, i32 0, i32 2
  store %FIFO* %849, %FIFO** %1240
  %1241 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %104 to i8*
  store i32* %thread_id34, i32** %105
  %1242 = bitcast i32*** %106 to i8**
  store i32** %105, i32*** %106
  %1243 = load i8*, i8** %1242
  call void @pthread_create(i8* %1243, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.34 to i8*), i8* %1241)
  %1244 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %107, i32 0, i32 0
  store %FIFO* %814, %FIFO** %1244
  %1245 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %107, i32 0, i32 1
  store %FIFO* %850, %FIFO** %1245
  %1246 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %107, i32 0, i32 2
  store %FIFO* %851, %FIFO** %1246
  %1247 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %107 to i8*
  store i32* %thread_id35, i32** %108
  %1248 = bitcast i32*** %109 to i8**
  store i32** %108, i32*** %109
  %1249 = load i8*, i8** %1248
  call void @pthread_create(i8* %1249, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.35 to i8*), i8* %1247)
  %1250 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %110, i32 0, i32 0
  store %FIFO* %815, %FIFO** %1250
  %1251 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %110, i32 0, i32 1
  store %FIFO* %852, %FIFO** %1251
  %1252 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %110, i32 0, i32 2
  store %FIFO* %853, %FIFO** %1252
  %1253 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %110 to i8*
  store i32* %thread_id36, i32** %111
  %1254 = bitcast i32*** %112 to i8**
  store i32** %111, i32*** %112
  %1255 = load i8*, i8** %1254
  call void @pthread_create(i8* %1255, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.36 to i8*), i8* %1253)
  %1256 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %113, i32 0, i32 0
  store %FIFO* %816, %FIFO** %1256
  %1257 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %113, i32 0, i32 1
  store %FIFO* %854, %FIFO** %1257
  %1258 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %113, i32 0, i32 2
  store %FIFO* %855, %FIFO** %1258
  %1259 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %113 to i8*
  store i32* %thread_id37, i32** %114
  %1260 = bitcast i32*** %115 to i8**
  store i32** %114, i32*** %115
  %1261 = load i8*, i8** %1260
  call void @pthread_create(i8* %1261, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.37 to i8*), i8* %1259)
  %1262 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %116, i32 0, i32 0
  store %FIFO* %817, %FIFO** %1262
  %1263 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %116, i32 0, i32 1
  store %FIFO* %856, %FIFO** %1263
  %1264 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %116, i32 0, i32 2
  store %FIFO* %857, %FIFO** %1264
  %1265 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %116 to i8*
  store i32* %thread_id38, i32** %117
  %1266 = bitcast i32*** %118 to i8**
  store i32** %117, i32*** %118
  %1267 = load i8*, i8** %1266
  call void @pthread_create(i8* %1267, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.38 to i8*), i8* %1265)
  %1268 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %119, i32 0, i32 0
  store %FIFO* %818, %FIFO** %1268
  %1269 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %119, i32 0, i32 1
  store %FIFO* %858, %FIFO** %1269
  %1270 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %119, i32 0, i32 2
  store %FIFO* %859, %FIFO** %1270
  %1271 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %119 to i8*
  store i32* %thread_id39, i32** %120
  %1272 = bitcast i32*** %121 to i8**
  store i32** %120, i32*** %121
  %1273 = load i8*, i8** %1272
  call void @pthread_create(i8* %1273, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.39 to i8*), i8* %1271)
  %1274 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %122, i32 0, i32 0
  store %FIFO* %819, %FIFO** %1274
  %1275 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %122, i32 0, i32 1
  store %FIFO* %860, %FIFO** %1275
  %1276 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %122, i32 0, i32 2
  store %FIFO* %861, %FIFO** %1276
  %1277 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %122 to i8*
  store i32* %thread_id40, i32** %123
  %1278 = bitcast i32*** %124 to i8**
  store i32** %123, i32*** %124
  %1279 = load i8*, i8** %1278
  call void @pthread_create(i8* %1279, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.40 to i8*), i8* %1277)
  %1280 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %125, i32 0, i32 0
  store %FIFO* %820, %FIFO** %1280
  %1281 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %125, i32 0, i32 1
  store %FIFO* %862, %FIFO** %1281
  %1282 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %125, i32 0, i32 2
  store %FIFO* %863, %FIFO** %1282
  %1283 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %125 to i8*
  store i32* %thread_id41, i32** %126
  %1284 = bitcast i32*** %127 to i8**
  store i32** %126, i32*** %127
  %1285 = load i8*, i8** %1284
  call void @pthread_create(i8* %1285, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.41 to i8*), i8* %1283)
  %1286 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %128, i32 0, i32 0
  store %FIFO* %821, %FIFO** %1286
  %1287 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %128, i32 0, i32 1
  store %FIFO* %864, %FIFO** %1287
  %1288 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %128, i32 0, i32 2
  store %FIFO* %865, %FIFO** %1288
  %1289 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %128 to i8*
  store i32* %thread_id42, i32** %129
  %1290 = bitcast i32*** %130 to i8**
  store i32** %129, i32*** %130
  %1291 = load i8*, i8** %1290
  call void @pthread_create(i8* %1291, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.42 to i8*), i8* %1289)
  %1292 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %131, i32 0, i32 0
  store %FIFO* %822, %FIFO** %1292
  %1293 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %131, i32 0, i32 1
  store %FIFO* %866, %FIFO** %1293
  %1294 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %131, i32 0, i32 2
  store %FIFO* %867, %FIFO** %1294
  %1295 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %131 to i8*
  store i32* %thread_id43, i32** %132
  %1296 = bitcast i32*** %133 to i8**
  store i32** %132, i32*** %133
  %1297 = load i8*, i8** %1296
  call void @pthread_create(i8* %1297, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.43 to i8*), i8* %1295)
  %1298 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %134, i32 0, i32 0
  store %FIFO* %823, %FIFO** %1298
  %1299 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %134, i32 0, i32 1
  store %FIFO* %868, %FIFO** %1299
  %1300 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %134, i32 0, i32 2
  store %FIFO* %869, %FIFO** %1300
  %1301 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %134 to i8*
  store i32* %thread_id44, i32** %135
  %1302 = bitcast i32*** %136 to i8**
  store i32** %135, i32*** %136
  %1303 = load i8*, i8** %1302
  call void @pthread_create(i8* %1303, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.44 to i8*), i8* %1301)
  %1304 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %137, i32 0, i32 0
  store %FIFO* %824, %FIFO** %1304
  %1305 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %137, i32 0, i32 1
  store %FIFO* %870, %FIFO** %1305
  %1306 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %137, i32 0, i32 2
  store %FIFO* %871, %FIFO** %1306
  %1307 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %137 to i8*
  store i32* %thread_id45, i32** %138
  %1308 = bitcast i32*** %139 to i8**
  store i32** %138, i32*** %139
  %1309 = load i8*, i8** %1308
  call void @pthread_create(i8* %1309, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.45 to i8*), i8* %1307)
  %1310 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %140, i32 0, i32 0
  store %FIFO* %825, %FIFO** %1310
  %1311 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %140, i32 0, i32 1
  store %FIFO* %872, %FIFO** %1311
  %1312 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %140, i32 0, i32 2
  store %FIFO* %873, %FIFO** %1312
  %1313 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %140 to i8*
  store i32* %thread_id46, i32** %141
  %1314 = bitcast i32*** %142 to i8**
  store i32** %141, i32*** %142
  %1315 = load i8*, i8** %1314
  call void @pthread_create(i8* %1315, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.46 to i8*), i8* %1313)
  %1316 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %143, i32 0, i32 0
  store %FIFO* %826, %FIFO** %1316
  %1317 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %143, i32 0, i32 1
  store %FIFO* %874, %FIFO** %1317
  %1318 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %143, i32 0, i32 2
  store %FIFO* %875, %FIFO** %1318
  %1319 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %143 to i8*
  store i32* %thread_id47, i32** %144
  %1320 = bitcast i32*** %145 to i8**
  store i32** %144, i32*** %145
  %1321 = load i8*, i8** %1320
  call void @pthread_create(i8* %1321, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.47 to i8*), i8* %1319)
  %1322 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %146, i32 0, i32 0
  store %FIFO* %827, %FIFO** %1322
  %1323 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %146, i32 0, i32 1
  store %FIFO* %876, %FIFO** %1323
  %1324 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %146, i32 0, i32 2
  store %FIFO* %877, %FIFO** %1324
  %1325 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %146 to i8*
  store i32* %thread_id48, i32** %147
  %1326 = bitcast i32*** %148 to i8**
  store i32** %147, i32*** %148
  %1327 = load i8*, i8** %1326
  call void @pthread_create(i8* %1327, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.48 to i8*), i8* %1325)
  %1328 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %149, i32 0, i32 0
  store %FIFO* %828, %FIFO** %1328
  %1329 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %149, i32 0, i32 1
  store %FIFO* %878, %FIFO** %1329
  %1330 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %149, i32 0, i32 2
  store %FIFO* %879, %FIFO** %1330
  %1331 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %149 to i8*
  store i32* %thread_id49, i32** %150
  %1332 = bitcast i32*** %151 to i8**
  store i32** %150, i32*** %151
  %1333 = load i8*, i8** %1332
  call void @pthread_create(i8* %1333, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.49 to i8*), i8* %1331)
  %1334 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %152, i32 0, i32 0
  store %FIFO* %829, %FIFO** %1334
  %1335 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %152, i32 0, i32 1
  store %FIFO* %880, %FIFO** %1335
  %1336 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %152, i32 0, i32 2
  store %FIFO* %881, %FIFO** %1336
  %1337 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %152 to i8*
  store i32* %thread_id50, i32** %153
  %1338 = bitcast i32*** %154 to i8**
  store i32** %153, i32*** %154
  %1339 = load i8*, i8** %1338
  call void @pthread_create(i8* %1339, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.50 to i8*), i8* %1337)
  %1340 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %155, i32 0, i32 0
  store %FIFO* %830, %FIFO** %1340
  %1341 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %155, i32 0, i32 1
  store %FIFO* %882, %FIFO** %1341
  %1342 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %155, i32 0, i32 2
  store %FIFO* %883, %FIFO** %1342
  %1343 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %155 to i8*
  store i32* %thread_id51, i32** %156
  %1344 = bitcast i32*** %157 to i8**
  store i32** %156, i32*** %157
  %1345 = load i8*, i8** %1344
  call void @pthread_create(i8* %1345, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.51 to i8*), i8* %1343)
  %1346 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %158, i32 0, i32 0
  store %FIFO* %831, %FIFO** %1346
  %1347 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %158, i32 0, i32 1
  store %FIFO* %884, %FIFO** %1347
  %1348 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %158, i32 0, i32 2
  store %FIFO* %885, %FIFO** %1348
  %1349 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %158 to i8*
  store i32* %thread_id52, i32** %159
  %1350 = bitcast i32*** %160 to i8**
  store i32** %159, i32*** %160
  %1351 = load i8*, i8** %1350
  call void @pthread_create(i8* %1351, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.52 to i8*), i8* %1349)
  %1352 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %161, i32 0, i32 0
  store %FIFO* %832, %FIFO** %1352
  %1353 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %161, i32 0, i32 1
  store %FIFO* %886, %FIFO** %1353
  %1354 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %161, i32 0, i32 2
  store %FIFO* %887, %FIFO** %1354
  %1355 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %161 to i8*
  store i32* %thread_id53, i32** %162
  %1356 = bitcast i32*** %163 to i8**
  store i32** %162, i32*** %163
  %1357 = load i8*, i8** %1356
  call void @pthread_create(i8* %1357, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.53 to i8*), i8* %1355)
  %1358 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %164, i32 0, i32 0
  store %FIFO* %833, %FIFO** %1358
  %1359 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %164, i32 0, i32 1
  store %FIFO* %888, %FIFO** %1359
  %1360 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %164, i32 0, i32 2
  store %FIFO* %889, %FIFO** %1360
  %1361 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %164 to i8*
  store i32* %thread_id54, i32** %165
  %1362 = bitcast i32*** %166 to i8**
  store i32** %165, i32*** %166
  %1363 = load i8*, i8** %1362
  call void @pthread_create(i8* %1363, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.54 to i8*), i8* %1361)
  %1364 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %167, i32 0, i32 0
  store %FIFO* %834, %FIFO** %1364
  %1365 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %167, i32 0, i32 1
  store %FIFO* %890, %FIFO** %1365
  %1366 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %167, i32 0, i32 2
  store %FIFO* %891, %FIFO** %1366
  %1367 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %167 to i8*
  store i32* %thread_id55, i32** %168
  %1368 = bitcast i32*** %169 to i8**
  store i32** %168, i32*** %169
  %1369 = load i8*, i8** %1368
  call void @pthread_create(i8* %1369, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.55 to i8*), i8* %1367)
  %1370 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %170, i32 0, i32 0
  store %FIFO* %835, %FIFO** %1370
  %1371 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %170, i32 0, i32 1
  store %FIFO* %892, %FIFO** %1371
  %1372 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %170, i32 0, i32 2
  store %FIFO* %893, %FIFO** %1372
  %1373 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %170 to i8*
  store i32* %thread_id56, i32** %171
  %1374 = bitcast i32*** %172 to i8**
  store i32** %171, i32*** %172
  %1375 = load i8*, i8** %1374
  call void @pthread_create(i8* %1375, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.56 to i8*), i8* %1373)
  %1376 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %173, i32 0, i32 0
  store %FIFO* %836, %FIFO** %1376
  %1377 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %173, i32 0, i32 1
  store %FIFO* %894, %FIFO** %1377
  %1378 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %173, i32 0, i32 2
  store %FIFO* %895, %FIFO** %1378
  %1379 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %173 to i8*
  store i32* %thread_id57, i32** %174
  %1380 = bitcast i32*** %175 to i8**
  store i32** %174, i32*** %175
  %1381 = load i8*, i8** %1380
  call void @pthread_create(i8* %1381, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.57 to i8*), i8* %1379)
  %1382 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %176, i32 0, i32 0
  store %FIFO* %837, %FIFO** %1382
  %1383 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %176, i32 0, i32 1
  store %FIFO* %896, %FIFO** %1383
  %1384 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %176, i32 0, i32 2
  store %FIFO* %897, %FIFO** %1384
  %1385 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %176 to i8*
  store i32* %thread_id58, i32** %177
  %1386 = bitcast i32*** %178 to i8**
  store i32** %177, i32*** %178
  %1387 = load i8*, i8** %1386
  call void @pthread_create(i8* %1387, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.58 to i8*), i8* %1385)
  %1388 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %179, i32 0, i32 0
  store %FIFO* %838, %FIFO** %1388
  %1389 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %179, i32 0, i32 1
  store %FIFO* %898, %FIFO** %1389
  %1390 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %179, i32 0, i32 2
  store %FIFO* %899, %FIFO** %1390
  %1391 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %179 to i8*
  store i32* %thread_id59, i32** %180
  %1392 = bitcast i32*** %181 to i8**
  store i32** %180, i32*** %181
  %1393 = load i8*, i8** %1392
  call void @pthread_create(i8* %1393, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.59 to i8*), i8* %1391)
  %1394 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %182, i32 0, i32 0
  store %FIFO* %839, %FIFO** %1394
  %1395 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %182, i32 0, i32 1
  store %FIFO* %900, %FIFO** %1395
  %1396 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %182, i32 0, i32 2
  store %FIFO* %901, %FIFO** %1396
  %1397 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %182 to i8*
  store i32* %thread_id60, i32** %183
  %1398 = bitcast i32*** %184 to i8**
  store i32** %183, i32*** %184
  %1399 = load i8*, i8** %1398
  call void @pthread_create(i8* %1399, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.60 to i8*), i8* %1397)
  %1400 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %185, i32 0, i32 0
  store %FIFO* %840, %FIFO** %1400
  %1401 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %185, i32 0, i32 1
  store %FIFO* %902, %FIFO** %1401
  %1402 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %185, i32 0, i32 2
  store %FIFO* %903, %FIFO** %1402
  %1403 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %185 to i8*
  store i32* %thread_id61, i32** %186
  %1404 = bitcast i32*** %187 to i8**
  store i32** %186, i32*** %187
  %1405 = load i8*, i8** %1404
  call void @pthread_create(i8* %1405, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.61 to i8*), i8* %1403)
  %1406 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %188, i32 0, i32 0
  store %FIFO* %841, %FIFO** %1406
  %1407 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %188, i32 0, i32 1
  store %FIFO* %904, %FIFO** %1407
  %1408 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %188, i32 0, i32 2
  store %FIFO* %905, %FIFO** %1408
  %1409 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %188 to i8*
  store i32* %thread_id62, i32** %189
  %1410 = bitcast i32*** %190 to i8**
  store i32** %189, i32*** %190
  %1411 = load i8*, i8** %1410
  call void @pthread_create(i8* %1411, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.62 to i8*), i8* %1409)
  %1412 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %191, i32 0, i32 0
  store %FIFO* %842, %FIFO** %1412
  %1413 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %191, i32 0, i32 1
  store %FIFO* %906, %FIFO** %1413
  %1414 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %191, i32 0, i32 2
  store %FIFO* %907, %FIFO** %1414
  %1415 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %191 to i8*
  store i32* %thread_id63, i32** %192
  %1416 = bitcast i32*** %193 to i8**
  store i32** %192, i32*** %193
  %1417 = load i8*, i8** %1416
  call void @pthread_create(i8* %1417, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.63 to i8*), i8* %1415)
  %1418 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %194, i32 0, i32 0
  store %FIFO* %843, %FIFO** %1418
  %1419 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %194, i32 0, i32 1
  store %FIFO* %908, %FIFO** %1419
  %1420 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %194, i32 0, i32 2
  store %FIFO* %909, %FIFO** %1420
  %1421 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %194 to i8*
  store i32* %thread_id64, i32** %195
  %1422 = bitcast i32*** %196 to i8**
  store i32** %195, i32*** %196
  %1423 = load i8*, i8** %1422
  call void @pthread_create(i8* %1423, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.64 to i8*), i8* %1421)
  %1424 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %197, i32 0, i32 0
  store %FIFO* %844, %FIFO** %1424
  %1425 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %197, i32 0, i32 1
  store %FIFO* %910, %FIFO** %1425
  %1426 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %197, i32 0, i32 2
  store %FIFO* %911, %FIFO** %1426
  %1427 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %197 to i8*
  store i32* %thread_id65, i32** %198
  %1428 = bitcast i32*** %199 to i8**
  store i32** %198, i32*** %199
  %1429 = load i8*, i8** %1428
  call void @pthread_create(i8* %1429, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.65 to i8*), i8* %1427)
  %1430 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %200, i32 0, i32 0
  store %FIFO* %845, %FIFO** %1430
  %1431 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %200, i32 0, i32 1
  store %FIFO* %912, %FIFO** %1431
  %1432 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %200, i32 0, i32 2
  store %FIFO* %913, %FIFO** %1432
  %1433 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %200 to i8*
  store i32* %thread_id66, i32** %201
  %1434 = bitcast i32*** %202 to i8**
  store i32** %201, i32*** %202
  %1435 = load i8*, i8** %1434
  call void @pthread_create(i8* %1435, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.66 to i8*), i8* %1433)
  %1436 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %203, i32 0, i32 0
  store %FIFO* %846, %FIFO** %1436
  %1437 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %203, i32 0, i32 1
  store %FIFO* %914, %FIFO** %1437
  %1438 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %203, i32 0, i32 2
  store %FIFO* %915, %FIFO** %1438
  %1439 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %203 to i8*
  store i32* %thread_id67, i32** %204
  %1440 = bitcast i32*** %205 to i8**
  store i32** %204, i32*** %205
  %1441 = load i8*, i8** %1440
  call void @pthread_create(i8* %1441, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.67 to i8*), i8* %1439)
  %1442 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %206, i32 0, i32 0
  store %FIFO* %847, %FIFO** %1442
  %1443 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %206, i32 0, i32 1
  store %FIFO* %916, %FIFO** %1443
  %1444 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %206, i32 0, i32 2
  store %FIFO* %917, %FIFO** %1444
  %1445 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %206 to i8*
  store i32* %thread_id68, i32** %207
  %1446 = bitcast i32*** %208 to i8**
  store i32** %207, i32*** %208
  %1447 = load i8*, i8** %1446
  call void @pthread_create(i8* %1447, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.68 to i8*), i8* %1445)
  %1448 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %209, i32 0, i32 0
  store %FIFO* %848, %FIFO** %1448
  %1449 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %209, i32 0, i32 1
  store %FIFO* %918, %FIFO** %1449
  %1450 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %209, i32 0, i32 2
  store %FIFO* %919, %FIFO** %1450
  %1451 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %209 to i8*
  store i32* %thread_id69, i32** %210
  %1452 = bitcast i32*** %211 to i8**
  store i32** %210, i32*** %211
  %1453 = load i8*, i8** %1452
  call void @pthread_create(i8* %1453, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.69 to i8*), i8* %1451)
  %1454 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %212, i32 0, i32 0
  store %FIFO* %849, %FIFO** %1454
  %1455 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %212, i32 0, i32 1
  store %FIFO* %920, %FIFO** %1455
  %1456 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %212, i32 0, i32 2
  store %FIFO* %921, %FIFO** %1456
  %1457 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %212 to i8*
  store i32* %thread_id70, i32** %213
  %1458 = bitcast i32*** %214 to i8**
  store i32** %213, i32*** %214
  %1459 = load i8*, i8** %1458
  call void @pthread_create(i8* %1459, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.70 to i8*), i8* %1457)
  %1460 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %215, i32 0, i32 0
  store %FIFO* %850, %FIFO** %1460
  %1461 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %215, i32 0, i32 1
  store %FIFO* %922, %FIFO** %1461
  %1462 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %215, i32 0, i32 2
  store %FIFO* %923, %FIFO** %1462
  %1463 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %215 to i8*
  store i32* %thread_id71, i32** %216
  %1464 = bitcast i32*** %217 to i8**
  store i32** %216, i32*** %217
  %1465 = load i8*, i8** %1464
  call void @pthread_create(i8* %1465, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.71 to i8*), i8* %1463)
  %1466 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %218, i32 0, i32 0
  store %FIFO* %851, %FIFO** %1466
  %1467 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %218, i32 0, i32 1
  store %FIFO* %924, %FIFO** %1467
  %1468 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %218, i32 0, i32 2
  store %FIFO* %925, %FIFO** %1468
  %1469 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %218 to i8*
  store i32* %thread_id72, i32** %219
  %1470 = bitcast i32*** %220 to i8**
  store i32** %219, i32*** %220
  %1471 = load i8*, i8** %1470
  call void @pthread_create(i8* %1471, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.72 to i8*), i8* %1469)
  %1472 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %221, i32 0, i32 0
  store %FIFO* %852, %FIFO** %1472
  %1473 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %221, i32 0, i32 1
  store %FIFO* %926, %FIFO** %1473
  %1474 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %221, i32 0, i32 2
  store %FIFO* %927, %FIFO** %1474
  %1475 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %221 to i8*
  store i32* %thread_id73, i32** %222
  %1476 = bitcast i32*** %223 to i8**
  store i32** %222, i32*** %223
  %1477 = load i8*, i8** %1476
  call void @pthread_create(i8* %1477, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.73 to i8*), i8* %1475)
  %1478 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %224, i32 0, i32 0
  store %FIFO* %853, %FIFO** %1478
  %1479 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %224, i32 0, i32 1
  store %FIFO* %928, %FIFO** %1479
  %1480 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %224, i32 0, i32 2
  store %FIFO* %929, %FIFO** %1480
  %1481 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %224 to i8*
  store i32* %thread_id74, i32** %225
  %1482 = bitcast i32*** %226 to i8**
  store i32** %225, i32*** %226
  %1483 = load i8*, i8** %1482
  call void @pthread_create(i8* %1483, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.74 to i8*), i8* %1481)
  %1484 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %227, i32 0, i32 0
  store %FIFO* %854, %FIFO** %1484
  %1485 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %227, i32 0, i32 1
  store %FIFO* %930, %FIFO** %1485
  %1486 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %227, i32 0, i32 2
  store %FIFO* %931, %FIFO** %1486
  %1487 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %227 to i8*
  store i32* %thread_id75, i32** %228
  %1488 = bitcast i32*** %229 to i8**
  store i32** %228, i32*** %229
  %1489 = load i8*, i8** %1488
  call void @pthread_create(i8* %1489, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.75 to i8*), i8* %1487)
  %1490 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %230, i32 0, i32 0
  store %FIFO* %855, %FIFO** %1490
  %1491 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %230, i32 0, i32 1
  store %FIFO* %932, %FIFO** %1491
  %1492 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %230, i32 0, i32 2
  store %FIFO* %933, %FIFO** %1492
  %1493 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %230 to i8*
  store i32* %thread_id76, i32** %231
  %1494 = bitcast i32*** %232 to i8**
  store i32** %231, i32*** %232
  %1495 = load i8*, i8** %1494
  call void @pthread_create(i8* %1495, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.76 to i8*), i8* %1493)
  %1496 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %233, i32 0, i32 0
  store %FIFO* %856, %FIFO** %1496
  %1497 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %233, i32 0, i32 1
  store %FIFO* %934, %FIFO** %1497
  %1498 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %233, i32 0, i32 2
  store %FIFO* %935, %FIFO** %1498
  %1499 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %233 to i8*
  store i32* %thread_id77, i32** %234
  %1500 = bitcast i32*** %235 to i8**
  store i32** %234, i32*** %235
  %1501 = load i8*, i8** %1500
  call void @pthread_create(i8* %1501, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.77 to i8*), i8* %1499)
  %1502 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %236, i32 0, i32 0
  store %FIFO* %857, %FIFO** %1502
  %1503 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %236, i32 0, i32 1
  store %FIFO* %936, %FIFO** %1503
  %1504 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %236, i32 0, i32 2
  store %FIFO* %937, %FIFO** %1504
  %1505 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %236 to i8*
  store i32* %thread_id78, i32** %237
  %1506 = bitcast i32*** %238 to i8**
  store i32** %237, i32*** %238
  %1507 = load i8*, i8** %1506
  call void @pthread_create(i8* %1507, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.78 to i8*), i8* %1505)
  %1508 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %239, i32 0, i32 0
  store %FIFO* %858, %FIFO** %1508
  %1509 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %239, i32 0, i32 1
  store %FIFO* %938, %FIFO** %1509
  %1510 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %239, i32 0, i32 2
  store %FIFO* %939, %FIFO** %1510
  %1511 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %239 to i8*
  store i32* %thread_id79, i32** %240
  %1512 = bitcast i32*** %241 to i8**
  store i32** %240, i32*** %241
  %1513 = load i8*, i8** %1512
  call void @pthread_create(i8* %1513, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.79 to i8*), i8* %1511)
  %1514 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %242, i32 0, i32 0
  store %FIFO* %859, %FIFO** %1514
  %1515 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %242, i32 0, i32 1
  store %FIFO* %940, %FIFO** %1515
  %1516 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %242, i32 0, i32 2
  store %FIFO* %941, %FIFO** %1516
  %1517 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %242 to i8*
  store i32* %thread_id80, i32** %243
  %1518 = bitcast i32*** %244 to i8**
  store i32** %243, i32*** %244
  %1519 = load i8*, i8** %1518
  call void @pthread_create(i8* %1519, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.80 to i8*), i8* %1517)
  %1520 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %245, i32 0, i32 0
  store %FIFO* %860, %FIFO** %1520
  %1521 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %245, i32 0, i32 1
  store %FIFO* %942, %FIFO** %1521
  %1522 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %245, i32 0, i32 2
  store %FIFO* %943, %FIFO** %1522
  %1523 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %245 to i8*
  store i32* %thread_id81, i32** %246
  %1524 = bitcast i32*** %247 to i8**
  store i32** %246, i32*** %247
  %1525 = load i8*, i8** %1524
  call void @pthread_create(i8* %1525, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.81 to i8*), i8* %1523)
  %1526 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %248, i32 0, i32 0
  store %FIFO* %861, %FIFO** %1526
  %1527 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %248, i32 0, i32 1
  store %FIFO* %944, %FIFO** %1527
  %1528 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %248, i32 0, i32 2
  store %FIFO* %945, %FIFO** %1528
  %1529 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %248 to i8*
  store i32* %thread_id82, i32** %249
  %1530 = bitcast i32*** %250 to i8**
  store i32** %249, i32*** %250
  %1531 = load i8*, i8** %1530
  call void @pthread_create(i8* %1531, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.82 to i8*), i8* %1529)
  %1532 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %251, i32 0, i32 0
  store %FIFO* %862, %FIFO** %1532
  %1533 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %251, i32 0, i32 1
  store %FIFO* %946, %FIFO** %1533
  %1534 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %251, i32 0, i32 2
  store %FIFO* %947, %FIFO** %1534
  %1535 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %251 to i8*
  store i32* %thread_id83, i32** %252
  %1536 = bitcast i32*** %253 to i8**
  store i32** %252, i32*** %253
  %1537 = load i8*, i8** %1536
  call void @pthread_create(i8* %1537, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.83 to i8*), i8* %1535)
  %1538 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %254, i32 0, i32 0
  store %FIFO* %863, %FIFO** %1538
  %1539 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %254, i32 0, i32 1
  store %FIFO* %948, %FIFO** %1539
  %1540 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %254, i32 0, i32 2
  store %FIFO* %949, %FIFO** %1540
  %1541 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %254 to i8*
  store i32* %thread_id84, i32** %255
  %1542 = bitcast i32*** %256 to i8**
  store i32** %255, i32*** %256
  %1543 = load i8*, i8** %1542
  call void @pthread_create(i8* %1543, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.84 to i8*), i8* %1541)
  %1544 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %257, i32 0, i32 0
  store %FIFO* %864, %FIFO** %1544
  %1545 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %257, i32 0, i32 1
  store %FIFO* %950, %FIFO** %1545
  %1546 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %257, i32 0, i32 2
  store %FIFO* %951, %FIFO** %1546
  %1547 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %257 to i8*
  store i32* %thread_id85, i32** %258
  %1548 = bitcast i32*** %259 to i8**
  store i32** %258, i32*** %259
  %1549 = load i8*, i8** %1548
  call void @pthread_create(i8* %1549, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.85 to i8*), i8* %1547)
  %1550 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %260, i32 0, i32 0
  store %FIFO* %865, %FIFO** %1550
  %1551 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %260, i32 0, i32 1
  store %FIFO* %952, %FIFO** %1551
  %1552 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %260, i32 0, i32 2
  store %FIFO* %953, %FIFO** %1552
  %1553 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %260 to i8*
  store i32* %thread_id86, i32** %261
  %1554 = bitcast i32*** %262 to i8**
  store i32** %261, i32*** %262
  %1555 = load i8*, i8** %1554
  call void @pthread_create(i8* %1555, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.86 to i8*), i8* %1553)
  %1556 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %263, i32 0, i32 0
  store %FIFO* %866, %FIFO** %1556
  %1557 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %263, i32 0, i32 1
  store %FIFO* %954, %FIFO** %1557
  %1558 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %263, i32 0, i32 2
  store %FIFO* %955, %FIFO** %1558
  %1559 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %263 to i8*
  store i32* %thread_id87, i32** %264
  %1560 = bitcast i32*** %265 to i8**
  store i32** %264, i32*** %265
  %1561 = load i8*, i8** %1560
  call void @pthread_create(i8* %1561, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.87 to i8*), i8* %1559)
  %1562 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %266, i32 0, i32 0
  store %FIFO* %867, %FIFO** %1562
  %1563 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %266, i32 0, i32 1
  store %FIFO* %956, %FIFO** %1563
  %1564 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %266, i32 0, i32 2
  store %FIFO* %957, %FIFO** %1564
  %1565 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %266 to i8*
  store i32* %thread_id88, i32** %267
  %1566 = bitcast i32*** %268 to i8**
  store i32** %267, i32*** %268
  %1567 = load i8*, i8** %1566
  call void @pthread_create(i8* %1567, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.88 to i8*), i8* %1565)
  %1568 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %269, i32 0, i32 0
  store %FIFO* %868, %FIFO** %1568
  %1569 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %269, i32 0, i32 1
  store %FIFO* %958, %FIFO** %1569
  %1570 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %269, i32 0, i32 2
  store %FIFO* %959, %FIFO** %1570
  %1571 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %269 to i8*
  store i32* %thread_id89, i32** %270
  %1572 = bitcast i32*** %271 to i8**
  store i32** %270, i32*** %271
  %1573 = load i8*, i8** %1572
  call void @pthread_create(i8* %1573, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.89 to i8*), i8* %1571)
  %1574 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %272, i32 0, i32 0
  store %FIFO* %869, %FIFO** %1574
  %1575 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %272, i32 0, i32 1
  store %FIFO* %960, %FIFO** %1575
  %1576 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %272, i32 0, i32 2
  store %FIFO* %961, %FIFO** %1576
  %1577 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %272 to i8*
  store i32* %thread_id90, i32** %273
  %1578 = bitcast i32*** %274 to i8**
  store i32** %273, i32*** %274
  %1579 = load i8*, i8** %1578
  call void @pthread_create(i8* %1579, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.90 to i8*), i8* %1577)
  %1580 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %275, i32 0, i32 0
  store %FIFO* %870, %FIFO** %1580
  %1581 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %275, i32 0, i32 1
  store %FIFO* %962, %FIFO** %1581
  %1582 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %275, i32 0, i32 2
  store %FIFO* %963, %FIFO** %1582
  %1583 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %275 to i8*
  store i32* %thread_id91, i32** %276
  %1584 = bitcast i32*** %277 to i8**
  store i32** %276, i32*** %277
  %1585 = load i8*, i8** %1584
  call void @pthread_create(i8* %1585, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.91 to i8*), i8* %1583)
  %1586 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %278, i32 0, i32 0
  store %FIFO* %871, %FIFO** %1586
  %1587 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %278, i32 0, i32 1
  store %FIFO* %964, %FIFO** %1587
  %1588 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %278, i32 0, i32 2
  store %FIFO* %965, %FIFO** %1588
  %1589 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %278 to i8*
  store i32* %thread_id92, i32** %279
  %1590 = bitcast i32*** %280 to i8**
  store i32** %279, i32*** %280
  %1591 = load i8*, i8** %1590
  call void @pthread_create(i8* %1591, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.92 to i8*), i8* %1589)
  %1592 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %281, i32 0, i32 0
  store %FIFO* %872, %FIFO** %1592
  %1593 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %281, i32 0, i32 1
  store %FIFO* %966, %FIFO** %1593
  %1594 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %281, i32 0, i32 2
  store %FIFO* %967, %FIFO** %1594
  %1595 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %281 to i8*
  store i32* %thread_id93, i32** %282
  %1596 = bitcast i32*** %283 to i8**
  store i32** %282, i32*** %283
  %1597 = load i8*, i8** %1596
  call void @pthread_create(i8* %1597, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.93 to i8*), i8* %1595)
  %1598 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %284, i32 0, i32 0
  store %FIFO* %873, %FIFO** %1598
  %1599 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %284, i32 0, i32 1
  store %FIFO* %968, %FIFO** %1599
  %1600 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %284, i32 0, i32 2
  store %FIFO* %969, %FIFO** %1600
  %1601 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %284 to i8*
  store i32* %thread_id94, i32** %285
  %1602 = bitcast i32*** %286 to i8**
  store i32** %285, i32*** %286
  %1603 = load i8*, i8** %1602
  call void @pthread_create(i8* %1603, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.94 to i8*), i8* %1601)
  %1604 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %287, i32 0, i32 0
  store %FIFO* %874, %FIFO** %1604
  %1605 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %287, i32 0, i32 1
  store %FIFO* %970, %FIFO** %1605
  %1606 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %287, i32 0, i32 2
  store %FIFO* %971, %FIFO** %1606
  %1607 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %287 to i8*
  store i32* %thread_id95, i32** %288
  %1608 = bitcast i32*** %289 to i8**
  store i32** %288, i32*** %289
  %1609 = load i8*, i8** %1608
  call void @pthread_create(i8* %1609, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.95 to i8*), i8* %1607)
  %1610 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %290, i32 0, i32 0
  store %FIFO* %875, %FIFO** %1610
  %1611 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %290, i32 0, i32 1
  store %FIFO* %972, %FIFO** %1611
  %1612 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %290, i32 0, i32 2
  store %FIFO* %973, %FIFO** %1612
  %1613 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %290 to i8*
  store i32* %thread_id96, i32** %291
  %1614 = bitcast i32*** %292 to i8**
  store i32** %291, i32*** %292
  %1615 = load i8*, i8** %1614
  call void @pthread_create(i8* %1615, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.96 to i8*), i8* %1613)
  %1616 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %293, i32 0, i32 0
  store %FIFO* %876, %FIFO** %1616
  %1617 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %293, i32 0, i32 1
  store %FIFO* %974, %FIFO** %1617
  %1618 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %293, i32 0, i32 2
  store %FIFO* %975, %FIFO** %1618
  %1619 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %293 to i8*
  store i32* %thread_id97, i32** %294
  %1620 = bitcast i32*** %295 to i8**
  store i32** %294, i32*** %295
  %1621 = load i8*, i8** %1620
  call void @pthread_create(i8* %1621, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.97 to i8*), i8* %1619)
  %1622 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %296, i32 0, i32 0
  store %FIFO* %877, %FIFO** %1622
  %1623 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %296, i32 0, i32 1
  store %FIFO* %976, %FIFO** %1623
  %1624 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %296, i32 0, i32 2
  store %FIFO* %977, %FIFO** %1624
  %1625 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %296 to i8*
  store i32* %thread_id98, i32** %297
  %1626 = bitcast i32*** %298 to i8**
  store i32** %297, i32*** %298
  %1627 = load i8*, i8** %1626
  call void @pthread_create(i8* %1627, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.98 to i8*), i8* %1625)
  %1628 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %299, i32 0, i32 0
  store %FIFO* %878, %FIFO** %1628
  %1629 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %299, i32 0, i32 1
  store %FIFO* %978, %FIFO** %1629
  %1630 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %299, i32 0, i32 2
  store %FIFO* %979, %FIFO** %1630
  %1631 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %299 to i8*
  store i32* %thread_id99, i32** %300
  %1632 = bitcast i32*** %301 to i8**
  store i32** %300, i32*** %301
  %1633 = load i8*, i8** %1632
  call void @pthread_create(i8* %1633, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.99 to i8*), i8* %1631)
  %1634 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %302, i32 0, i32 0
  store %FIFO* %879, %FIFO** %1634
  %1635 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %302, i32 0, i32 1
  store %FIFO* %980, %FIFO** %1635
  %1636 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %302, i32 0, i32 2
  store %FIFO* %981, %FIFO** %1636
  %1637 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %302 to i8*
  store i32* %thread_id100, i32** %303
  %1638 = bitcast i32*** %304 to i8**
  store i32** %303, i32*** %304
  %1639 = load i8*, i8** %1638
  call void @pthread_create(i8* %1639, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.100 to i8*), i8* %1637)
  %1640 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %305, i32 0, i32 0
  store %FIFO* %880, %FIFO** %1640
  %1641 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %305, i32 0, i32 1
  store %FIFO* %982, %FIFO** %1641
  %1642 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %305, i32 0, i32 2
  store %FIFO* %983, %FIFO** %1642
  %1643 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %305 to i8*
  store i32* %thread_id101, i32** %306
  %1644 = bitcast i32*** %307 to i8**
  store i32** %306, i32*** %307
  %1645 = load i8*, i8** %1644
  call void @pthread_create(i8* %1645, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.101 to i8*), i8* %1643)
  %1646 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %308, i32 0, i32 0
  store %FIFO* %881, %FIFO** %1646
  %1647 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %308, i32 0, i32 1
  store %FIFO* %984, %FIFO** %1647
  %1648 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %308, i32 0, i32 2
  store %FIFO* %985, %FIFO** %1648
  %1649 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %308 to i8*
  store i32* %thread_id102, i32** %309
  %1650 = bitcast i32*** %310 to i8**
  store i32** %309, i32*** %310
  %1651 = load i8*, i8** %1650
  call void @pthread_create(i8* %1651, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.102 to i8*), i8* %1649)
  %1652 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %311, i32 0, i32 0
  store %FIFO* %882, %FIFO** %1652
  %1653 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %311, i32 0, i32 1
  store %FIFO* %986, %FIFO** %1653
  %1654 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %311, i32 0, i32 2
  store %FIFO* %987, %FIFO** %1654
  %1655 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %311 to i8*
  store i32* %thread_id103, i32** %312
  %1656 = bitcast i32*** %313 to i8**
  store i32** %312, i32*** %313
  %1657 = load i8*, i8** %1656
  call void @pthread_create(i8* %1657, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.103 to i8*), i8* %1655)
  %1658 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %314, i32 0, i32 0
  store %FIFO* %883, %FIFO** %1658
  %1659 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %314, i32 0, i32 1
  store %FIFO* %988, %FIFO** %1659
  %1660 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %314, i32 0, i32 2
  store %FIFO* %989, %FIFO** %1660
  %1661 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %314 to i8*
  store i32* %thread_id104, i32** %315
  %1662 = bitcast i32*** %316 to i8**
  store i32** %315, i32*** %316
  %1663 = load i8*, i8** %1662
  call void @pthread_create(i8* %1663, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.104 to i8*), i8* %1661)
  %1664 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %317, i32 0, i32 0
  store %FIFO* %884, %FIFO** %1664
  %1665 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %317, i32 0, i32 1
  store %FIFO* %990, %FIFO** %1665
  %1666 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %317, i32 0, i32 2
  store %FIFO* %991, %FIFO** %1666
  %1667 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %317 to i8*
  store i32* %thread_id105, i32** %318
  %1668 = bitcast i32*** %319 to i8**
  store i32** %318, i32*** %319
  %1669 = load i8*, i8** %1668
  call void @pthread_create(i8* %1669, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.105 to i8*), i8* %1667)
  %1670 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %320, i32 0, i32 0
  store %FIFO* %885, %FIFO** %1670
  %1671 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %320, i32 0, i32 1
  store %FIFO* %992, %FIFO** %1671
  %1672 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %320, i32 0, i32 2
  store %FIFO* %993, %FIFO** %1672
  %1673 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %320 to i8*
  store i32* %thread_id106, i32** %321
  %1674 = bitcast i32*** %322 to i8**
  store i32** %321, i32*** %322
  %1675 = load i8*, i8** %1674
  call void @pthread_create(i8* %1675, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.106 to i8*), i8* %1673)
  %1676 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %323, i32 0, i32 0
  store %FIFO* %886, %FIFO** %1676
  %1677 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %323, i32 0, i32 1
  store %FIFO* %994, %FIFO** %1677
  %1678 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %323, i32 0, i32 2
  store %FIFO* %995, %FIFO** %1678
  %1679 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %323 to i8*
  store i32* %thread_id107, i32** %324
  %1680 = bitcast i32*** %325 to i8**
  store i32** %324, i32*** %325
  %1681 = load i8*, i8** %1680
  call void @pthread_create(i8* %1681, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.107 to i8*), i8* %1679)
  %1682 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %326, i32 0, i32 0
  store %FIFO* %887, %FIFO** %1682
  %1683 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %326, i32 0, i32 1
  store %FIFO* %996, %FIFO** %1683
  %1684 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %326, i32 0, i32 2
  store %FIFO* %997, %FIFO** %1684
  %1685 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %326 to i8*
  store i32* %thread_id108, i32** %327
  %1686 = bitcast i32*** %328 to i8**
  store i32** %327, i32*** %328
  %1687 = load i8*, i8** %1686
  call void @pthread_create(i8* %1687, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.108 to i8*), i8* %1685)
  %1688 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %329, i32 0, i32 0
  store %FIFO* %888, %FIFO** %1688
  %1689 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %329, i32 0, i32 1
  store %FIFO* %998, %FIFO** %1689
  %1690 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %329, i32 0, i32 2
  store %FIFO* %999, %FIFO** %1690
  %1691 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %329 to i8*
  store i32* %thread_id109, i32** %330
  %1692 = bitcast i32*** %331 to i8**
  store i32** %330, i32*** %331
  %1693 = load i8*, i8** %1692
  call void @pthread_create(i8* %1693, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.109 to i8*), i8* %1691)
  %1694 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %332, i32 0, i32 0
  store %FIFO* %889, %FIFO** %1694
  %1695 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %332, i32 0, i32 1
  store %FIFO* %1000, %FIFO** %1695
  %1696 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %332, i32 0, i32 2
  store %FIFO* %1001, %FIFO** %1696
  %1697 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %332 to i8*
  store i32* %thread_id110, i32** %333
  %1698 = bitcast i32*** %334 to i8**
  store i32** %333, i32*** %334
  %1699 = load i8*, i8** %1698
  call void @pthread_create(i8* %1699, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.110 to i8*), i8* %1697)
  %1700 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %335, i32 0, i32 0
  store %FIFO* %890, %FIFO** %1700
  %1701 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %335, i32 0, i32 1
  store %FIFO* %1002, %FIFO** %1701
  %1702 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %335, i32 0, i32 2
  store %FIFO* %1003, %FIFO** %1702
  %1703 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %335 to i8*
  store i32* %thread_id111, i32** %336
  %1704 = bitcast i32*** %337 to i8**
  store i32** %336, i32*** %337
  %1705 = load i8*, i8** %1704
  call void @pthread_create(i8* %1705, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.111 to i8*), i8* %1703)
  %1706 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %338, i32 0, i32 0
  store %FIFO* %891, %FIFO** %1706
  %1707 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %338, i32 0, i32 1
  store %FIFO* %1004, %FIFO** %1707
  %1708 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %338, i32 0, i32 2
  store %FIFO* %1005, %FIFO** %1708
  %1709 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %338 to i8*
  store i32* %thread_id112, i32** %339
  %1710 = bitcast i32*** %340 to i8**
  store i32** %339, i32*** %340
  %1711 = load i8*, i8** %1710
  call void @pthread_create(i8* %1711, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.112 to i8*), i8* %1709)
  %1712 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %341, i32 0, i32 0
  store %FIFO* %892, %FIFO** %1712
  %1713 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %341, i32 0, i32 1
  store %FIFO* %1006, %FIFO** %1713
  %1714 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %341, i32 0, i32 2
  store %FIFO* %1007, %FIFO** %1714
  %1715 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %341 to i8*
  store i32* %thread_id113, i32** %342
  %1716 = bitcast i32*** %343 to i8**
  store i32** %342, i32*** %343
  %1717 = load i8*, i8** %1716
  call void @pthread_create(i8* %1717, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.113 to i8*), i8* %1715)
  %1718 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %344, i32 0, i32 0
  store %FIFO* %893, %FIFO** %1718
  %1719 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %344, i32 0, i32 1
  store %FIFO* %1008, %FIFO** %1719
  %1720 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %344, i32 0, i32 2
  store %FIFO* %1009, %FIFO** %1720
  %1721 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %344 to i8*
  store i32* %thread_id114, i32** %345
  %1722 = bitcast i32*** %346 to i8**
  store i32** %345, i32*** %346
  %1723 = load i8*, i8** %1722
  call void @pthread_create(i8* %1723, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.114 to i8*), i8* %1721)
  %1724 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %347, i32 0, i32 0
  store %FIFO* %894, %FIFO** %1724
  %1725 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %347, i32 0, i32 1
  store %FIFO* %1010, %FIFO** %1725
  %1726 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %347, i32 0, i32 2
  store %FIFO* %1011, %FIFO** %1726
  %1727 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %347 to i8*
  store i32* %thread_id115, i32** %348
  %1728 = bitcast i32*** %349 to i8**
  store i32** %348, i32*** %349
  %1729 = load i8*, i8** %1728
  call void @pthread_create(i8* %1729, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.115 to i8*), i8* %1727)
  %1730 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %350, i32 0, i32 0
  store %FIFO* %895, %FIFO** %1730
  %1731 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %350, i32 0, i32 1
  store %FIFO* %1012, %FIFO** %1731
  %1732 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %350, i32 0, i32 2
  store %FIFO* %1013, %FIFO** %1732
  %1733 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %350 to i8*
  store i32* %thread_id116, i32** %351
  %1734 = bitcast i32*** %352 to i8**
  store i32** %351, i32*** %352
  %1735 = load i8*, i8** %1734
  call void @pthread_create(i8* %1735, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.116 to i8*), i8* %1733)
  %1736 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %353, i32 0, i32 0
  store %FIFO* %896, %FIFO** %1736
  %1737 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %353, i32 0, i32 1
  store %FIFO* %1014, %FIFO** %1737
  %1738 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %353, i32 0, i32 2
  store %FIFO* %1015, %FIFO** %1738
  %1739 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %353 to i8*
  store i32* %thread_id117, i32** %354
  %1740 = bitcast i32*** %355 to i8**
  store i32** %354, i32*** %355
  %1741 = load i8*, i8** %1740
  call void @pthread_create(i8* %1741, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.117 to i8*), i8* %1739)
  %1742 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %356, i32 0, i32 0
  store %FIFO* %897, %FIFO** %1742
  %1743 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %356, i32 0, i32 1
  store %FIFO* %1016, %FIFO** %1743
  %1744 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %356, i32 0, i32 2
  store %FIFO* %1017, %FIFO** %1744
  %1745 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %356 to i8*
  store i32* %thread_id118, i32** %357
  %1746 = bitcast i32*** %358 to i8**
  store i32** %357, i32*** %358
  %1747 = load i8*, i8** %1746
  call void @pthread_create(i8* %1747, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.118 to i8*), i8* %1745)
  %1748 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %359, i32 0, i32 0
  store %FIFO* %898, %FIFO** %1748
  %1749 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %359, i32 0, i32 1
  store %FIFO* %1018, %FIFO** %1749
  %1750 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %359, i32 0, i32 2
  store %FIFO* %1019, %FIFO** %1750
  %1751 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %359 to i8*
  store i32* %thread_id119, i32** %360
  %1752 = bitcast i32*** %361 to i8**
  store i32** %360, i32*** %361
  %1753 = load i8*, i8** %1752
  call void @pthread_create(i8* %1753, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.119 to i8*), i8* %1751)
  %1754 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %362, i32 0, i32 0
  store %FIFO* %899, %FIFO** %1754
  %1755 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %362, i32 0, i32 1
  store %FIFO* %1020, %FIFO** %1755
  %1756 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %362, i32 0, i32 2
  store %FIFO* %1021, %FIFO** %1756
  %1757 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %362 to i8*
  store i32* %thread_id120, i32** %363
  %1758 = bitcast i32*** %364 to i8**
  store i32** %363, i32*** %364
  %1759 = load i8*, i8** %1758
  call void @pthread_create(i8* %1759, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.120 to i8*), i8* %1757)
  %1760 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %365, i32 0, i32 0
  store %FIFO* %900, %FIFO** %1760
  %1761 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %365, i32 0, i32 1
  store %FIFO* %1022, %FIFO** %1761
  %1762 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %365, i32 0, i32 2
  store %FIFO* %1023, %FIFO** %1762
  %1763 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %365 to i8*
  store i32* %thread_id121, i32** %366
  %1764 = bitcast i32*** %367 to i8**
  store i32** %366, i32*** %367
  %1765 = load i8*, i8** %1764
  call void @pthread_create(i8* %1765, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.121 to i8*), i8* %1763)
  %1766 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %368, i32 0, i32 0
  store %FIFO* %901, %FIFO** %1766
  %1767 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %368, i32 0, i32 1
  store %FIFO* %1024, %FIFO** %1767
  %1768 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %368, i32 0, i32 2
  store %FIFO* %1025, %FIFO** %1768
  %1769 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %368 to i8*
  store i32* %thread_id122, i32** %369
  %1770 = bitcast i32*** %370 to i8**
  store i32** %369, i32*** %370
  %1771 = load i8*, i8** %1770
  call void @pthread_create(i8* %1771, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.122 to i8*), i8* %1769)
  %1772 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %371, i32 0, i32 0
  store %FIFO* %902, %FIFO** %1772
  %1773 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %371, i32 0, i32 1
  store %FIFO* %1026, %FIFO** %1773
  %1774 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %371, i32 0, i32 2
  store %FIFO* %1027, %FIFO** %1774
  %1775 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %371 to i8*
  store i32* %thread_id123, i32** %372
  %1776 = bitcast i32*** %373 to i8**
  store i32** %372, i32*** %373
  %1777 = load i8*, i8** %1776
  call void @pthread_create(i8* %1777, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.123 to i8*), i8* %1775)
  %1778 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %374, i32 0, i32 0
  store %FIFO* %903, %FIFO** %1778
  %1779 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %374, i32 0, i32 1
  store %FIFO* %1028, %FIFO** %1779
  %1780 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %374, i32 0, i32 2
  store %FIFO* %1029, %FIFO** %1780
  %1781 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %374 to i8*
  store i32* %thread_id124, i32** %375
  %1782 = bitcast i32*** %376 to i8**
  store i32** %375, i32*** %376
  %1783 = load i8*, i8** %1782
  call void @pthread_create(i8* %1783, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.124 to i8*), i8* %1781)
  %1784 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %377, i32 0, i32 0
  store %FIFO* %904, %FIFO** %1784
  %1785 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %377, i32 0, i32 1
  store %FIFO* %1030, %FIFO** %1785
  %1786 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %377, i32 0, i32 2
  store %FIFO* %1031, %FIFO** %1786
  %1787 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %377 to i8*
  store i32* %thread_id125, i32** %378
  %1788 = bitcast i32*** %379 to i8**
  store i32** %378, i32*** %379
  %1789 = load i8*, i8** %1788
  call void @pthread_create(i8* %1789, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.125 to i8*), i8* %1787)
  %1790 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %380, i32 0, i32 0
  store %FIFO* %905, %FIFO** %1790
  %1791 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %380, i32 0, i32 1
  store %FIFO* %1032, %FIFO** %1791
  %1792 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %380, i32 0, i32 2
  store %FIFO* %1033, %FIFO** %1792
  %1793 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %380 to i8*
  store i32* %thread_id126, i32** %381
  %1794 = bitcast i32*** %382 to i8**
  store i32** %381, i32*** %382
  %1795 = load i8*, i8** %1794
  call void @pthread_create(i8* %1795, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.126 to i8*), i8* %1793)
  %1796 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1797 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1798 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1799 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1800 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1801 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1802 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1803 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1804 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1805 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1806 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1807 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1808 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1809 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1810 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1811 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1812 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1813 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1814 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1815 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1816 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1817 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1818 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1819 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1820 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1821 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1822 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1823 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1824 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1825 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1826 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1827 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1828 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1829 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1830 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1831 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1832 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1833 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1834 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1835 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1836 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1837 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1838 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1839 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1840 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1841 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1842 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1843 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1844 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1845 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1846 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1847 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1848 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1849 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1850 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1851 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1852 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1853 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1854 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1855 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1856 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1857 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1858 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1859 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1860 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1861 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1862 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1863 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1864 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1865 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1866 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1867 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1868 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1869 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1870 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1871 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1872 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1873 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1874 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1875 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1876 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1877 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1878 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1879 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1880 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1881 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1882 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1883 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1884 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1885 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1886 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1887 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1888 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1889 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1890 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1891 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1892 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1893 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1894 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1895 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1896 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1897 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1898 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1899 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1900 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1901 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1902 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1903 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1904 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1905 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1906 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1907 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1908 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1909 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1910 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1911 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1912 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1913 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1914 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1915 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1916 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1917 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1918 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1919 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1920 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1921 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1922 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %1923 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %383, i32 0, i32 0
  store %FIFO* %906, %FIFO** %1923
  %1924 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %383, i32 0, i32 1
  store %FIFO* %970, %FIFO** %1924
  %1925 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %383, i32 0, i32 2
  store %FIFO* %1796, %FIFO** %1925
  %1926 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %383 to i8*
  store i32* %thread_id127, i32** %384
  %1927 = bitcast i32*** %385 to i8**
  store i32** %384, i32*** %385
  %1928 = load i8*, i8** %1927
  call void @pthread_create(i8* %1928, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.127 to i8*), i8* %1926)
  %1929 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %386, i32 0, i32 0
  store %FIFO* %907, %FIFO** %1929
  %1930 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %386, i32 0, i32 1
  store %FIFO* %971, %FIFO** %1930
  %1931 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %386, i32 0, i32 2
  store %FIFO* %1797, %FIFO** %1931
  %1932 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %386 to i8*
  store i32* %thread_id128, i32** %387
  %1933 = bitcast i32*** %388 to i8**
  store i32** %387, i32*** %388
  %1934 = load i8*, i8** %1933
  call void @pthread_create(i8* %1934, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.128 to i8*), i8* %1932)
  %1935 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %389, i32 0, i32 0
  store %FIFO* %908, %FIFO** %1935
  %1936 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %389, i32 0, i32 1
  store %FIFO* %972, %FIFO** %1936
  %1937 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %389, i32 0, i32 2
  store %FIFO* %1798, %FIFO** %1937
  %1938 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %389 to i8*
  store i32* %thread_id129, i32** %390
  %1939 = bitcast i32*** %391 to i8**
  store i32** %390, i32*** %391
  %1940 = load i8*, i8** %1939
  call void @pthread_create(i8* %1940, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.129 to i8*), i8* %1938)
  %1941 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %392, i32 0, i32 0
  store %FIFO* %909, %FIFO** %1941
  %1942 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %392, i32 0, i32 1
  store %FIFO* %973, %FIFO** %1942
  %1943 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %392, i32 0, i32 2
  store %FIFO* %1799, %FIFO** %1943
  %1944 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %392 to i8*
  store i32* %thread_id130, i32** %393
  %1945 = bitcast i32*** %394 to i8**
  store i32** %393, i32*** %394
  %1946 = load i8*, i8** %1945
  call void @pthread_create(i8* %1946, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.130 to i8*), i8* %1944)
  %1947 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %395, i32 0, i32 0
  store %FIFO* %910, %FIFO** %1947
  %1948 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %395, i32 0, i32 1
  store %FIFO* %974, %FIFO** %1948
  %1949 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %395, i32 0, i32 2
  store %FIFO* %1800, %FIFO** %1949
  %1950 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %395 to i8*
  store i32* %thread_id131, i32** %396
  %1951 = bitcast i32*** %397 to i8**
  store i32** %396, i32*** %397
  %1952 = load i8*, i8** %1951
  call void @pthread_create(i8* %1952, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.131 to i8*), i8* %1950)
  %1953 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %398, i32 0, i32 0
  store %FIFO* %911, %FIFO** %1953
  %1954 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %398, i32 0, i32 1
  store %FIFO* %975, %FIFO** %1954
  %1955 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %398, i32 0, i32 2
  store %FIFO* %1801, %FIFO** %1955
  %1956 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %398 to i8*
  store i32* %thread_id132, i32** %399
  %1957 = bitcast i32*** %400 to i8**
  store i32** %399, i32*** %400
  %1958 = load i8*, i8** %1957
  call void @pthread_create(i8* %1958, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.132 to i8*), i8* %1956)
  %1959 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %401, i32 0, i32 0
  store %FIFO* %912, %FIFO** %1959
  %1960 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %401, i32 0, i32 1
  store %FIFO* %976, %FIFO** %1960
  %1961 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %401, i32 0, i32 2
  store %FIFO* %1802, %FIFO** %1961
  %1962 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %401 to i8*
  store i32* %thread_id133, i32** %402
  %1963 = bitcast i32*** %403 to i8**
  store i32** %402, i32*** %403
  %1964 = load i8*, i8** %1963
  call void @pthread_create(i8* %1964, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.133 to i8*), i8* %1962)
  %1965 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %404, i32 0, i32 0
  store %FIFO* %913, %FIFO** %1965
  %1966 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %404, i32 0, i32 1
  store %FIFO* %977, %FIFO** %1966
  %1967 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %404, i32 0, i32 2
  store %FIFO* %1803, %FIFO** %1967
  %1968 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %404 to i8*
  store i32* %thread_id134, i32** %405
  %1969 = bitcast i32*** %406 to i8**
  store i32** %405, i32*** %406
  %1970 = load i8*, i8** %1969
  call void @pthread_create(i8* %1970, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.134 to i8*), i8* %1968)
  %1971 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %407, i32 0, i32 0
  store %FIFO* %914, %FIFO** %1971
  %1972 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %407, i32 0, i32 1
  store %FIFO* %978, %FIFO** %1972
  %1973 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %407, i32 0, i32 2
  store %FIFO* %1804, %FIFO** %1973
  %1974 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %407 to i8*
  store i32* %thread_id135, i32** %408
  %1975 = bitcast i32*** %409 to i8**
  store i32** %408, i32*** %409
  %1976 = load i8*, i8** %1975
  call void @pthread_create(i8* %1976, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.135 to i8*), i8* %1974)
  %1977 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %410, i32 0, i32 0
  store %FIFO* %915, %FIFO** %1977
  %1978 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %410, i32 0, i32 1
  store %FIFO* %979, %FIFO** %1978
  %1979 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %410, i32 0, i32 2
  store %FIFO* %1805, %FIFO** %1979
  %1980 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %410 to i8*
  store i32* %thread_id136, i32** %411
  %1981 = bitcast i32*** %412 to i8**
  store i32** %411, i32*** %412
  %1982 = load i8*, i8** %1981
  call void @pthread_create(i8* %1982, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.136 to i8*), i8* %1980)
  %1983 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %413, i32 0, i32 0
  store %FIFO* %916, %FIFO** %1983
  %1984 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %413, i32 0, i32 1
  store %FIFO* %980, %FIFO** %1984
  %1985 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %413, i32 0, i32 2
  store %FIFO* %1806, %FIFO** %1985
  %1986 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %413 to i8*
  store i32* %thread_id137, i32** %414
  %1987 = bitcast i32*** %415 to i8**
  store i32** %414, i32*** %415
  %1988 = load i8*, i8** %1987
  call void @pthread_create(i8* %1988, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.137 to i8*), i8* %1986)
  %1989 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %416, i32 0, i32 0
  store %FIFO* %917, %FIFO** %1989
  %1990 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %416, i32 0, i32 1
  store %FIFO* %981, %FIFO** %1990
  %1991 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %416, i32 0, i32 2
  store %FIFO* %1807, %FIFO** %1991
  %1992 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %416 to i8*
  store i32* %thread_id138, i32** %417
  %1993 = bitcast i32*** %418 to i8**
  store i32** %417, i32*** %418
  %1994 = load i8*, i8** %1993
  call void @pthread_create(i8* %1994, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.138 to i8*), i8* %1992)
  %1995 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %419, i32 0, i32 0
  store %FIFO* %918, %FIFO** %1995
  %1996 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %419, i32 0, i32 1
  store %FIFO* %982, %FIFO** %1996
  %1997 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %419, i32 0, i32 2
  store %FIFO* %1808, %FIFO** %1997
  %1998 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %419 to i8*
  store i32* %thread_id139, i32** %420
  %1999 = bitcast i32*** %421 to i8**
  store i32** %420, i32*** %421
  %2000 = load i8*, i8** %1999
  call void @pthread_create(i8* %2000, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.139 to i8*), i8* %1998)
  %2001 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %422, i32 0, i32 0
  store %FIFO* %919, %FIFO** %2001
  %2002 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %422, i32 0, i32 1
  store %FIFO* %983, %FIFO** %2002
  %2003 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %422, i32 0, i32 2
  store %FIFO* %1809, %FIFO** %2003
  %2004 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %422 to i8*
  store i32* %thread_id140, i32** %423
  %2005 = bitcast i32*** %424 to i8**
  store i32** %423, i32*** %424
  %2006 = load i8*, i8** %2005
  call void @pthread_create(i8* %2006, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.140 to i8*), i8* %2004)
  %2007 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %425, i32 0, i32 0
  store %FIFO* %920, %FIFO** %2007
  %2008 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %425, i32 0, i32 1
  store %FIFO* %984, %FIFO** %2008
  %2009 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %425, i32 0, i32 2
  store %FIFO* %1810, %FIFO** %2009
  %2010 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %425 to i8*
  store i32* %thread_id141, i32** %426
  %2011 = bitcast i32*** %427 to i8**
  store i32** %426, i32*** %427
  %2012 = load i8*, i8** %2011
  call void @pthread_create(i8* %2012, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.141 to i8*), i8* %2010)
  %2013 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %428, i32 0, i32 0
  store %FIFO* %921, %FIFO** %2013
  %2014 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %428, i32 0, i32 1
  store %FIFO* %985, %FIFO** %2014
  %2015 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %428, i32 0, i32 2
  store %FIFO* %1811, %FIFO** %2015
  %2016 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %428 to i8*
  store i32* %thread_id142, i32** %429
  %2017 = bitcast i32*** %430 to i8**
  store i32** %429, i32*** %430
  %2018 = load i8*, i8** %2017
  call void @pthread_create(i8* %2018, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.142 to i8*), i8* %2016)
  %2019 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %431, i32 0, i32 0
  store %FIFO* %922, %FIFO** %2019
  %2020 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %431, i32 0, i32 1
  store %FIFO* %986, %FIFO** %2020
  %2021 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %431, i32 0, i32 2
  store %FIFO* %1812, %FIFO** %2021
  %2022 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %431 to i8*
  store i32* %thread_id143, i32** %432
  %2023 = bitcast i32*** %433 to i8**
  store i32** %432, i32*** %433
  %2024 = load i8*, i8** %2023
  call void @pthread_create(i8* %2024, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.143 to i8*), i8* %2022)
  %2025 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %434, i32 0, i32 0
  store %FIFO* %923, %FIFO** %2025
  %2026 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %434, i32 0, i32 1
  store %FIFO* %987, %FIFO** %2026
  %2027 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %434, i32 0, i32 2
  store %FIFO* %1813, %FIFO** %2027
  %2028 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %434 to i8*
  store i32* %thread_id144, i32** %435
  %2029 = bitcast i32*** %436 to i8**
  store i32** %435, i32*** %436
  %2030 = load i8*, i8** %2029
  call void @pthread_create(i8* %2030, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.144 to i8*), i8* %2028)
  %2031 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %437, i32 0, i32 0
  store %FIFO* %924, %FIFO** %2031
  %2032 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %437, i32 0, i32 1
  store %FIFO* %988, %FIFO** %2032
  %2033 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %437, i32 0, i32 2
  store %FIFO* %1814, %FIFO** %2033
  %2034 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %437 to i8*
  store i32* %thread_id145, i32** %438
  %2035 = bitcast i32*** %439 to i8**
  store i32** %438, i32*** %439
  %2036 = load i8*, i8** %2035
  call void @pthread_create(i8* %2036, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.145 to i8*), i8* %2034)
  %2037 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %440, i32 0, i32 0
  store %FIFO* %925, %FIFO** %2037
  %2038 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %440, i32 0, i32 1
  store %FIFO* %989, %FIFO** %2038
  %2039 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %440, i32 0, i32 2
  store %FIFO* %1815, %FIFO** %2039
  %2040 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %440 to i8*
  store i32* %thread_id146, i32** %441
  %2041 = bitcast i32*** %442 to i8**
  store i32** %441, i32*** %442
  %2042 = load i8*, i8** %2041
  call void @pthread_create(i8* %2042, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.146 to i8*), i8* %2040)
  %2043 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %443, i32 0, i32 0
  store %FIFO* %926, %FIFO** %2043
  %2044 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %443, i32 0, i32 1
  store %FIFO* %990, %FIFO** %2044
  %2045 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %443, i32 0, i32 2
  store %FIFO* %1816, %FIFO** %2045
  %2046 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %443 to i8*
  store i32* %thread_id147, i32** %444
  %2047 = bitcast i32*** %445 to i8**
  store i32** %444, i32*** %445
  %2048 = load i8*, i8** %2047
  call void @pthread_create(i8* %2048, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.147 to i8*), i8* %2046)
  %2049 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %446, i32 0, i32 0
  store %FIFO* %927, %FIFO** %2049
  %2050 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %446, i32 0, i32 1
  store %FIFO* %991, %FIFO** %2050
  %2051 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %446, i32 0, i32 2
  store %FIFO* %1817, %FIFO** %2051
  %2052 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %446 to i8*
  store i32* %thread_id148, i32** %447
  %2053 = bitcast i32*** %448 to i8**
  store i32** %447, i32*** %448
  %2054 = load i8*, i8** %2053
  call void @pthread_create(i8* %2054, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.148 to i8*), i8* %2052)
  %2055 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %449, i32 0, i32 0
  store %FIFO* %928, %FIFO** %2055
  %2056 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %449, i32 0, i32 1
  store %FIFO* %992, %FIFO** %2056
  %2057 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %449, i32 0, i32 2
  store %FIFO* %1818, %FIFO** %2057
  %2058 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %449 to i8*
  store i32* %thread_id149, i32** %450
  %2059 = bitcast i32*** %451 to i8**
  store i32** %450, i32*** %451
  %2060 = load i8*, i8** %2059
  call void @pthread_create(i8* %2060, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.149 to i8*), i8* %2058)
  %2061 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %452, i32 0, i32 0
  store %FIFO* %929, %FIFO** %2061
  %2062 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %452, i32 0, i32 1
  store %FIFO* %993, %FIFO** %2062
  %2063 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %452, i32 0, i32 2
  store %FIFO* %1819, %FIFO** %2063
  %2064 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %452 to i8*
  store i32* %thread_id150, i32** %453
  %2065 = bitcast i32*** %454 to i8**
  store i32** %453, i32*** %454
  %2066 = load i8*, i8** %2065
  call void @pthread_create(i8* %2066, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.150 to i8*), i8* %2064)
  %2067 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %455, i32 0, i32 0
  store %FIFO* %930, %FIFO** %2067
  %2068 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %455, i32 0, i32 1
  store %FIFO* %994, %FIFO** %2068
  %2069 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %455, i32 0, i32 2
  store %FIFO* %1820, %FIFO** %2069
  %2070 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %455 to i8*
  store i32* %thread_id151, i32** %456
  %2071 = bitcast i32*** %457 to i8**
  store i32** %456, i32*** %457
  %2072 = load i8*, i8** %2071
  call void @pthread_create(i8* %2072, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.151 to i8*), i8* %2070)
  %2073 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %458, i32 0, i32 0
  store %FIFO* %931, %FIFO** %2073
  %2074 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %458, i32 0, i32 1
  store %FIFO* %995, %FIFO** %2074
  %2075 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %458, i32 0, i32 2
  store %FIFO* %1821, %FIFO** %2075
  %2076 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %458 to i8*
  store i32* %thread_id152, i32** %459
  %2077 = bitcast i32*** %460 to i8**
  store i32** %459, i32*** %460
  %2078 = load i8*, i8** %2077
  call void @pthread_create(i8* %2078, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.152 to i8*), i8* %2076)
  %2079 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %461, i32 0, i32 0
  store %FIFO* %932, %FIFO** %2079
  %2080 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %461, i32 0, i32 1
  store %FIFO* %996, %FIFO** %2080
  %2081 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %461, i32 0, i32 2
  store %FIFO* %1822, %FIFO** %2081
  %2082 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %461 to i8*
  store i32* %thread_id153, i32** %462
  %2083 = bitcast i32*** %463 to i8**
  store i32** %462, i32*** %463
  %2084 = load i8*, i8** %2083
  call void @pthread_create(i8* %2084, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.153 to i8*), i8* %2082)
  %2085 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %464, i32 0, i32 0
  store %FIFO* %933, %FIFO** %2085
  %2086 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %464, i32 0, i32 1
  store %FIFO* %997, %FIFO** %2086
  %2087 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %464, i32 0, i32 2
  store %FIFO* %1823, %FIFO** %2087
  %2088 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %464 to i8*
  store i32* %thread_id154, i32** %465
  %2089 = bitcast i32*** %466 to i8**
  store i32** %465, i32*** %466
  %2090 = load i8*, i8** %2089
  call void @pthread_create(i8* %2090, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.154 to i8*), i8* %2088)
  %2091 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %467, i32 0, i32 0
  store %FIFO* %934, %FIFO** %2091
  %2092 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %467, i32 0, i32 1
  store %FIFO* %998, %FIFO** %2092
  %2093 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %467, i32 0, i32 2
  store %FIFO* %1824, %FIFO** %2093
  %2094 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %467 to i8*
  store i32* %thread_id155, i32** %468
  %2095 = bitcast i32*** %469 to i8**
  store i32** %468, i32*** %469
  %2096 = load i8*, i8** %2095
  call void @pthread_create(i8* %2096, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.155 to i8*), i8* %2094)
  %2097 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %470, i32 0, i32 0
  store %FIFO* %935, %FIFO** %2097
  %2098 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %470, i32 0, i32 1
  store %FIFO* %999, %FIFO** %2098
  %2099 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %470, i32 0, i32 2
  store %FIFO* %1825, %FIFO** %2099
  %2100 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %470 to i8*
  store i32* %thread_id156, i32** %471
  %2101 = bitcast i32*** %472 to i8**
  store i32** %471, i32*** %472
  %2102 = load i8*, i8** %2101
  call void @pthread_create(i8* %2102, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.156 to i8*), i8* %2100)
  %2103 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %473, i32 0, i32 0
  store %FIFO* %936, %FIFO** %2103
  %2104 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %473, i32 0, i32 1
  store %FIFO* %1000, %FIFO** %2104
  %2105 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %473, i32 0, i32 2
  store %FIFO* %1826, %FIFO** %2105
  %2106 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %473 to i8*
  store i32* %thread_id157, i32** %474
  %2107 = bitcast i32*** %475 to i8**
  store i32** %474, i32*** %475
  %2108 = load i8*, i8** %2107
  call void @pthread_create(i8* %2108, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.157 to i8*), i8* %2106)
  %2109 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %476, i32 0, i32 0
  store %FIFO* %937, %FIFO** %2109
  %2110 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %476, i32 0, i32 1
  store %FIFO* %1001, %FIFO** %2110
  %2111 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %476, i32 0, i32 2
  store %FIFO* %1827, %FIFO** %2111
  %2112 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %476 to i8*
  store i32* %thread_id158, i32** %477
  %2113 = bitcast i32*** %478 to i8**
  store i32** %477, i32*** %478
  %2114 = load i8*, i8** %2113
  call void @pthread_create(i8* %2114, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.158 to i8*), i8* %2112)
  %2115 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %479, i32 0, i32 0
  store %FIFO* %938, %FIFO** %2115
  %2116 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %479, i32 0, i32 1
  store %FIFO* %1002, %FIFO** %2116
  %2117 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %479, i32 0, i32 2
  store %FIFO* %1828, %FIFO** %2117
  %2118 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %479 to i8*
  store i32* %thread_id159, i32** %480
  %2119 = bitcast i32*** %481 to i8**
  store i32** %480, i32*** %481
  %2120 = load i8*, i8** %2119
  call void @pthread_create(i8* %2120, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.159 to i8*), i8* %2118)
  %2121 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %482, i32 0, i32 0
  store %FIFO* %939, %FIFO** %2121
  %2122 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %482, i32 0, i32 1
  store %FIFO* %1003, %FIFO** %2122
  %2123 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %482, i32 0, i32 2
  store %FIFO* %1829, %FIFO** %2123
  %2124 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %482 to i8*
  store i32* %thread_id160, i32** %483
  %2125 = bitcast i32*** %484 to i8**
  store i32** %483, i32*** %484
  %2126 = load i8*, i8** %2125
  call void @pthread_create(i8* %2126, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.160 to i8*), i8* %2124)
  %2127 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %485, i32 0, i32 0
  store %FIFO* %940, %FIFO** %2127
  %2128 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %485, i32 0, i32 1
  store %FIFO* %1004, %FIFO** %2128
  %2129 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %485, i32 0, i32 2
  store %FIFO* %1830, %FIFO** %2129
  %2130 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %485 to i8*
  store i32* %thread_id161, i32** %486
  %2131 = bitcast i32*** %487 to i8**
  store i32** %486, i32*** %487
  %2132 = load i8*, i8** %2131
  call void @pthread_create(i8* %2132, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.161 to i8*), i8* %2130)
  %2133 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %488, i32 0, i32 0
  store %FIFO* %941, %FIFO** %2133
  %2134 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %488, i32 0, i32 1
  store %FIFO* %1005, %FIFO** %2134
  %2135 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %488, i32 0, i32 2
  store %FIFO* %1831, %FIFO** %2135
  %2136 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %488 to i8*
  store i32* %thread_id162, i32** %489
  %2137 = bitcast i32*** %490 to i8**
  store i32** %489, i32*** %490
  %2138 = load i8*, i8** %2137
  call void @pthread_create(i8* %2138, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.162 to i8*), i8* %2136)
  %2139 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %491, i32 0, i32 0
  store %FIFO* %942, %FIFO** %2139
  %2140 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %491, i32 0, i32 1
  store %FIFO* %1006, %FIFO** %2140
  %2141 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %491, i32 0, i32 2
  store %FIFO* %1832, %FIFO** %2141
  %2142 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %491 to i8*
  store i32* %thread_id163, i32** %492
  %2143 = bitcast i32*** %493 to i8**
  store i32** %492, i32*** %493
  %2144 = load i8*, i8** %2143
  call void @pthread_create(i8* %2144, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.163 to i8*), i8* %2142)
  %2145 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %494, i32 0, i32 0
  store %FIFO* %943, %FIFO** %2145
  %2146 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %494, i32 0, i32 1
  store %FIFO* %1007, %FIFO** %2146
  %2147 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %494, i32 0, i32 2
  store %FIFO* %1833, %FIFO** %2147
  %2148 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %494 to i8*
  store i32* %thread_id164, i32** %495
  %2149 = bitcast i32*** %496 to i8**
  store i32** %495, i32*** %496
  %2150 = load i8*, i8** %2149
  call void @pthread_create(i8* %2150, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.164 to i8*), i8* %2148)
  %2151 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %497, i32 0, i32 0
  store %FIFO* %944, %FIFO** %2151
  %2152 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %497, i32 0, i32 1
  store %FIFO* %1008, %FIFO** %2152
  %2153 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %497, i32 0, i32 2
  store %FIFO* %1834, %FIFO** %2153
  %2154 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %497 to i8*
  store i32* %thread_id165, i32** %498
  %2155 = bitcast i32*** %499 to i8**
  store i32** %498, i32*** %499
  %2156 = load i8*, i8** %2155
  call void @pthread_create(i8* %2156, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.165 to i8*), i8* %2154)
  %2157 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %500, i32 0, i32 0
  store %FIFO* %945, %FIFO** %2157
  %2158 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %500, i32 0, i32 1
  store %FIFO* %1009, %FIFO** %2158
  %2159 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %500, i32 0, i32 2
  store %FIFO* %1835, %FIFO** %2159
  %2160 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %500 to i8*
  store i32* %thread_id166, i32** %501
  %2161 = bitcast i32*** %502 to i8**
  store i32** %501, i32*** %502
  %2162 = load i8*, i8** %2161
  call void @pthread_create(i8* %2162, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.166 to i8*), i8* %2160)
  %2163 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %503, i32 0, i32 0
  store %FIFO* %946, %FIFO** %2163
  %2164 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %503, i32 0, i32 1
  store %FIFO* %1010, %FIFO** %2164
  %2165 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %503, i32 0, i32 2
  store %FIFO* %1836, %FIFO** %2165
  %2166 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %503 to i8*
  store i32* %thread_id167, i32** %504
  %2167 = bitcast i32*** %505 to i8**
  store i32** %504, i32*** %505
  %2168 = load i8*, i8** %2167
  call void @pthread_create(i8* %2168, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.167 to i8*), i8* %2166)
  %2169 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %506, i32 0, i32 0
  store %FIFO* %947, %FIFO** %2169
  %2170 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %506, i32 0, i32 1
  store %FIFO* %1011, %FIFO** %2170
  %2171 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %506, i32 0, i32 2
  store %FIFO* %1837, %FIFO** %2171
  %2172 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %506 to i8*
  store i32* %thread_id168, i32** %507
  %2173 = bitcast i32*** %508 to i8**
  store i32** %507, i32*** %508
  %2174 = load i8*, i8** %2173
  call void @pthread_create(i8* %2174, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.168 to i8*), i8* %2172)
  %2175 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %509, i32 0, i32 0
  store %FIFO* %948, %FIFO** %2175
  %2176 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %509, i32 0, i32 1
  store %FIFO* %1012, %FIFO** %2176
  %2177 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %509, i32 0, i32 2
  store %FIFO* %1838, %FIFO** %2177
  %2178 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %509 to i8*
  store i32* %thread_id169, i32** %510
  %2179 = bitcast i32*** %511 to i8**
  store i32** %510, i32*** %511
  %2180 = load i8*, i8** %2179
  call void @pthread_create(i8* %2180, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.169 to i8*), i8* %2178)
  %2181 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %512, i32 0, i32 0
  store %FIFO* %949, %FIFO** %2181
  %2182 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %512, i32 0, i32 1
  store %FIFO* %1013, %FIFO** %2182
  %2183 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %512, i32 0, i32 2
  store %FIFO* %1839, %FIFO** %2183
  %2184 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %512 to i8*
  store i32* %thread_id170, i32** %513
  %2185 = bitcast i32*** %514 to i8**
  store i32** %513, i32*** %514
  %2186 = load i8*, i8** %2185
  call void @pthread_create(i8* %2186, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.170 to i8*), i8* %2184)
  %2187 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %515, i32 0, i32 0
  store %FIFO* %950, %FIFO** %2187
  %2188 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %515, i32 0, i32 1
  store %FIFO* %1014, %FIFO** %2188
  %2189 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %515, i32 0, i32 2
  store %FIFO* %1840, %FIFO** %2189
  %2190 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %515 to i8*
  store i32* %thread_id171, i32** %516
  %2191 = bitcast i32*** %517 to i8**
  store i32** %516, i32*** %517
  %2192 = load i8*, i8** %2191
  call void @pthread_create(i8* %2192, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.171 to i8*), i8* %2190)
  %2193 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %518, i32 0, i32 0
  store %FIFO* %951, %FIFO** %2193
  %2194 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %518, i32 0, i32 1
  store %FIFO* %1015, %FIFO** %2194
  %2195 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %518, i32 0, i32 2
  store %FIFO* %1841, %FIFO** %2195
  %2196 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %518 to i8*
  store i32* %thread_id172, i32** %519
  %2197 = bitcast i32*** %520 to i8**
  store i32** %519, i32*** %520
  %2198 = load i8*, i8** %2197
  call void @pthread_create(i8* %2198, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.172 to i8*), i8* %2196)
  %2199 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %521, i32 0, i32 0
  store %FIFO* %952, %FIFO** %2199
  %2200 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %521, i32 0, i32 1
  store %FIFO* %1016, %FIFO** %2200
  %2201 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %521, i32 0, i32 2
  store %FIFO* %1842, %FIFO** %2201
  %2202 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %521 to i8*
  store i32* %thread_id173, i32** %522
  %2203 = bitcast i32*** %523 to i8**
  store i32** %522, i32*** %523
  %2204 = load i8*, i8** %2203
  call void @pthread_create(i8* %2204, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.173 to i8*), i8* %2202)
  %2205 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %524, i32 0, i32 0
  store %FIFO* %953, %FIFO** %2205
  %2206 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %524, i32 0, i32 1
  store %FIFO* %1017, %FIFO** %2206
  %2207 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %524, i32 0, i32 2
  store %FIFO* %1843, %FIFO** %2207
  %2208 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %524 to i8*
  store i32* %thread_id174, i32** %525
  %2209 = bitcast i32*** %526 to i8**
  store i32** %525, i32*** %526
  %2210 = load i8*, i8** %2209
  call void @pthread_create(i8* %2210, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.174 to i8*), i8* %2208)
  %2211 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %527, i32 0, i32 0
  store %FIFO* %954, %FIFO** %2211
  %2212 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %527, i32 0, i32 1
  store %FIFO* %1018, %FIFO** %2212
  %2213 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %527, i32 0, i32 2
  store %FIFO* %1844, %FIFO** %2213
  %2214 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %527 to i8*
  store i32* %thread_id175, i32** %528
  %2215 = bitcast i32*** %529 to i8**
  store i32** %528, i32*** %529
  %2216 = load i8*, i8** %2215
  call void @pthread_create(i8* %2216, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.175 to i8*), i8* %2214)
  %2217 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %530, i32 0, i32 0
  store %FIFO* %955, %FIFO** %2217
  %2218 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %530, i32 0, i32 1
  store %FIFO* %1019, %FIFO** %2218
  %2219 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %530, i32 0, i32 2
  store %FIFO* %1845, %FIFO** %2219
  %2220 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %530 to i8*
  store i32* %thread_id176, i32** %531
  %2221 = bitcast i32*** %532 to i8**
  store i32** %531, i32*** %532
  %2222 = load i8*, i8** %2221
  call void @pthread_create(i8* %2222, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.176 to i8*), i8* %2220)
  %2223 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %533, i32 0, i32 0
  store %FIFO* %956, %FIFO** %2223
  %2224 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %533, i32 0, i32 1
  store %FIFO* %1020, %FIFO** %2224
  %2225 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %533, i32 0, i32 2
  store %FIFO* %1846, %FIFO** %2225
  %2226 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %533 to i8*
  store i32* %thread_id177, i32** %534
  %2227 = bitcast i32*** %535 to i8**
  store i32** %534, i32*** %535
  %2228 = load i8*, i8** %2227
  call void @pthread_create(i8* %2228, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.177 to i8*), i8* %2226)
  %2229 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %536, i32 0, i32 0
  store %FIFO* %957, %FIFO** %2229
  %2230 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %536, i32 0, i32 1
  store %FIFO* %1021, %FIFO** %2230
  %2231 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %536, i32 0, i32 2
  store %FIFO* %1847, %FIFO** %2231
  %2232 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %536 to i8*
  store i32* %thread_id178, i32** %537
  %2233 = bitcast i32*** %538 to i8**
  store i32** %537, i32*** %538
  %2234 = load i8*, i8** %2233
  call void @pthread_create(i8* %2234, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.178 to i8*), i8* %2232)
  %2235 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %539, i32 0, i32 0
  store %FIFO* %958, %FIFO** %2235
  %2236 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %539, i32 0, i32 1
  store %FIFO* %1022, %FIFO** %2236
  %2237 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %539, i32 0, i32 2
  store %FIFO* %1848, %FIFO** %2237
  %2238 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %539 to i8*
  store i32* %thread_id179, i32** %540
  %2239 = bitcast i32*** %541 to i8**
  store i32** %540, i32*** %541
  %2240 = load i8*, i8** %2239
  call void @pthread_create(i8* %2240, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.179 to i8*), i8* %2238)
  %2241 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %542, i32 0, i32 0
  store %FIFO* %959, %FIFO** %2241
  %2242 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %542, i32 0, i32 1
  store %FIFO* %1023, %FIFO** %2242
  %2243 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %542, i32 0, i32 2
  store %FIFO* %1849, %FIFO** %2243
  %2244 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %542 to i8*
  store i32* %thread_id180, i32** %543
  %2245 = bitcast i32*** %544 to i8**
  store i32** %543, i32*** %544
  %2246 = load i8*, i8** %2245
  call void @pthread_create(i8* %2246, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.180 to i8*), i8* %2244)
  %2247 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %545, i32 0, i32 0
  store %FIFO* %960, %FIFO** %2247
  %2248 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %545, i32 0, i32 1
  store %FIFO* %1024, %FIFO** %2248
  %2249 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %545, i32 0, i32 2
  store %FIFO* %1850, %FIFO** %2249
  %2250 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %545 to i8*
  store i32* %thread_id181, i32** %546
  %2251 = bitcast i32*** %547 to i8**
  store i32** %546, i32*** %547
  %2252 = load i8*, i8** %2251
  call void @pthread_create(i8* %2252, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.181 to i8*), i8* %2250)
  %2253 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %548, i32 0, i32 0
  store %FIFO* %961, %FIFO** %2253
  %2254 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %548, i32 0, i32 1
  store %FIFO* %1025, %FIFO** %2254
  %2255 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %548, i32 0, i32 2
  store %FIFO* %1851, %FIFO** %2255
  %2256 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %548 to i8*
  store i32* %thread_id182, i32** %549
  %2257 = bitcast i32*** %550 to i8**
  store i32** %549, i32*** %550
  %2258 = load i8*, i8** %2257
  call void @pthread_create(i8* %2258, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.182 to i8*), i8* %2256)
  %2259 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %551, i32 0, i32 0
  store %FIFO* %962, %FIFO** %2259
  %2260 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %551, i32 0, i32 1
  store %FIFO* %1026, %FIFO** %2260
  %2261 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %551, i32 0, i32 2
  store %FIFO* %1852, %FIFO** %2261
  %2262 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %551 to i8*
  store i32* %thread_id183, i32** %552
  %2263 = bitcast i32*** %553 to i8**
  store i32** %552, i32*** %553
  %2264 = load i8*, i8** %2263
  call void @pthread_create(i8* %2264, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.183 to i8*), i8* %2262)
  %2265 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %554, i32 0, i32 0
  store %FIFO* %963, %FIFO** %2265
  %2266 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %554, i32 0, i32 1
  store %FIFO* %1027, %FIFO** %2266
  %2267 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %554, i32 0, i32 2
  store %FIFO* %1853, %FIFO** %2267
  %2268 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %554 to i8*
  store i32* %thread_id184, i32** %555
  %2269 = bitcast i32*** %556 to i8**
  store i32** %555, i32*** %556
  %2270 = load i8*, i8** %2269
  call void @pthread_create(i8* %2270, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.184 to i8*), i8* %2268)
  %2271 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %557, i32 0, i32 0
  store %FIFO* %964, %FIFO** %2271
  %2272 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %557, i32 0, i32 1
  store %FIFO* %1028, %FIFO** %2272
  %2273 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %557, i32 0, i32 2
  store %FIFO* %1854, %FIFO** %2273
  %2274 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %557 to i8*
  store i32* %thread_id185, i32** %558
  %2275 = bitcast i32*** %559 to i8**
  store i32** %558, i32*** %559
  %2276 = load i8*, i8** %2275
  call void @pthread_create(i8* %2276, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.185 to i8*), i8* %2274)
  %2277 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %560, i32 0, i32 0
  store %FIFO* %965, %FIFO** %2277
  %2278 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %560, i32 0, i32 1
  store %FIFO* %1029, %FIFO** %2278
  %2279 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %560, i32 0, i32 2
  store %FIFO* %1855, %FIFO** %2279
  %2280 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %560 to i8*
  store i32* %thread_id186, i32** %561
  %2281 = bitcast i32*** %562 to i8**
  store i32** %561, i32*** %562
  %2282 = load i8*, i8** %2281
  call void @pthread_create(i8* %2282, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.186 to i8*), i8* %2280)
  %2283 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %563, i32 0, i32 0
  store %FIFO* %966, %FIFO** %2283
  %2284 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %563, i32 0, i32 1
  store %FIFO* %1030, %FIFO** %2284
  %2285 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %563, i32 0, i32 2
  store %FIFO* %1856, %FIFO** %2285
  %2286 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %563 to i8*
  store i32* %thread_id187, i32** %564
  %2287 = bitcast i32*** %565 to i8**
  store i32** %564, i32*** %565
  %2288 = load i8*, i8** %2287
  call void @pthread_create(i8* %2288, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.187 to i8*), i8* %2286)
  %2289 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %566, i32 0, i32 0
  store %FIFO* %967, %FIFO** %2289
  %2290 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %566, i32 0, i32 1
  store %FIFO* %1031, %FIFO** %2290
  %2291 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %566, i32 0, i32 2
  store %FIFO* %1857, %FIFO** %2291
  %2292 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %566 to i8*
  store i32* %thread_id188, i32** %567
  %2293 = bitcast i32*** %568 to i8**
  store i32** %567, i32*** %568
  %2294 = load i8*, i8** %2293
  call void @pthread_create(i8* %2294, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.188 to i8*), i8* %2292)
  %2295 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %569, i32 0, i32 0
  store %FIFO* %968, %FIFO** %2295
  %2296 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %569, i32 0, i32 1
  store %FIFO* %1032, %FIFO** %2296
  %2297 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %569, i32 0, i32 2
  store %FIFO* %1858, %FIFO** %2297
  %2298 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %569 to i8*
  store i32* %thread_id189, i32** %570
  %2299 = bitcast i32*** %571 to i8**
  store i32** %570, i32*** %571
  %2300 = load i8*, i8** %2299
  call void @pthread_create(i8* %2300, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.189 to i8*), i8* %2298)
  %2301 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %572, i32 0, i32 0
  store %FIFO* %969, %FIFO** %2301
  %2302 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %572, i32 0, i32 1
  store %FIFO* %1033, %FIFO** %2302
  %2303 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %572, i32 0, i32 2
  store %FIFO* %1859, %FIFO** %2303
  %2304 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %572 to i8*
  store i32* %thread_id190, i32** %573
  %2305 = bitcast i32*** %574 to i8**
  store i32** %573, i32*** %574
  %2306 = load i8*, i8** %2305
  call void @pthread_create(i8* %2306, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.190 to i8*), i8* %2304)
  %2307 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %575, i32 0, i32 0
  store %FIFO* %1796, %FIFO** %2307
  %2308 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %575, i32 0, i32 1
  store %FIFO* %1828, %FIFO** %2308
  %2309 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %575, i32 0, i32 2
  store %FIFO* %1860, %FIFO** %2309
  %2310 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %575 to i8*
  store i32* %thread_id191, i32** %576
  %2311 = bitcast i32*** %577 to i8**
  store i32** %576, i32*** %577
  %2312 = load i8*, i8** %2311
  call void @pthread_create(i8* %2312, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.191 to i8*), i8* %2310)
  %2313 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %578, i32 0, i32 0
  store %FIFO* %1797, %FIFO** %2313
  %2314 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %578, i32 0, i32 1
  store %FIFO* %1829, %FIFO** %2314
  %2315 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %578, i32 0, i32 2
  store %FIFO* %1861, %FIFO** %2315
  %2316 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %578 to i8*
  store i32* %thread_id192, i32** %579
  %2317 = bitcast i32*** %580 to i8**
  store i32** %579, i32*** %580
  %2318 = load i8*, i8** %2317
  call void @pthread_create(i8* %2318, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.192 to i8*), i8* %2316)
  %2319 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %581, i32 0, i32 0
  store %FIFO* %1798, %FIFO** %2319
  %2320 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %581, i32 0, i32 1
  store %FIFO* %1830, %FIFO** %2320
  %2321 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %581, i32 0, i32 2
  store %FIFO* %1862, %FIFO** %2321
  %2322 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %581 to i8*
  store i32* %thread_id193, i32** %582
  %2323 = bitcast i32*** %583 to i8**
  store i32** %582, i32*** %583
  %2324 = load i8*, i8** %2323
  call void @pthread_create(i8* %2324, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.193 to i8*), i8* %2322)
  %2325 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %584, i32 0, i32 0
  store %FIFO* %1799, %FIFO** %2325
  %2326 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %584, i32 0, i32 1
  store %FIFO* %1831, %FIFO** %2326
  %2327 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %584, i32 0, i32 2
  store %FIFO* %1863, %FIFO** %2327
  %2328 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %584 to i8*
  store i32* %thread_id194, i32** %585
  %2329 = bitcast i32*** %586 to i8**
  store i32** %585, i32*** %586
  %2330 = load i8*, i8** %2329
  call void @pthread_create(i8* %2330, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.194 to i8*), i8* %2328)
  %2331 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %587, i32 0, i32 0
  store %FIFO* %1800, %FIFO** %2331
  %2332 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %587, i32 0, i32 1
  store %FIFO* %1832, %FIFO** %2332
  %2333 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %587, i32 0, i32 2
  store %FIFO* %1864, %FIFO** %2333
  %2334 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %587 to i8*
  store i32* %thread_id195, i32** %588
  %2335 = bitcast i32*** %589 to i8**
  store i32** %588, i32*** %589
  %2336 = load i8*, i8** %2335
  call void @pthread_create(i8* %2336, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.195 to i8*), i8* %2334)
  %2337 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %590, i32 0, i32 0
  store %FIFO* %1801, %FIFO** %2337
  %2338 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %590, i32 0, i32 1
  store %FIFO* %1833, %FIFO** %2338
  %2339 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %590, i32 0, i32 2
  store %FIFO* %1865, %FIFO** %2339
  %2340 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %590 to i8*
  store i32* %thread_id196, i32** %591
  %2341 = bitcast i32*** %592 to i8**
  store i32** %591, i32*** %592
  %2342 = load i8*, i8** %2341
  call void @pthread_create(i8* %2342, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.196 to i8*), i8* %2340)
  %2343 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %593, i32 0, i32 0
  store %FIFO* %1802, %FIFO** %2343
  %2344 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %593, i32 0, i32 1
  store %FIFO* %1834, %FIFO** %2344
  %2345 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %593, i32 0, i32 2
  store %FIFO* %1866, %FIFO** %2345
  %2346 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %593 to i8*
  store i32* %thread_id197, i32** %594
  %2347 = bitcast i32*** %595 to i8**
  store i32** %594, i32*** %595
  %2348 = load i8*, i8** %2347
  call void @pthread_create(i8* %2348, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.197 to i8*), i8* %2346)
  %2349 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %596, i32 0, i32 0
  store %FIFO* %1803, %FIFO** %2349
  %2350 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %596, i32 0, i32 1
  store %FIFO* %1835, %FIFO** %2350
  %2351 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %596, i32 0, i32 2
  store %FIFO* %1867, %FIFO** %2351
  %2352 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %596 to i8*
  store i32* %thread_id198, i32** %597
  %2353 = bitcast i32*** %598 to i8**
  store i32** %597, i32*** %598
  %2354 = load i8*, i8** %2353
  call void @pthread_create(i8* %2354, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.198 to i8*), i8* %2352)
  %2355 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %599, i32 0, i32 0
  store %FIFO* %1804, %FIFO** %2355
  %2356 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %599, i32 0, i32 1
  store %FIFO* %1836, %FIFO** %2356
  %2357 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %599, i32 0, i32 2
  store %FIFO* %1868, %FIFO** %2357
  %2358 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %599 to i8*
  store i32* %thread_id199, i32** %600
  %2359 = bitcast i32*** %601 to i8**
  store i32** %600, i32*** %601
  %2360 = load i8*, i8** %2359
  call void @pthread_create(i8* %2360, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.199 to i8*), i8* %2358)
  %2361 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %602, i32 0, i32 0
  store %FIFO* %1805, %FIFO** %2361
  %2362 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %602, i32 0, i32 1
  store %FIFO* %1837, %FIFO** %2362
  %2363 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %602, i32 0, i32 2
  store %FIFO* %1869, %FIFO** %2363
  %2364 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %602 to i8*
  store i32* %thread_id200, i32** %603
  %2365 = bitcast i32*** %604 to i8**
  store i32** %603, i32*** %604
  %2366 = load i8*, i8** %2365
  call void @pthread_create(i8* %2366, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.200 to i8*), i8* %2364)
  %2367 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %605, i32 0, i32 0
  store %FIFO* %1806, %FIFO** %2367
  %2368 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %605, i32 0, i32 1
  store %FIFO* %1838, %FIFO** %2368
  %2369 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %605, i32 0, i32 2
  store %FIFO* %1870, %FIFO** %2369
  %2370 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %605 to i8*
  store i32* %thread_id201, i32** %606
  %2371 = bitcast i32*** %607 to i8**
  store i32** %606, i32*** %607
  %2372 = load i8*, i8** %2371
  call void @pthread_create(i8* %2372, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.201 to i8*), i8* %2370)
  %2373 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %608, i32 0, i32 0
  store %FIFO* %1807, %FIFO** %2373
  %2374 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %608, i32 0, i32 1
  store %FIFO* %1839, %FIFO** %2374
  %2375 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %608, i32 0, i32 2
  store %FIFO* %1871, %FIFO** %2375
  %2376 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %608 to i8*
  store i32* %thread_id202, i32** %609
  %2377 = bitcast i32*** %610 to i8**
  store i32** %609, i32*** %610
  %2378 = load i8*, i8** %2377
  call void @pthread_create(i8* %2378, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.202 to i8*), i8* %2376)
  %2379 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %611, i32 0, i32 0
  store %FIFO* %1808, %FIFO** %2379
  %2380 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %611, i32 0, i32 1
  store %FIFO* %1840, %FIFO** %2380
  %2381 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %611, i32 0, i32 2
  store %FIFO* %1872, %FIFO** %2381
  %2382 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %611 to i8*
  store i32* %thread_id203, i32** %612
  %2383 = bitcast i32*** %613 to i8**
  store i32** %612, i32*** %613
  %2384 = load i8*, i8** %2383
  call void @pthread_create(i8* %2384, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.203 to i8*), i8* %2382)
  %2385 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %614, i32 0, i32 0
  store %FIFO* %1809, %FIFO** %2385
  %2386 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %614, i32 0, i32 1
  store %FIFO* %1841, %FIFO** %2386
  %2387 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %614, i32 0, i32 2
  store %FIFO* %1873, %FIFO** %2387
  %2388 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %614 to i8*
  store i32* %thread_id204, i32** %615
  %2389 = bitcast i32*** %616 to i8**
  store i32** %615, i32*** %616
  %2390 = load i8*, i8** %2389
  call void @pthread_create(i8* %2390, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.204 to i8*), i8* %2388)
  %2391 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %617, i32 0, i32 0
  store %FIFO* %1810, %FIFO** %2391
  %2392 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %617, i32 0, i32 1
  store %FIFO* %1842, %FIFO** %2392
  %2393 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %617, i32 0, i32 2
  store %FIFO* %1874, %FIFO** %2393
  %2394 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %617 to i8*
  store i32* %thread_id205, i32** %618
  %2395 = bitcast i32*** %619 to i8**
  store i32** %618, i32*** %619
  %2396 = load i8*, i8** %2395
  call void @pthread_create(i8* %2396, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.205 to i8*), i8* %2394)
  %2397 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %620, i32 0, i32 0
  store %FIFO* %1811, %FIFO** %2397
  %2398 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %620, i32 0, i32 1
  store %FIFO* %1843, %FIFO** %2398
  %2399 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %620, i32 0, i32 2
  store %FIFO* %1875, %FIFO** %2399
  %2400 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %620 to i8*
  store i32* %thread_id206, i32** %621
  %2401 = bitcast i32*** %622 to i8**
  store i32** %621, i32*** %622
  %2402 = load i8*, i8** %2401
  call void @pthread_create(i8* %2402, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.206 to i8*), i8* %2400)
  %2403 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %623, i32 0, i32 0
  store %FIFO* %1812, %FIFO** %2403
  %2404 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %623, i32 0, i32 1
  store %FIFO* %1844, %FIFO** %2404
  %2405 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %623, i32 0, i32 2
  store %FIFO* %1876, %FIFO** %2405
  %2406 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %623 to i8*
  store i32* %thread_id207, i32** %624
  %2407 = bitcast i32*** %625 to i8**
  store i32** %624, i32*** %625
  %2408 = load i8*, i8** %2407
  call void @pthread_create(i8* %2408, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.207 to i8*), i8* %2406)
  %2409 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %626, i32 0, i32 0
  store %FIFO* %1813, %FIFO** %2409
  %2410 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %626, i32 0, i32 1
  store %FIFO* %1845, %FIFO** %2410
  %2411 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %626, i32 0, i32 2
  store %FIFO* %1877, %FIFO** %2411
  %2412 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %626 to i8*
  store i32* %thread_id208, i32** %627
  %2413 = bitcast i32*** %628 to i8**
  store i32** %627, i32*** %628
  %2414 = load i8*, i8** %2413
  call void @pthread_create(i8* %2414, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.208 to i8*), i8* %2412)
  %2415 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %629, i32 0, i32 0
  store %FIFO* %1814, %FIFO** %2415
  %2416 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %629, i32 0, i32 1
  store %FIFO* %1846, %FIFO** %2416
  %2417 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %629, i32 0, i32 2
  store %FIFO* %1878, %FIFO** %2417
  %2418 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %629 to i8*
  store i32* %thread_id209, i32** %630
  %2419 = bitcast i32*** %631 to i8**
  store i32** %630, i32*** %631
  %2420 = load i8*, i8** %2419
  call void @pthread_create(i8* %2420, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.209 to i8*), i8* %2418)
  %2421 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %632, i32 0, i32 0
  store %FIFO* %1815, %FIFO** %2421
  %2422 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %632, i32 0, i32 1
  store %FIFO* %1847, %FIFO** %2422
  %2423 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %632, i32 0, i32 2
  store %FIFO* %1879, %FIFO** %2423
  %2424 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %632 to i8*
  store i32* %thread_id210, i32** %633
  %2425 = bitcast i32*** %634 to i8**
  store i32** %633, i32*** %634
  %2426 = load i8*, i8** %2425
  call void @pthread_create(i8* %2426, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.210 to i8*), i8* %2424)
  %2427 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %635, i32 0, i32 0
  store %FIFO* %1816, %FIFO** %2427
  %2428 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %635, i32 0, i32 1
  store %FIFO* %1848, %FIFO** %2428
  %2429 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %635, i32 0, i32 2
  store %FIFO* %1880, %FIFO** %2429
  %2430 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %635 to i8*
  store i32* %thread_id211, i32** %636
  %2431 = bitcast i32*** %637 to i8**
  store i32** %636, i32*** %637
  %2432 = load i8*, i8** %2431
  call void @pthread_create(i8* %2432, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.211 to i8*), i8* %2430)
  %2433 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %638, i32 0, i32 0
  store %FIFO* %1817, %FIFO** %2433
  %2434 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %638, i32 0, i32 1
  store %FIFO* %1849, %FIFO** %2434
  %2435 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %638, i32 0, i32 2
  store %FIFO* %1881, %FIFO** %2435
  %2436 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %638 to i8*
  store i32* %thread_id212, i32** %639
  %2437 = bitcast i32*** %640 to i8**
  store i32** %639, i32*** %640
  %2438 = load i8*, i8** %2437
  call void @pthread_create(i8* %2438, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.212 to i8*), i8* %2436)
  %2439 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %641, i32 0, i32 0
  store %FIFO* %1818, %FIFO** %2439
  %2440 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %641, i32 0, i32 1
  store %FIFO* %1850, %FIFO** %2440
  %2441 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %641, i32 0, i32 2
  store %FIFO* %1882, %FIFO** %2441
  %2442 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %641 to i8*
  store i32* %thread_id213, i32** %642
  %2443 = bitcast i32*** %643 to i8**
  store i32** %642, i32*** %643
  %2444 = load i8*, i8** %2443
  call void @pthread_create(i8* %2444, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.213 to i8*), i8* %2442)
  %2445 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %644, i32 0, i32 0
  store %FIFO* %1819, %FIFO** %2445
  %2446 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %644, i32 0, i32 1
  store %FIFO* %1851, %FIFO** %2446
  %2447 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %644, i32 0, i32 2
  store %FIFO* %1883, %FIFO** %2447
  %2448 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %644 to i8*
  store i32* %thread_id214, i32** %645
  %2449 = bitcast i32*** %646 to i8**
  store i32** %645, i32*** %646
  %2450 = load i8*, i8** %2449
  call void @pthread_create(i8* %2450, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.214 to i8*), i8* %2448)
  %2451 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %647, i32 0, i32 0
  store %FIFO* %1820, %FIFO** %2451
  %2452 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %647, i32 0, i32 1
  store %FIFO* %1852, %FIFO** %2452
  %2453 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %647, i32 0, i32 2
  store %FIFO* %1884, %FIFO** %2453
  %2454 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %647 to i8*
  store i32* %thread_id215, i32** %648
  %2455 = bitcast i32*** %649 to i8**
  store i32** %648, i32*** %649
  %2456 = load i8*, i8** %2455
  call void @pthread_create(i8* %2456, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.215 to i8*), i8* %2454)
  %2457 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %650, i32 0, i32 0
  store %FIFO* %1821, %FIFO** %2457
  %2458 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %650, i32 0, i32 1
  store %FIFO* %1853, %FIFO** %2458
  %2459 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %650, i32 0, i32 2
  store %FIFO* %1885, %FIFO** %2459
  %2460 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %650 to i8*
  store i32* %thread_id216, i32** %651
  %2461 = bitcast i32*** %652 to i8**
  store i32** %651, i32*** %652
  %2462 = load i8*, i8** %2461
  call void @pthread_create(i8* %2462, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.216 to i8*), i8* %2460)
  %2463 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %653, i32 0, i32 0
  store %FIFO* %1822, %FIFO** %2463
  %2464 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %653, i32 0, i32 1
  store %FIFO* %1854, %FIFO** %2464
  %2465 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %653, i32 0, i32 2
  store %FIFO* %1886, %FIFO** %2465
  %2466 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %653 to i8*
  store i32* %thread_id217, i32** %654
  %2467 = bitcast i32*** %655 to i8**
  store i32** %654, i32*** %655
  %2468 = load i8*, i8** %2467
  call void @pthread_create(i8* %2468, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.217 to i8*), i8* %2466)
  %2469 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %656, i32 0, i32 0
  store %FIFO* %1823, %FIFO** %2469
  %2470 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %656, i32 0, i32 1
  store %FIFO* %1855, %FIFO** %2470
  %2471 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %656, i32 0, i32 2
  store %FIFO* %1887, %FIFO** %2471
  %2472 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %656 to i8*
  store i32* %thread_id218, i32** %657
  %2473 = bitcast i32*** %658 to i8**
  store i32** %657, i32*** %658
  %2474 = load i8*, i8** %2473
  call void @pthread_create(i8* %2474, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.218 to i8*), i8* %2472)
  %2475 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %659, i32 0, i32 0
  store %FIFO* %1824, %FIFO** %2475
  %2476 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %659, i32 0, i32 1
  store %FIFO* %1856, %FIFO** %2476
  %2477 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %659, i32 0, i32 2
  store %FIFO* %1888, %FIFO** %2477
  %2478 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %659 to i8*
  store i32* %thread_id219, i32** %660
  %2479 = bitcast i32*** %661 to i8**
  store i32** %660, i32*** %661
  %2480 = load i8*, i8** %2479
  call void @pthread_create(i8* %2480, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.219 to i8*), i8* %2478)
  %2481 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %662, i32 0, i32 0
  store %FIFO* %1825, %FIFO** %2481
  %2482 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %662, i32 0, i32 1
  store %FIFO* %1857, %FIFO** %2482
  %2483 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %662, i32 0, i32 2
  store %FIFO* %1889, %FIFO** %2483
  %2484 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %662 to i8*
  store i32* %thread_id220, i32** %663
  %2485 = bitcast i32*** %664 to i8**
  store i32** %663, i32*** %664
  %2486 = load i8*, i8** %2485
  call void @pthread_create(i8* %2486, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.220 to i8*), i8* %2484)
  %2487 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %665, i32 0, i32 0
  store %FIFO* %1826, %FIFO** %2487
  %2488 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %665, i32 0, i32 1
  store %FIFO* %1858, %FIFO** %2488
  %2489 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %665, i32 0, i32 2
  store %FIFO* %1890, %FIFO** %2489
  %2490 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %665 to i8*
  store i32* %thread_id221, i32** %666
  %2491 = bitcast i32*** %667 to i8**
  store i32** %666, i32*** %667
  %2492 = load i8*, i8** %2491
  call void @pthread_create(i8* %2492, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.221 to i8*), i8* %2490)
  %2493 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %668, i32 0, i32 0
  store %FIFO* %1827, %FIFO** %2493
  %2494 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %668, i32 0, i32 1
  store %FIFO* %1859, %FIFO** %2494
  %2495 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %668, i32 0, i32 2
  store %FIFO* %1891, %FIFO** %2495
  %2496 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %668 to i8*
  store i32* %thread_id222, i32** %669
  %2497 = bitcast i32*** %670 to i8**
  store i32** %669, i32*** %670
  %2498 = load i8*, i8** %2497
  call void @pthread_create(i8* %2498, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.222 to i8*), i8* %2496)
  %2499 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %671, i32 0, i32 0
  store %FIFO* %1860, %FIFO** %2499
  %2500 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %671, i32 0, i32 1
  store %FIFO* %1876, %FIFO** %2500
  %2501 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %671, i32 0, i32 2
  store %FIFO* %1892, %FIFO** %2501
  %2502 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %671 to i8*
  store i32* %thread_id223, i32** %672
  %2503 = bitcast i32*** %673 to i8**
  store i32** %672, i32*** %673
  %2504 = load i8*, i8** %2503
  call void @pthread_create(i8* %2504, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.223 to i8*), i8* %2502)
  %2505 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %674, i32 0, i32 0
  store %FIFO* %1861, %FIFO** %2505
  %2506 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %674, i32 0, i32 1
  store %FIFO* %1877, %FIFO** %2506
  %2507 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %674, i32 0, i32 2
  store %FIFO* %1893, %FIFO** %2507
  %2508 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %674 to i8*
  store i32* %thread_id224, i32** %675
  %2509 = bitcast i32*** %676 to i8**
  store i32** %675, i32*** %676
  %2510 = load i8*, i8** %2509
  call void @pthread_create(i8* %2510, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.224 to i8*), i8* %2508)
  %2511 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %677, i32 0, i32 0
  store %FIFO* %1862, %FIFO** %2511
  %2512 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %677, i32 0, i32 1
  store %FIFO* %1878, %FIFO** %2512
  %2513 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %677, i32 0, i32 2
  store %FIFO* %1894, %FIFO** %2513
  %2514 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %677 to i8*
  store i32* %thread_id225, i32** %678
  %2515 = bitcast i32*** %679 to i8**
  store i32** %678, i32*** %679
  %2516 = load i8*, i8** %2515
  call void @pthread_create(i8* %2516, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.225 to i8*), i8* %2514)
  %2517 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %680, i32 0, i32 0
  store %FIFO* %1863, %FIFO** %2517
  %2518 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %680, i32 0, i32 1
  store %FIFO* %1879, %FIFO** %2518
  %2519 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %680, i32 0, i32 2
  store %FIFO* %1895, %FIFO** %2519
  %2520 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %680 to i8*
  store i32* %thread_id226, i32** %681
  %2521 = bitcast i32*** %682 to i8**
  store i32** %681, i32*** %682
  %2522 = load i8*, i8** %2521
  call void @pthread_create(i8* %2522, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.226 to i8*), i8* %2520)
  %2523 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %683, i32 0, i32 0
  store %FIFO* %1864, %FIFO** %2523
  %2524 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %683, i32 0, i32 1
  store %FIFO* %1880, %FIFO** %2524
  %2525 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %683, i32 0, i32 2
  store %FIFO* %1896, %FIFO** %2525
  %2526 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %683 to i8*
  store i32* %thread_id227, i32** %684
  %2527 = bitcast i32*** %685 to i8**
  store i32** %684, i32*** %685
  %2528 = load i8*, i8** %2527
  call void @pthread_create(i8* %2528, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.227 to i8*), i8* %2526)
  %2529 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %686, i32 0, i32 0
  store %FIFO* %1865, %FIFO** %2529
  %2530 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %686, i32 0, i32 1
  store %FIFO* %1881, %FIFO** %2530
  %2531 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %686, i32 0, i32 2
  store %FIFO* %1897, %FIFO** %2531
  %2532 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %686 to i8*
  store i32* %thread_id228, i32** %687
  %2533 = bitcast i32*** %688 to i8**
  store i32** %687, i32*** %688
  %2534 = load i8*, i8** %2533
  call void @pthread_create(i8* %2534, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.228 to i8*), i8* %2532)
  %2535 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %689, i32 0, i32 0
  store %FIFO* %1866, %FIFO** %2535
  %2536 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %689, i32 0, i32 1
  store %FIFO* %1882, %FIFO** %2536
  %2537 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %689, i32 0, i32 2
  store %FIFO* %1898, %FIFO** %2537
  %2538 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %689 to i8*
  store i32* %thread_id229, i32** %690
  %2539 = bitcast i32*** %691 to i8**
  store i32** %690, i32*** %691
  %2540 = load i8*, i8** %2539
  call void @pthread_create(i8* %2540, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.229 to i8*), i8* %2538)
  %2541 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %692, i32 0, i32 0
  store %FIFO* %1867, %FIFO** %2541
  %2542 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %692, i32 0, i32 1
  store %FIFO* %1883, %FIFO** %2542
  %2543 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %692, i32 0, i32 2
  store %FIFO* %1899, %FIFO** %2543
  %2544 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %692 to i8*
  store i32* %thread_id230, i32** %693
  %2545 = bitcast i32*** %694 to i8**
  store i32** %693, i32*** %694
  %2546 = load i8*, i8** %2545
  call void @pthread_create(i8* %2546, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.230 to i8*), i8* %2544)
  %2547 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %695, i32 0, i32 0
  store %FIFO* %1868, %FIFO** %2547
  %2548 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %695, i32 0, i32 1
  store %FIFO* %1884, %FIFO** %2548
  %2549 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %695, i32 0, i32 2
  store %FIFO* %1900, %FIFO** %2549
  %2550 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %695 to i8*
  store i32* %thread_id231, i32** %696
  %2551 = bitcast i32*** %697 to i8**
  store i32** %696, i32*** %697
  %2552 = load i8*, i8** %2551
  call void @pthread_create(i8* %2552, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.231 to i8*), i8* %2550)
  %2553 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %698, i32 0, i32 0
  store %FIFO* %1869, %FIFO** %2553
  %2554 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %698, i32 0, i32 1
  store %FIFO* %1885, %FIFO** %2554
  %2555 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %698, i32 0, i32 2
  store %FIFO* %1901, %FIFO** %2555
  %2556 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %698 to i8*
  store i32* %thread_id232, i32** %699
  %2557 = bitcast i32*** %700 to i8**
  store i32** %699, i32*** %700
  %2558 = load i8*, i8** %2557
  call void @pthread_create(i8* %2558, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.232 to i8*), i8* %2556)
  %2559 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %701, i32 0, i32 0
  store %FIFO* %1870, %FIFO** %2559
  %2560 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %701, i32 0, i32 1
  store %FIFO* %1886, %FIFO** %2560
  %2561 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %701, i32 0, i32 2
  store %FIFO* %1902, %FIFO** %2561
  %2562 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %701 to i8*
  store i32* %thread_id233, i32** %702
  %2563 = bitcast i32*** %703 to i8**
  store i32** %702, i32*** %703
  %2564 = load i8*, i8** %2563
  call void @pthread_create(i8* %2564, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.233 to i8*), i8* %2562)
  %2565 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %704, i32 0, i32 0
  store %FIFO* %1871, %FIFO** %2565
  %2566 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %704, i32 0, i32 1
  store %FIFO* %1887, %FIFO** %2566
  %2567 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %704, i32 0, i32 2
  store %FIFO* %1903, %FIFO** %2567
  %2568 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %704 to i8*
  store i32* %thread_id234, i32** %705
  %2569 = bitcast i32*** %706 to i8**
  store i32** %705, i32*** %706
  %2570 = load i8*, i8** %2569
  call void @pthread_create(i8* %2570, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.234 to i8*), i8* %2568)
  %2571 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %707, i32 0, i32 0
  store %FIFO* %1872, %FIFO** %2571
  %2572 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %707, i32 0, i32 1
  store %FIFO* %1888, %FIFO** %2572
  %2573 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %707, i32 0, i32 2
  store %FIFO* %1904, %FIFO** %2573
  %2574 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %707 to i8*
  store i32* %thread_id235, i32** %708
  %2575 = bitcast i32*** %709 to i8**
  store i32** %708, i32*** %709
  %2576 = load i8*, i8** %2575
  call void @pthread_create(i8* %2576, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.235 to i8*), i8* %2574)
  %2577 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %710, i32 0, i32 0
  store %FIFO* %1873, %FIFO** %2577
  %2578 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %710, i32 0, i32 1
  store %FIFO* %1889, %FIFO** %2578
  %2579 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %710, i32 0, i32 2
  store %FIFO* %1905, %FIFO** %2579
  %2580 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %710 to i8*
  store i32* %thread_id236, i32** %711
  %2581 = bitcast i32*** %712 to i8**
  store i32** %711, i32*** %712
  %2582 = load i8*, i8** %2581
  call void @pthread_create(i8* %2582, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.236 to i8*), i8* %2580)
  %2583 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %713, i32 0, i32 0
  store %FIFO* %1874, %FIFO** %2583
  %2584 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %713, i32 0, i32 1
  store %FIFO* %1890, %FIFO** %2584
  %2585 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %713, i32 0, i32 2
  store %FIFO* %1906, %FIFO** %2585
  %2586 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %713 to i8*
  store i32* %thread_id237, i32** %714
  %2587 = bitcast i32*** %715 to i8**
  store i32** %714, i32*** %715
  %2588 = load i8*, i8** %2587
  call void @pthread_create(i8* %2588, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.237 to i8*), i8* %2586)
  %2589 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %716, i32 0, i32 0
  store %FIFO* %1875, %FIFO** %2589
  %2590 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %716, i32 0, i32 1
  store %FIFO* %1891, %FIFO** %2590
  %2591 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %716, i32 0, i32 2
  store %FIFO* %1907, %FIFO** %2591
  %2592 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %716 to i8*
  store i32* %thread_id238, i32** %717
  %2593 = bitcast i32*** %718 to i8**
  store i32** %717, i32*** %718
  %2594 = load i8*, i8** %2593
  call void @pthread_create(i8* %2594, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.238 to i8*), i8* %2592)
  %2595 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %719, i32 0, i32 0
  store %FIFO* %1892, %FIFO** %2595
  %2596 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %719, i32 0, i32 1
  store %FIFO* %1900, %FIFO** %2596
  %2597 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %719, i32 0, i32 2
  store %FIFO* %1908, %FIFO** %2597
  %2598 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %719 to i8*
  store i32* %thread_id239, i32** %720
  %2599 = bitcast i32*** %721 to i8**
  store i32** %720, i32*** %721
  %2600 = load i8*, i8** %2599
  call void @pthread_create(i8* %2600, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.239 to i8*), i8* %2598)
  %2601 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %722, i32 0, i32 0
  store %FIFO* %1893, %FIFO** %2601
  %2602 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %722, i32 0, i32 1
  store %FIFO* %1901, %FIFO** %2602
  %2603 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %722, i32 0, i32 2
  store %FIFO* %1909, %FIFO** %2603
  %2604 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %722 to i8*
  store i32* %thread_id240, i32** %723
  %2605 = bitcast i32*** %724 to i8**
  store i32** %723, i32*** %724
  %2606 = load i8*, i8** %2605
  call void @pthread_create(i8* %2606, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.240 to i8*), i8* %2604)
  %2607 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %725, i32 0, i32 0
  store %FIFO* %1894, %FIFO** %2607
  %2608 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %725, i32 0, i32 1
  store %FIFO* %1902, %FIFO** %2608
  %2609 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %725, i32 0, i32 2
  store %FIFO* %1910, %FIFO** %2609
  %2610 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %725 to i8*
  store i32* %thread_id241, i32** %726
  %2611 = bitcast i32*** %727 to i8**
  store i32** %726, i32*** %727
  %2612 = load i8*, i8** %2611
  call void @pthread_create(i8* %2612, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.241 to i8*), i8* %2610)
  %2613 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %728, i32 0, i32 0
  store %FIFO* %1895, %FIFO** %2613
  %2614 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %728, i32 0, i32 1
  store %FIFO* %1903, %FIFO** %2614
  %2615 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %728, i32 0, i32 2
  store %FIFO* %1911, %FIFO** %2615
  %2616 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %728 to i8*
  store i32* %thread_id242, i32** %729
  %2617 = bitcast i32*** %730 to i8**
  store i32** %729, i32*** %730
  %2618 = load i8*, i8** %2617
  call void @pthread_create(i8* %2618, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.242 to i8*), i8* %2616)
  %2619 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %731, i32 0, i32 0
  store %FIFO* %1896, %FIFO** %2619
  %2620 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %731, i32 0, i32 1
  store %FIFO* %1904, %FIFO** %2620
  %2621 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %731, i32 0, i32 2
  store %FIFO* %1912, %FIFO** %2621
  %2622 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %731 to i8*
  store i32* %thread_id243, i32** %732
  %2623 = bitcast i32*** %733 to i8**
  store i32** %732, i32*** %733
  %2624 = load i8*, i8** %2623
  call void @pthread_create(i8* %2624, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.243 to i8*), i8* %2622)
  %2625 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %734, i32 0, i32 0
  store %FIFO* %1897, %FIFO** %2625
  %2626 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %734, i32 0, i32 1
  store %FIFO* %1905, %FIFO** %2626
  %2627 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %734, i32 0, i32 2
  store %FIFO* %1913, %FIFO** %2627
  %2628 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %734 to i8*
  store i32* %thread_id244, i32** %735
  %2629 = bitcast i32*** %736 to i8**
  store i32** %735, i32*** %736
  %2630 = load i8*, i8** %2629
  call void @pthread_create(i8* %2630, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.244 to i8*), i8* %2628)
  %2631 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %737, i32 0, i32 0
  store %FIFO* %1898, %FIFO** %2631
  %2632 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %737, i32 0, i32 1
  store %FIFO* %1906, %FIFO** %2632
  %2633 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %737, i32 0, i32 2
  store %FIFO* %1914, %FIFO** %2633
  %2634 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %737 to i8*
  store i32* %thread_id245, i32** %738
  %2635 = bitcast i32*** %739 to i8**
  store i32** %738, i32*** %739
  %2636 = load i8*, i8** %2635
  call void @pthread_create(i8* %2636, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.245 to i8*), i8* %2634)
  %2637 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %740, i32 0, i32 0
  store %FIFO* %1899, %FIFO** %2637
  %2638 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %740, i32 0, i32 1
  store %FIFO* %1907, %FIFO** %2638
  %2639 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %740, i32 0, i32 2
  store %FIFO* %1915, %FIFO** %2639
  %2640 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %740 to i8*
  store i32* %thread_id246, i32** %741
  %2641 = bitcast i32*** %742 to i8**
  store i32** %741, i32*** %742
  %2642 = load i8*, i8** %2641
  call void @pthread_create(i8* %2642, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.246 to i8*), i8* %2640)
  %2643 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %743, i32 0, i32 0
  store %FIFO* %1908, %FIFO** %2643
  %2644 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %743, i32 0, i32 1
  store %FIFO* %1912, %FIFO** %2644
  %2645 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %743, i32 0, i32 2
  store %FIFO* %1916, %FIFO** %2645
  %2646 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %743 to i8*
  store i32* %thread_id247, i32** %744
  %2647 = bitcast i32*** %745 to i8**
  store i32** %744, i32*** %745
  %2648 = load i8*, i8** %2647
  call void @pthread_create(i8* %2648, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.247 to i8*), i8* %2646)
  %2649 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %746, i32 0, i32 0
  store %FIFO* %1909, %FIFO** %2649
  %2650 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %746, i32 0, i32 1
  store %FIFO* %1913, %FIFO** %2650
  %2651 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %746, i32 0, i32 2
  store %FIFO* %1917, %FIFO** %2651
  %2652 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %746 to i8*
  store i32* %thread_id248, i32** %747
  %2653 = bitcast i32*** %748 to i8**
  store i32** %747, i32*** %748
  %2654 = load i8*, i8** %2653
  call void @pthread_create(i8* %2654, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.248 to i8*), i8* %2652)
  %2655 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %749, i32 0, i32 0
  store %FIFO* %1910, %FIFO** %2655
  %2656 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %749, i32 0, i32 1
  store %FIFO* %1914, %FIFO** %2656
  %2657 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %749, i32 0, i32 2
  store %FIFO* %1918, %FIFO** %2657
  %2658 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %749 to i8*
  store i32* %thread_id249, i32** %750
  %2659 = bitcast i32*** %751 to i8**
  store i32** %750, i32*** %751
  %2660 = load i8*, i8** %2659
  call void @pthread_create(i8* %2660, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.249 to i8*), i8* %2658)
  %2661 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %752, i32 0, i32 0
  store %FIFO* %1911, %FIFO** %2661
  %2662 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %752, i32 0, i32 1
  store %FIFO* %1915, %FIFO** %2662
  %2663 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %752, i32 0, i32 2
  store %FIFO* %1919, %FIFO** %2663
  %2664 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %752 to i8*
  store i32* %thread_id250, i32** %753
  %2665 = bitcast i32*** %754 to i8**
  store i32** %753, i32*** %754
  %2666 = load i8*, i8** %2665
  call void @pthread_create(i8* %2666, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.250 to i8*), i8* %2664)
  %2667 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %755, i32 0, i32 0
  store %FIFO* %1916, %FIFO** %2667
  %2668 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %755, i32 0, i32 1
  store %FIFO* %1918, %FIFO** %2668
  %2669 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %755, i32 0, i32 2
  store %FIFO* %1920, %FIFO** %2669
  %2670 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %755 to i8*
  store i32* %thread_id251, i32** %756
  %2671 = bitcast i32*** %757 to i8**
  store i32** %756, i32*** %757
  %2672 = load i8*, i8** %2671
  call void @pthread_create(i8* %2672, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.251 to i8*), i8* %2670)
  %2673 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %758, i32 0, i32 0
  store %FIFO* %1917, %FIFO** %2673
  %2674 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %758, i32 0, i32 1
  store %FIFO* %1919, %FIFO** %2674
  %2675 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %758, i32 0, i32 2
  store %FIFO* %1921, %FIFO** %2675
  %2676 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %758 to i8*
  store i32* %thread_id252, i32** %759
  %2677 = bitcast i32*** %760 to i8**
  store i32** %759, i32*** %760
  %2678 = load i8*, i8** %2677
  call void @pthread_create(i8* %2678, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.252 to i8*), i8* %2676)
  %2679 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %761, i32 0, i32 0
  store %FIFO* %1920, %FIFO** %2679
  %2680 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %761, i32 0, i32 1
  store %FIFO* %1921, %FIFO** %2680
  %2681 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %761, i32 0, i32 2
  store %FIFO* %1922, %FIFO** %2681
  %2682 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %761 to i8*
  store i32* %thread_id253, i32** %762
  %2683 = bitcast i32*** %763 to i8**
  store i32** %762, i32*** %763
  %2684 = load i8*, i8** %2683
  call void @pthread_create(i8* %2684, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.253 to i8*), i8* %2682)
  %2685 = load { i8*, i64, i64 }, { i8*, i64, i64 }* @main.input
  %2686 = extractvalue { i8*, i64, i64 } %2685, 1
  %2687 = bitcast [2 x { i8*, i8* }]* %varargs to i8*
  %2688 = bitcast i8* %2687 to { i8*, i8* }*
  %2689 = getelementptr { i8*, i8* }, { i8*, i8* }* %2688, i64 0
  %2690 = bitcast { i8*, i8* }* %2689 to i8*
  store { i8*, i64 } { i8* getelementptr inbounds ([9 x i8], [9 x i8]* @3, i32 0, i32 0), i64 9 }, { i8*, i64 }* %764
  %2691 = bitcast { i8*, i64 }* %764 to i8*
  %2692 = insertvalue { i8*, i8* } { i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_string, i32 0, i32 0), i8* undef }, i8* %2691, 1
  %2693 = bitcast i8* %2690 to { i8*, i8* }*
  store { i8*, i8* } %2692, { i8*, i8* }* %2693
  %2694 = bitcast i8* %2687 to { i8*, i8* }*
  %2695 = getelementptr { i8*, i8* }, { i8*, i8* }* %2694, i64 1
  %2696 = bitcast { i8*, i8* }* %2695 to i8*
  store i64 %2686, i64* %765
  %2697 = bitcast i64* %765 to i8*
  %2698 = insertvalue { i8*, i8* } { i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_int, i32 0, i32 0), i8* undef }, i8* %2697, 1
  %2699 = bitcast i8* %2696 to { i8*, i8* }*
  store { i8*, i8* } %2698, { i8*, i8* }* %2699
  %2700 = getelementptr inbounds i8, i8* %2687, i64 0
  %2701 = insertvalue { i8*, i64, i64 } undef, i8* %2700, 0
  %2702 = insertvalue { i8*, i64, i64 } %2701, i64 2, 1
  %2703 = insertvalue { i8*, i64, i64 } %2702, i64 2, 2
  store { i8*, i64, i64 } %2703, { i8*, i64, i64 }* %766
  call void @fmt.Println({ i64, { i8*, i8* } }* sret %767, i8* nest undef, { i8*, i64, i64 }* byval %766)
  %2704 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %767, i32 0, i32 0
  %2705 = load i64, i64* %2704
  %2706 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %767, i32 0, i32 1
  %2707 = load { i8*, i8* }, { i8*, i8* }* %2706
  %2708 = load { i8*, i64, i64 }, { i8*, i64, i64 }* @main.input
  %2709 = extractvalue { i8*, i64, i64 } %2708, 1
  br label %.1.rangeindex.loop

.1.rangeindex.loop:                               ; preds = %.2.rangeindex.body, %.0.entry
  %2710 = phi i64 [ -1, %.0.entry ], [ %2711, %.2.rangeindex.body ]
  %2711 = add i64 %2710, 1
  %2712 = icmp slt i64 %2711, %2709
  %2713 = zext i1 %2712 to i8
  %2714 = trunc i8 %2713 to i1
  br i1 %2714, label %.2.rangeindex.body, label %.3.rangeindex.done

.2.rangeindex.body:                               ; preds = %.1.rangeindex.loop
  %2715 = extractvalue { i8*, i64, i64 } %2708, 0
  %2716 = bitcast i8* %2715 to i64*
  %2717 = getelementptr i64, i64* %2716, i64 %2711
  %2718 = bitcast i64* %2717 to i8*
  %2719 = bitcast i8* %2718 to i64*
  %2720 = load i64, i64* %2719
  call void @fifo_write(%FIFO* %779, i64 %2720)
  br label %.1.rangeindex.loop

.3.rangeindex.done:                               ; preds = %.1.rangeindex.loop
  call void @fifo_write(%FIFO* %779, i64 -1)
  %2721 = load { i8*, i64, i64 }, { i8*, i64, i64 }* @main.input
  %2722 = extractvalue { i8*, i64, i64 } %2721, 1
  call void @__go_make_slice2({ i8*, i64, i64 }* sret %768, i8* nest undef, i8* getelementptr inbounds (%sliceType, %sliceType* @__go_td_AN3_inte, i32 0, i32 0, i32 0), i64 %2722, i64 %2722)
  %2723 = load { i8*, i64, i64 }, { i8*, i64, i64 }* %768
  %2724 = load { i8*, i64, i64 }, { i8*, i64, i64 }* @main.input
  %2725 = extractvalue { i8*, i64, i64 } %2724, 1
  br label %.4.rangeindex.loop

.4.rangeindex.loop:                               ; preds = %.7.if.then, %.5.rangeindex.body, %.3.rangeindex.done
  %2726 = phi i64 [ -1, %.3.rangeindex.done ], [ %2727, %.5.rangeindex.body ], [ %2727, %.7.if.then ]
  %2727 = add i64 %2726, 1
  %2728 = icmp slt i64 %2727, %2725
  %2729 = zext i1 %2728 to i8
  %2730 = trunc i8 %2729 to i1
  br i1 %2730, label %.5.rangeindex.body, label %.6.rangeindex.done

.5.rangeindex.body:                               ; preds = %.4.rangeindex.loop
  %2731 = extractvalue { i8*, i64, i64 } %2723, 0
  %2732 = bitcast i8* %2731 to i64*
  %2733 = getelementptr i64, i64* %2732, i64 %2727
  %2734 = bitcast i64* %2733 to i8*
  %2735 = call i64 @fifo_read(%FIFO* %1922)
  store i64 %2735, i64* %769
  %2736 = load i64, i64* %769
  %2737 = bitcast i8* %2734 to i64*
  store i64 %2736, i64* %2737
  %2738 = extractvalue { i8*, i64, i64 } %2723, 0
  %2739 = bitcast i8* %2738 to i64*
  %2740 = getelementptr i64, i64* %2739, i64 %2727
  %2741 = bitcast i64* %2740 to i8*
  %2742 = bitcast i8* %2741 to i64*
  %2743 = load i64, i64* %2742
  %2744 = bitcast [1 x { i8*, i8* }]* %varargs254 to i8*
  %2745 = bitcast i8* %2744 to { i8*, i8* }*
  %2746 = getelementptr { i8*, i8* }, { i8*, i8* }* %2745, i64 0
  %2747 = bitcast { i8*, i8* }* %2746 to i8*
  store i64 %2743, i64* %770
  %2748 = bitcast i64* %770 to i8*
  %2749 = insertvalue { i8*, i8* } { i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_int, i32 0, i32 0), i8* undef }, i8* %2748, 1
  %2750 = bitcast i8* %2747 to { i8*, i8* }*
  store { i8*, i8* } %2749, { i8*, i8* }* %2750
  %2751 = getelementptr inbounds i8, i8* %2744, i64 0
  %2752 = insertvalue { i8*, i64, i64 } undef, i8* %2751, 0
  %2753 = insertvalue { i8*, i64, i64 } %2752, i64 1, 1
  %2754 = insertvalue { i8*, i64, i64 } %2753, i64 1, 2
  store { i8*, i64 } { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @4, i32 0, i32 0), i64 4 }, { i8*, i64 }* %771
  %2755 = getelementptr inbounds { i8*, i64 }, { i8*, i64 }* %771, i32 0, i32 0
  %2756 = load i8*, i8** %2755
  %2757 = getelementptr inbounds { i8*, i64 }, { i8*, i64 }* %771, i32 0, i32 1
  %2758 = load i64, i64* %2757
  store { i8*, i64, i64 } %2754, { i8*, i64, i64 }* %772
  call void @fmt.Printf({ i64, { i8*, i8* } }* sret %773, i8* nest undef, i8* %2756, i64 %2758, { i8*, i64, i64 }* byval %772)
  %2759 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %773, i32 0, i32 0
  %2760 = load i64, i64* %2759
  %2761 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %773, i32 0, i32 1
  %2762 = load { i8*, i8* }, { i8*, i8* }* %2761
  %2763 = srem i64 %2727, 8
  %2764 = icmp eq i64 %2763, 7
  %2765 = zext i1 %2764 to i8
  %2766 = trunc i8 %2765 to i1
  br i1 %2766, label %.7.if.then, label %.4.rangeindex.loop

.6.rangeindex.done:                               ; preds = %.4.rangeindex.loop
  store { i8*, i64, i64 } %2723, { i8*, i64, i64 }* %777
  call void @main.checkSort(i8* nest undef, { i8*, i64, i64 }* byval %777)
  ret void

.7.if.then:                                       ; preds = %.5.rangeindex.body
  store { i8*, i64 } { i8* getelementptr inbounds ([1 x i8], [1 x i8]* @5, i32 0, i32 0), i64 1 }, { i8*, i64 }* %774
  %2767 = getelementptr inbounds { i8*, i64 }, { i8*, i64 }* %774, i32 0, i32 0
  %2768 = load i8*, i8** %2767
  %2769 = getelementptr inbounds { i8*, i64 }, { i8*, i64 }* %774, i32 0, i32 1
  %2770 = load i64, i64* %2769
  store { i8*, i64, i64 } zeroinitializer, { i8*, i64, i64 }* %775
  call void @fmt.Printf({ i64, { i8*, i8* } }* sret %776, i8* nest undef, i8* %2768, i64 %2770, { i8*, i64, i64 }* byval %775)
  %2771 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %776, i32 0, i32 0
  %2772 = load i64, i64* %2771
  %2773 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %776, i32 0, i32 1
  %2774 = load { i8*, i8* }, { i8*, i8* }* %2773
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
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
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
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
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
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
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
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
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
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
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
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
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
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
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
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
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
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
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
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
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
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
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
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
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
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
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
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
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
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
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
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
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
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
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
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
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
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
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
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
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
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
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
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
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
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
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
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
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
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
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
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
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
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
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
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
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
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
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
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
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
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
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
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
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
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
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
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
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
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
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
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
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
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
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
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
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
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
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
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
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
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
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
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
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
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
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
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
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
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
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
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
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
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
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
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
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
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
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
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
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
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
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
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
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
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
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
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
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
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
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
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
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
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
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
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
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
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
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
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
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
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
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
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
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
  call void @main.divide(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.125(i8*) #0 {
entry:
  call void @143(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @144(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.126(i8*) #0 {
entry:
  call void @144(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @145(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.127(i8*) #0 {
entry:
  call void @145(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @146(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.128(i8*) #0 {
entry:
  call void @146(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @147(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.129(i8*) #0 {
entry:
  call void @147(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @148(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.130(i8*) #0 {
entry:
  call void @148(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @149(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.131(i8*) #0 {
entry:
  call void @149(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @150(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.132(i8*) #0 {
entry:
  call void @150(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @151(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.133(i8*) #0 {
entry:
  call void @151(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @152(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.134(i8*) #0 {
entry:
  call void @152(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @153(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.135(i8*) #0 {
entry:
  call void @153(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @154(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.136(i8*) #0 {
entry:
  call void @154(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @155(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.137(i8*) #0 {
entry:
  call void @155(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @156(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.138(i8*) #0 {
entry:
  call void @156(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @157(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.139(i8*) #0 {
entry:
  call void @157(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @158(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.140(i8*) #0 {
entry:
  call void @158(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @159(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.141(i8*) #0 {
entry:
  call void @159(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @160(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.142(i8*) #0 {
entry:
  call void @160(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @161(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.143(i8*) #0 {
entry:
  call void @161(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @162(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.144(i8*) #0 {
entry:
  call void @162(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @163(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.145(i8*) #0 {
entry:
  call void @163(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @164(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.146(i8*) #0 {
entry:
  call void @164(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @165(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.147(i8*) #0 {
entry:
  call void @165(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @166(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.148(i8*) #0 {
entry:
  call void @166(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @167(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.149(i8*) #0 {
entry:
  call void @167(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @168(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.150(i8*) #0 {
entry:
  call void @168(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @169(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.151(i8*) #0 {
entry:
  call void @169(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @170(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.152(i8*) #0 {
entry:
  call void @170(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @171(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.153(i8*) #0 {
entry:
  call void @171(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @172(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.154(i8*) #0 {
entry:
  call void @172(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @173(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.155(i8*) #0 {
entry:
  call void @173(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @174(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.156(i8*) #0 {
entry:
  call void @174(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @175(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.157(i8*) #0 {
entry:
  call void @175(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @176(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.158(i8*) #0 {
entry:
  call void @176(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @177(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.159(i8*) #0 {
entry:
  call void @177(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @178(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.160(i8*) #0 {
entry:
  call void @178(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @179(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.161(i8*) #0 {
entry:
  call void @179(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @180(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.162(i8*) #0 {
entry:
  call void @180(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @181(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.163(i8*) #0 {
entry:
  call void @181(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @182(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.164(i8*) #0 {
entry:
  call void @182(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @183(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.165(i8*) #0 {
entry:
  call void @183(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @184(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.166(i8*) #0 {
entry:
  call void @184(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @185(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.167(i8*) #0 {
entry:
  call void @185(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @186(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.168(i8*) #0 {
entry:
  call void @186(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @187(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.169(i8*) #0 {
entry:
  call void @187(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @188(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.170(i8*) #0 {
entry:
  call void @188(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @189(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.171(i8*) #0 {
entry:
  call void @189(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @190(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.172(i8*) #0 {
entry:
  call void @190(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @191(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.173(i8*) #0 {
entry:
  call void @191(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @192(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.174(i8*) #0 {
entry:
  call void @192(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @193(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.175(i8*) #0 {
entry:
  call void @193(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @194(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.176(i8*) #0 {
entry:
  call void @194(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @195(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.177(i8*) #0 {
entry:
  call void @195(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @196(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.178(i8*) #0 {
entry:
  call void @196(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @197(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.179(i8*) #0 {
entry:
  call void @197(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @198(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.180(i8*) #0 {
entry:
  call void @198(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @199(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.181(i8*) #0 {
entry:
  call void @199(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @200(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.182(i8*) #0 {
entry:
  call void @200(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @201(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.183(i8*) #0 {
entry:
  call void @201(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @202(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.184(i8*) #0 {
entry:
  call void @202(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @203(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.185(i8*) #0 {
entry:
  call void @203(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @204(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.186(i8*) #0 {
entry:
  call void @204(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @205(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.187(i8*) #0 {
entry:
  call void @205(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @206(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.188(i8*) #0 {
entry:
  call void @206(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @207(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.189(i8*) #0 {
entry:
  call void @207(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @208(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.190(i8*) #0 {
entry:
  call void @208(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @209(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.191(i8*) #0 {
entry:
  call void @209(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @210(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.192(i8*) #0 {
entry:
  call void @210(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @211(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.193(i8*) #0 {
entry:
  call void @211(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @212(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.194(i8*) #0 {
entry:
  call void @212(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @213(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.195(i8*) #0 {
entry:
  call void @213(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @214(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.196(i8*) #0 {
entry:
  call void @214(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @215(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.197(i8*) #0 {
entry:
  call void @215(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @216(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.198(i8*) #0 {
entry:
  call void @216(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @217(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.199(i8*) #0 {
entry:
  call void @217(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @218(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.200(i8*) #0 {
entry:
  call void @218(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @219(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.201(i8*) #0 {
entry:
  call void @219(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @220(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.202(i8*) #0 {
entry:
  call void @220(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @221(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.203(i8*) #0 {
entry:
  call void @221(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @222(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.204(i8*) #0 {
entry:
  call void @222(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @223(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.205(i8*) #0 {
entry:
  call void @223(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @224(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.206(i8*) #0 {
entry:
  call void @224(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @225(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.207(i8*) #0 {
entry:
  call void @225(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @226(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.208(i8*) #0 {
entry:
  call void @226(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @227(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.209(i8*) #0 {
entry:
  call void @227(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @228(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.210(i8*) #0 {
entry:
  call void @228(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @229(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.211(i8*) #0 {
entry:
  call void @229(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @230(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.212(i8*) #0 {
entry:
  call void @230(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @231(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.213(i8*) #0 {
entry:
  call void @231(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @232(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.214(i8*) #0 {
entry:
  call void @232(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @233(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.215(i8*) #0 {
entry:
  call void @233(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @234(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.216(i8*) #0 {
entry:
  call void @234(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @235(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.217(i8*) #0 {
entry:
  call void @235(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @236(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.218(i8*) #0 {
entry:
  call void @236(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @237(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.219(i8*) #0 {
entry:
  call void @237(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @238(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.220(i8*) #0 {
entry:
  call void @238(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @239(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.221(i8*) #0 {
entry:
  call void @239(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @240(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.222(i8*) #0 {
entry:
  call void @240(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @241(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.223(i8*) #0 {
entry:
  call void @241(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @242(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.224(i8*) #0 {
entry:
  call void @242(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @243(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.225(i8*) #0 {
entry:
  call void @243(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @244(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.226(i8*) #0 {
entry:
  call void @244(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @245(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.227(i8*) #0 {
entry:
  call void @245(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @246(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.228(i8*) #0 {
entry:
  call void @246(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @247(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.229(i8*) #0 {
entry:
  call void @247(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @248(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.230(i8*) #0 {
entry:
  call void @248(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @249(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.231(i8*) #0 {
entry:
  call void @249(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @250(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.232(i8*) #0 {
entry:
  call void @250(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @251(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.233(i8*) #0 {
entry:
  call void @251(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @252(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.234(i8*) #0 {
entry:
  call void @252(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @253(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.235(i8*) #0 {
entry:
  call void @253(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @254(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.236(i8*) #0 {
entry:
  call void @254(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @255(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.237(i8*) #0 {
entry:
  call void @255(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @256(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.238(i8*) #0 {
entry:
  call void @256(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @257(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.239(i8*) #0 {
entry:
  call void @257(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @258(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.240(i8*) #0 {
entry:
  call void @258(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @259(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.241(i8*) #0 {
entry:
  call void @259(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @260(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.242(i8*) #0 {
entry:
  call void @260(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @261(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.243(i8*) #0 {
entry:
  call void @261(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @262(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.244(i8*) #0 {
entry:
  call void @262(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @263(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.245(i8*) #0 {
entry:
  call void @263(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @264(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.246(i8*) #0 {
entry:
  call void @264(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @265(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.247(i8*) #0 {
entry:
  call void @265(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @266(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.248(i8*) #0 {
entry:
  call void @266(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @267(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.249(i8*) #0 {
entry:
  call void @267(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @268(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.250(i8*) #0 {
entry:
  call void @268(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @269(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.251(i8*) #0 {
entry:
  call void @269(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @270(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.252(i8*) #0 {
entry:
  call void @270(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @271(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.253(i8*) #0 {
entry:
  call void @271(i8* %0)
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
