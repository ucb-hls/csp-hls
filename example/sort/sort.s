; ModuleID = 'main'
; TODO(growly): Does commenting this out break anything?
; source_filename = "main"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%FIFO = type {}

@"init$guard" = internal global i1 false
@main.input = external global [64 x i64]

declare void @pthread_create(i8*, i8*, i8*, i8*)

declare %FIFO* @fifo_malloc(i8 zeroext, i64)

declare i64 @fifo_read(%FIFO*)

declare void @pthread_exit(i8*)

declare void @fifo_write(%FIFO*, i64)

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #0

define internal void @main.checkSort(i8* nest, [64 x i64]* byval) #1 {
prologue:
  %arr = load [64 x i64], [64 x i64]* %1
  %arr1 = alloca [64 x i64]
  %2 = bitcast [64 x i64]* %arr1 to i8*
  br label %.0.entry

.0.entry:                                         ; preds = %prologue
  %3 = bitcast i8* %2 to [64 x i64]*
  store [64 x i64] %arr, [64 x i64]* %3
  %4 = bitcast i8* %2 to i64*
  %5 = getelementptr i64, i64* %4, i64 0
  %6 = bitcast i64* %5 to i8*
  %7 = bitcast i8* %6 to i64*
  %8 = load i64, i64* %7
  %9 = getelementptr inbounds i8, i8* %2, i64 8
  %10 = insertvalue { i8*, i64, i64 } undef, i8* %9, 0
  %11 = insertvalue { i8*, i64, i64 } %10, i64 63, 1
  %12 = insertvalue { i8*, i64, i64 } %11, i64 63, 2
  %13 = extractvalue { i8*, i64, i64 } %12, 1
  br label %.1.rangeindex.loop

.1.rangeindex.loop:                               ; preds = %.5.if.done, %.0.entry
  %y = phi i64 [ %8, %.0.entry ], [ %24, %.5.if.done ]
  %14 = phi i64 [ -1, %.0.entry ], [ %15, %.5.if.done ]
  %15 = add i64 %14, 1
  %16 = icmp slt i64 %15, %13
  %17 = zext i1 %16 to i8
  %18 = trunc i8 %17 to i1
  br i1 %18, label %.2.rangeindex.body, label %.3.rangeindex.done

.2.rangeindex.body:                               ; preds = %.1.rangeindex.loop
  %19 = extractvalue { i8*, i64, i64 } %12, 0
  %20 = bitcast i8* %19 to i64*
  %21 = getelementptr i64, i64* %20, i64 %15
  %22 = bitcast i64* %21 to i8*
  %23 = bitcast i8* %22 to i64*
  %24 = load i64, i64* %23
  %25 = icmp sgt i64 %y, %24
  %26 = zext i1 %25 to i8
  %27 = trunc i8 %26 to i1
  br i1 %27, label %.4.if.then, label %.5.if.done

.3.rangeindex.done:                               ; preds = %.1.rangeindex.loop
  ret void

.4.if.then:                                       ; preds = %.2.rangeindex.body
  ret void

.5.if.done:                                       ; preds = %.2.rangeindex.body
  br label %.1.rangeindex.loop
}

define internal void @main.divide(i8* nest, %FIFO* %in, %FIFO* %out_left, %FIFO* %out_right) #1 {
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

define void @main..import(i8* nest) #1 {
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

define internal void @main.load_values(i8* nest) #1 {
prologue:
  br label %.0.entry

.0.entry:                                         ; preds = %prologue
  store i64 1235761368, i64* getelementptr inbounds ([64 x i64], [64 x i64]* @main.input, i32 0, i32 0)
  store i64 3734338523, i64* getelementptr inbounds ([64 x i64], [64 x i64]* @main.input, i32 0, i64 1)
  store i64 26045387, i64* getelementptr inbounds ([64 x i64], [64 x i64]* @main.input, i32 0, i64 2)
  store i64 3593626455, i64* getelementptr inbounds ([64 x i64], [64 x i64]* @main.input, i32 0, i64 3)
  store i64 2624025978, i64* getelementptr inbounds ([64 x i64], [64 x i64]* @main.input, i32 0, i64 4)
  store i64 1047314994, i64* getelementptr inbounds ([64 x i64], [64 x i64]* @main.input, i32 0, i64 5)
  store i64 249162010, i64* getelementptr inbounds ([64 x i64], [64 x i64]* @main.input, i32 0, i64 6)
  store i64 1136607568, i64* getelementptr inbounds ([64 x i64], [64 x i64]* @main.input, i32 0, i64 7)
  store i64 2697783015, i64* getelementptr inbounds ([64 x i64], [64 x i64]* @main.input, i32 0, i64 8)
  store i64 1028460327, i64* getelementptr inbounds ([64 x i64], [64 x i64]* @main.input, i32 0, i64 9)
  store i64 1604041314, i64* getelementptr inbounds ([64 x i64], [64 x i64]* @main.input, i32 0, i64 10)
  store i64 2395687063, i64* getelementptr inbounds ([64 x i64], [64 x i64]* @main.input, i32 0, i64 11)
  store i64 829816908, i64* getelementptr inbounds ([64 x i64], [64 x i64]* @main.input, i32 0, i64 12)
  store i64 3512856069, i64* getelementptr inbounds ([64 x i64], [64 x i64]* @main.input, i32 0, i64 13)
  store i64 872151033, i64* getelementptr inbounds ([64 x i64], [64 x i64]* @main.input, i32 0, i64 14)
  store i64 3564893569, i64* getelementptr inbounds ([64 x i64], [64 x i64]* @main.input, i32 0, i64 15)
  store i64 1883155559, i64* getelementptr inbounds ([64 x i64], [64 x i64]* @main.input, i32 0, i64 16)
  store i64 3926769788, i64* getelementptr inbounds ([64 x i64], [64 x i64]* @main.input, i32 0, i64 17)
  store i64 2300858727, i64* getelementptr inbounds ([64 x i64], [64 x i64]* @main.input, i32 0, i64 18)
  store i64 908258304, i64* getelementptr inbounds ([64 x i64], [64 x i64]* @main.input, i32 0, i64 19)
  store i64 2594954262, i64* getelementptr inbounds ([64 x i64], [64 x i64]* @main.input, i32 0, i64 20)
  store i64 3269837735, i64* getelementptr inbounds ([64 x i64], [64 x i64]* @main.input, i32 0, i64 21)
  store i64 1013565733, i64* getelementptr inbounds ([64 x i64], [64 x i64]* @main.input, i32 0, i64 22)
  store i64 2928781266, i64* getelementptr inbounds ([64 x i64], [64 x i64]* @main.input, i32 0, i64 23)
  store i64 3062120167, i64* getelementptr inbounds ([64 x i64], [64 x i64]* @main.input, i32 0, i64 24)
  store i64 1225708050, i64* getelementptr inbounds ([64 x i64], [64 x i64]* @main.input, i32 0, i64 25)
  store i64 3767424270, i64* getelementptr inbounds ([64 x i64], [64 x i64]* @main.input, i32 0, i64 26)
  store i64 3199502442, i64* getelementptr inbounds ([64 x i64], [64 x i64]* @main.input, i32 0, i64 27)
  store i64 1702651580, i64* getelementptr inbounds ([64 x i64], [64 x i64]* @main.input, i32 0, i64 28)
  store i64 952209131, i64* getelementptr inbounds ([64 x i64], [64 x i64]* @main.input, i32 0, i64 29)
  store i64 250265838, i64* getelementptr inbounds ([64 x i64], [64 x i64]* @main.input, i32 0, i64 30)
  store i64 1684768425, i64* getelementptr inbounds ([64 x i64], [64 x i64]* @main.input, i32 0, i64 31)
  store i64 213668974, i64* getelementptr inbounds ([64 x i64], [64 x i64]* @main.input, i32 0, i64 32)
  store i64 337964090, i64* getelementptr inbounds ([64 x i64], [64 x i64]* @main.input, i32 0, i64 33)
  store i64 2474628599, i64* getelementptr inbounds ([64 x i64], [64 x i64]* @main.input, i32 0, i64 34)
  store i64 827888263, i64* getelementptr inbounds ([64 x i64], [64 x i64]* @main.input, i32 0, i64 35)
  store i64 990764384, i64* getelementptr inbounds ([64 x i64], [64 x i64]* @main.input, i32 0, i64 36)
  store i64 2482066059, i64* getelementptr inbounds ([64 x i64], [64 x i64]* @main.input, i32 0, i64 37)
  store i64 1616513204, i64* getelementptr inbounds ([64 x i64], [64 x i64]* @main.input, i32 0, i64 38)
  store i64 1241153464, i64* getelementptr inbounds ([64 x i64], [64 x i64]* @main.input, i32 0, i64 39)
  store i64 2325506692, i64* getelementptr inbounds ([64 x i64], [64 x i64]* @main.input, i32 0, i64 40)
  store i64 3336413292, i64* getelementptr inbounds ([64 x i64], [64 x i64]* @main.input, i32 0, i64 41)
  store i64 1743884936, i64* getelementptr inbounds ([64 x i64], [64 x i64]* @main.input, i32 0, i64 42)
  store i64 3527008682, i64* getelementptr inbounds ([64 x i64], [64 x i64]* @main.input, i32 0, i64 43)
  store i64 857170, i64* getelementptr inbounds ([64 x i64], [64 x i64]* @main.input, i32 0, i64 44)
  store i64 2924828567, i64* getelementptr inbounds ([64 x i64], [64 x i64]* @main.input, i32 0, i64 45)
  store i64 688309556, i64* getelementptr inbounds ([64 x i64], [64 x i64]* @main.input, i32 0, i64 46)
  store i64 859484738, i64* getelementptr inbounds ([64 x i64], [64 x i64]* @main.input, i32 0, i64 47)
  store i64 2971824392, i64* getelementptr inbounds ([64 x i64], [64 x i64]* @main.input, i32 0, i64 48)
  store i64 1720950776, i64* getelementptr inbounds ([64 x i64], [64 x i64]* @main.input, i32 0, i64 49)
  store i64 3104896070, i64* getelementptr inbounds ([64 x i64], [64 x i64]* @main.input, i32 0, i64 50)
  store i64 156691467, i64* getelementptr inbounds ([64 x i64], [64 x i64]* @main.input, i32 0, i64 51)
  store i64 2344632603, i64* getelementptr inbounds ([64 x i64], [64 x i64]* @main.input, i32 0, i64 52)
  store i64 3741896403, i64* getelementptr inbounds ([64 x i64], [64 x i64]* @main.input, i32 0, i64 53)
  store i64 188579560, i64* getelementptr inbounds ([64 x i64], [64 x i64]* @main.input, i32 0, i64 54)
  store i64 334829707, i64* getelementptr inbounds ([64 x i64], [64 x i64]* @main.input, i32 0, i64 55)
  store i64 1129787860, i64* getelementptr inbounds ([64 x i64], [64 x i64]* @main.input, i32 0, i64 56)
  store i64 955246496, i64* getelementptr inbounds ([64 x i64], [64 x i64]* @main.input, i32 0, i64 57)
  store i64 2431486451, i64* getelementptr inbounds ([64 x i64], [64 x i64]* @main.input, i32 0, i64 58)
  store i64 2981583155, i64* getelementptr inbounds ([64 x i64], [64 x i64]* @main.input, i32 0, i64 59)
  store i64 2651437058, i64* getelementptr inbounds ([64 x i64], [64 x i64]* @main.input, i32 0, i64 60)
  store i64 3687511230, i64* getelementptr inbounds ([64 x i64], [64 x i64]* @main.input, i32 0, i64 61)
  store i64 2273517397, i64* getelementptr inbounds ([64 x i64], [64 x i64]* @main.input, i32 0, i64 62)
  store i64 3025290067, i64* getelementptr inbounds ([64 x i64], [64 x i64]* @main.input, i32 0, i64 63)
  ret void
}

define void @main.main(i8* nest) #1 {
prologue:
  %1 = alloca [64 x i64]
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
  %380 = alloca [64 x i64]
  %381 = alloca [64 x i64]
  %382 = alloca i64
  %383 = alloca [64 x i64]
  %maybe = alloca [64 x i64]
  %384 = bitcast [64 x i64]* %maybe to i8*
  br label %.0.entry

.0.entry:                                         ; preds = %prologue
  call void @main.load_values(i8* nest undef)
  %385 = load [64 x i64], [64 x i64]* @main.input
  store [64 x i64] %385, [64 x i64]* %1
  call void @main.checkSort(i8* nest undef, [64 x i64]* byval %1)
  %386 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %387 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %388 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %389 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %390 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %391 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %392 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %393 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %394 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
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
  %513 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %2, i32 0, i32 0
  store %FIFO* %386, %FIFO** %513
  %514 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %2, i32 0, i32 1
  store %FIFO* %387, %FIFO** %514
  %515 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %2, i32 0, i32 2
  store %FIFO* %388, %FIFO** %515
  %516 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %2 to i8*
  store i32* %thread_id, i32** %3
  %517 = bitcast i32*** %4 to i8**
  store i32** %3, i32*** %4
  %518 = load i8*, i8** %517
  call void @pthread_create(i8* %518, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper to i8*), i8* %516)
  %519 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %5, i32 0, i32 0
  store %FIFO* %387, %FIFO** %519
  %520 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %5, i32 0, i32 1
  store %FIFO* %389, %FIFO** %520
  %521 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %5, i32 0, i32 2
  store %FIFO* %390, %FIFO** %521
  %522 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %5 to i8*
  store i32* %thread_id1, i32** %6
  %523 = bitcast i32*** %7 to i8**
  store i32** %6, i32*** %7
  %524 = load i8*, i8** %523
  call void @pthread_create(i8* %524, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.1 to i8*), i8* %522)
  %525 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %8, i32 0, i32 0
  store %FIFO* %388, %FIFO** %525
  %526 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %8, i32 0, i32 1
  store %FIFO* %391, %FIFO** %526
  %527 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %8, i32 0, i32 2
  store %FIFO* %392, %FIFO** %527
  %528 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %8 to i8*
  store i32* %thread_id2, i32** %9
  %529 = bitcast i32*** %10 to i8**
  store i32** %9, i32*** %10
  %530 = load i8*, i8** %529
  call void @pthread_create(i8* %530, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.2 to i8*), i8* %528)
  %531 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %11, i32 0, i32 0
  store %FIFO* %389, %FIFO** %531
  %532 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %11, i32 0, i32 1
  store %FIFO* %393, %FIFO** %532
  %533 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %11, i32 0, i32 2
  store %FIFO* %394, %FIFO** %533
  %534 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %11 to i8*
  store i32* %thread_id3, i32** %12
  %535 = bitcast i32*** %13 to i8**
  store i32** %12, i32*** %13
  %536 = load i8*, i8** %535
  call void @pthread_create(i8* %536, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.3 to i8*), i8* %534)
  %537 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %14, i32 0, i32 0
  store %FIFO* %390, %FIFO** %537
  %538 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %14, i32 0, i32 1
  store %FIFO* %395, %FIFO** %538
  %539 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %14, i32 0, i32 2
  store %FIFO* %396, %FIFO** %539
  %540 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %14 to i8*
  store i32* %thread_id4, i32** %15
  %541 = bitcast i32*** %16 to i8**
  store i32** %15, i32*** %16
  %542 = load i8*, i8** %541
  call void @pthread_create(i8* %542, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.4 to i8*), i8* %540)
  %543 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %17, i32 0, i32 0
  store %FIFO* %391, %FIFO** %543
  %544 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %17, i32 0, i32 1
  store %FIFO* %397, %FIFO** %544
  %545 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %17, i32 0, i32 2
  store %FIFO* %398, %FIFO** %545
  %546 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %17 to i8*
  store i32* %thread_id5, i32** %18
  %547 = bitcast i32*** %19 to i8**
  store i32** %18, i32*** %19
  %548 = load i8*, i8** %547
  call void @pthread_create(i8* %548, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.5 to i8*), i8* %546)
  %549 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %20, i32 0, i32 0
  store %FIFO* %392, %FIFO** %549
  %550 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %20, i32 0, i32 1
  store %FIFO* %399, %FIFO** %550
  %551 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %20, i32 0, i32 2
  store %FIFO* %400, %FIFO** %551
  %552 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %20 to i8*
  store i32* %thread_id6, i32** %21
  %553 = bitcast i32*** %22 to i8**
  store i32** %21, i32*** %22
  %554 = load i8*, i8** %553
  call void @pthread_create(i8* %554, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.6 to i8*), i8* %552)
  %555 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %23, i32 0, i32 0
  store %FIFO* %393, %FIFO** %555
  %556 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %23, i32 0, i32 1
  store %FIFO* %401, %FIFO** %556
  %557 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %23, i32 0, i32 2
  store %FIFO* %402, %FIFO** %557
  %558 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %23 to i8*
  store i32* %thread_id7, i32** %24
  %559 = bitcast i32*** %25 to i8**
  store i32** %24, i32*** %25
  %560 = load i8*, i8** %559
  call void @pthread_create(i8* %560, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.7 to i8*), i8* %558)
  %561 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %26, i32 0, i32 0
  store %FIFO* %394, %FIFO** %561
  %562 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %26, i32 0, i32 1
  store %FIFO* %403, %FIFO** %562
  %563 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %26, i32 0, i32 2
  store %FIFO* %404, %FIFO** %563
  %564 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %26 to i8*
  store i32* %thread_id8, i32** %27
  %565 = bitcast i32*** %28 to i8**
  store i32** %27, i32*** %28
  %566 = load i8*, i8** %565
  call void @pthread_create(i8* %566, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.8 to i8*), i8* %564)
  %567 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %29, i32 0, i32 0
  store %FIFO* %395, %FIFO** %567
  %568 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %29, i32 0, i32 1
  store %FIFO* %405, %FIFO** %568
  %569 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %29, i32 0, i32 2
  store %FIFO* %406, %FIFO** %569
  %570 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %29 to i8*
  store i32* %thread_id9, i32** %30
  %571 = bitcast i32*** %31 to i8**
  store i32** %30, i32*** %31
  %572 = load i8*, i8** %571
  call void @pthread_create(i8* %572, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.9 to i8*), i8* %570)
  %573 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %32, i32 0, i32 0
  store %FIFO* %396, %FIFO** %573
  %574 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %32, i32 0, i32 1
  store %FIFO* %407, %FIFO** %574
  %575 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %32, i32 0, i32 2
  store %FIFO* %408, %FIFO** %575
  %576 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %32 to i8*
  store i32* %thread_id10, i32** %33
  %577 = bitcast i32*** %34 to i8**
  store i32** %33, i32*** %34
  %578 = load i8*, i8** %577
  call void @pthread_create(i8* %578, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.10 to i8*), i8* %576)
  %579 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %35, i32 0, i32 0
  store %FIFO* %397, %FIFO** %579
  %580 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %35, i32 0, i32 1
  store %FIFO* %409, %FIFO** %580
  %581 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %35, i32 0, i32 2
  store %FIFO* %410, %FIFO** %581
  %582 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %35 to i8*
  store i32* %thread_id11, i32** %36
  %583 = bitcast i32*** %37 to i8**
  store i32** %36, i32*** %37
  %584 = load i8*, i8** %583
  call void @pthread_create(i8* %584, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.11 to i8*), i8* %582)
  %585 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %38, i32 0, i32 0
  store %FIFO* %398, %FIFO** %585
  %586 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %38, i32 0, i32 1
  store %FIFO* %411, %FIFO** %586
  %587 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %38, i32 0, i32 2
  store %FIFO* %412, %FIFO** %587
  %588 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %38 to i8*
  store i32* %thread_id12, i32** %39
  %589 = bitcast i32*** %40 to i8**
  store i32** %39, i32*** %40
  %590 = load i8*, i8** %589
  call void @pthread_create(i8* %590, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.12 to i8*), i8* %588)
  %591 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %41, i32 0, i32 0
  store %FIFO* %399, %FIFO** %591
  %592 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %41, i32 0, i32 1
  store %FIFO* %413, %FIFO** %592
  %593 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %41, i32 0, i32 2
  store %FIFO* %414, %FIFO** %593
  %594 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %41 to i8*
  store i32* %thread_id13, i32** %42
  %595 = bitcast i32*** %43 to i8**
  store i32** %42, i32*** %43
  %596 = load i8*, i8** %595
  call void @pthread_create(i8* %596, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.13 to i8*), i8* %594)
  %597 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %44, i32 0, i32 0
  store %FIFO* %400, %FIFO** %597
  %598 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %44, i32 0, i32 1
  store %FIFO* %415, %FIFO** %598
  %599 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %44, i32 0, i32 2
  store %FIFO* %416, %FIFO** %599
  %600 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %44 to i8*
  store i32* %thread_id14, i32** %45
  %601 = bitcast i32*** %46 to i8**
  store i32** %45, i32*** %46
  %602 = load i8*, i8** %601
  call void @pthread_create(i8* %602, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.14 to i8*), i8* %600)
  %603 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %47, i32 0, i32 0
  store %FIFO* %401, %FIFO** %603
  %604 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %47, i32 0, i32 1
  store %FIFO* %417, %FIFO** %604
  %605 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %47, i32 0, i32 2
  store %FIFO* %418, %FIFO** %605
  %606 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %47 to i8*
  store i32* %thread_id15, i32** %48
  %607 = bitcast i32*** %49 to i8**
  store i32** %48, i32*** %49
  %608 = load i8*, i8** %607
  call void @pthread_create(i8* %608, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.15 to i8*), i8* %606)
  %609 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %50, i32 0, i32 0
  store %FIFO* %402, %FIFO** %609
  %610 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %50, i32 0, i32 1
  store %FIFO* %419, %FIFO** %610
  %611 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %50, i32 0, i32 2
  store %FIFO* %420, %FIFO** %611
  %612 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %50 to i8*
  store i32* %thread_id16, i32** %51
  %613 = bitcast i32*** %52 to i8**
  store i32** %51, i32*** %52
  %614 = load i8*, i8** %613
  call void @pthread_create(i8* %614, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.16 to i8*), i8* %612)
  %615 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %53, i32 0, i32 0
  store %FIFO* %403, %FIFO** %615
  %616 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %53, i32 0, i32 1
  store %FIFO* %421, %FIFO** %616
  %617 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %53, i32 0, i32 2
  store %FIFO* %422, %FIFO** %617
  %618 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %53 to i8*
  store i32* %thread_id17, i32** %54
  %619 = bitcast i32*** %55 to i8**
  store i32** %54, i32*** %55
  %620 = load i8*, i8** %619
  call void @pthread_create(i8* %620, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.17 to i8*), i8* %618)
  %621 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %56, i32 0, i32 0
  store %FIFO* %404, %FIFO** %621
  %622 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %56, i32 0, i32 1
  store %FIFO* %423, %FIFO** %622
  %623 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %56, i32 0, i32 2
  store %FIFO* %424, %FIFO** %623
  %624 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %56 to i8*
  store i32* %thread_id18, i32** %57
  %625 = bitcast i32*** %58 to i8**
  store i32** %57, i32*** %58
  %626 = load i8*, i8** %625
  call void @pthread_create(i8* %626, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.18 to i8*), i8* %624)
  %627 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %59, i32 0, i32 0
  store %FIFO* %405, %FIFO** %627
  %628 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %59, i32 0, i32 1
  store %FIFO* %425, %FIFO** %628
  %629 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %59, i32 0, i32 2
  store %FIFO* %426, %FIFO** %629
  %630 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %59 to i8*
  store i32* %thread_id19, i32** %60
  %631 = bitcast i32*** %61 to i8**
  store i32** %60, i32*** %61
  %632 = load i8*, i8** %631
  call void @pthread_create(i8* %632, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.19 to i8*), i8* %630)
  %633 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %62, i32 0, i32 0
  store %FIFO* %406, %FIFO** %633
  %634 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %62, i32 0, i32 1
  store %FIFO* %427, %FIFO** %634
  %635 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %62, i32 0, i32 2
  store %FIFO* %428, %FIFO** %635
  %636 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %62 to i8*
  store i32* %thread_id20, i32** %63
  %637 = bitcast i32*** %64 to i8**
  store i32** %63, i32*** %64
  %638 = load i8*, i8** %637
  call void @pthread_create(i8* %638, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.20 to i8*), i8* %636)
  %639 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %65, i32 0, i32 0
  store %FIFO* %407, %FIFO** %639
  %640 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %65, i32 0, i32 1
  store %FIFO* %429, %FIFO** %640
  %641 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %65, i32 0, i32 2
  store %FIFO* %430, %FIFO** %641
  %642 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %65 to i8*
  store i32* %thread_id21, i32** %66
  %643 = bitcast i32*** %67 to i8**
  store i32** %66, i32*** %67
  %644 = load i8*, i8** %643
  call void @pthread_create(i8* %644, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.21 to i8*), i8* %642)
  %645 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %68, i32 0, i32 0
  store %FIFO* %408, %FIFO** %645
  %646 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %68, i32 0, i32 1
  store %FIFO* %431, %FIFO** %646
  %647 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %68, i32 0, i32 2
  store %FIFO* %432, %FIFO** %647
  %648 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %68 to i8*
  store i32* %thread_id22, i32** %69
  %649 = bitcast i32*** %70 to i8**
  store i32** %69, i32*** %70
  %650 = load i8*, i8** %649
  call void @pthread_create(i8* %650, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.22 to i8*), i8* %648)
  %651 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %71, i32 0, i32 0
  store %FIFO* %409, %FIFO** %651
  %652 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %71, i32 0, i32 1
  store %FIFO* %433, %FIFO** %652
  %653 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %71, i32 0, i32 2
  store %FIFO* %434, %FIFO** %653
  %654 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %71 to i8*
  store i32* %thread_id23, i32** %72
  %655 = bitcast i32*** %73 to i8**
  store i32** %72, i32*** %73
  %656 = load i8*, i8** %655
  call void @pthread_create(i8* %656, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.23 to i8*), i8* %654)
  %657 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %74, i32 0, i32 0
  store %FIFO* %410, %FIFO** %657
  %658 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %74, i32 0, i32 1
  store %FIFO* %435, %FIFO** %658
  %659 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %74, i32 0, i32 2
  store %FIFO* %436, %FIFO** %659
  %660 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %74 to i8*
  store i32* %thread_id24, i32** %75
  %661 = bitcast i32*** %76 to i8**
  store i32** %75, i32*** %76
  %662 = load i8*, i8** %661
  call void @pthread_create(i8* %662, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.24 to i8*), i8* %660)
  %663 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %77, i32 0, i32 0
  store %FIFO* %411, %FIFO** %663
  %664 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %77, i32 0, i32 1
  store %FIFO* %437, %FIFO** %664
  %665 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %77, i32 0, i32 2
  store %FIFO* %438, %FIFO** %665
  %666 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %77 to i8*
  store i32* %thread_id25, i32** %78
  %667 = bitcast i32*** %79 to i8**
  store i32** %78, i32*** %79
  %668 = load i8*, i8** %667
  call void @pthread_create(i8* %668, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.25 to i8*), i8* %666)
  %669 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %80, i32 0, i32 0
  store %FIFO* %412, %FIFO** %669
  %670 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %80, i32 0, i32 1
  store %FIFO* %439, %FIFO** %670
  %671 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %80, i32 0, i32 2
  store %FIFO* %440, %FIFO** %671
  %672 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %80 to i8*
  store i32* %thread_id26, i32** %81
  %673 = bitcast i32*** %82 to i8**
  store i32** %81, i32*** %82
  %674 = load i8*, i8** %673
  call void @pthread_create(i8* %674, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.26 to i8*), i8* %672)
  %675 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %83, i32 0, i32 0
  store %FIFO* %413, %FIFO** %675
  %676 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %83, i32 0, i32 1
  store %FIFO* %441, %FIFO** %676
  %677 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %83, i32 0, i32 2
  store %FIFO* %442, %FIFO** %677
  %678 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %83 to i8*
  store i32* %thread_id27, i32** %84
  %679 = bitcast i32*** %85 to i8**
  store i32** %84, i32*** %85
  %680 = load i8*, i8** %679
  call void @pthread_create(i8* %680, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.27 to i8*), i8* %678)
  %681 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %86, i32 0, i32 0
  store %FIFO* %414, %FIFO** %681
  %682 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %86, i32 0, i32 1
  store %FIFO* %443, %FIFO** %682
  %683 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %86, i32 0, i32 2
  store %FIFO* %444, %FIFO** %683
  %684 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %86 to i8*
  store i32* %thread_id28, i32** %87
  %685 = bitcast i32*** %88 to i8**
  store i32** %87, i32*** %88
  %686 = load i8*, i8** %685
  call void @pthread_create(i8* %686, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.28 to i8*), i8* %684)
  %687 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %89, i32 0, i32 0
  store %FIFO* %415, %FIFO** %687
  %688 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %89, i32 0, i32 1
  store %FIFO* %445, %FIFO** %688
  %689 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %89, i32 0, i32 2
  store %FIFO* %446, %FIFO** %689
  %690 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %89 to i8*
  store i32* %thread_id29, i32** %90
  %691 = bitcast i32*** %91 to i8**
  store i32** %90, i32*** %91
  %692 = load i8*, i8** %691
  call void @pthread_create(i8* %692, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.29 to i8*), i8* %690)
  %693 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %92, i32 0, i32 0
  store %FIFO* %416, %FIFO** %693
  %694 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %92, i32 0, i32 1
  store %FIFO* %447, %FIFO** %694
  %695 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %92, i32 0, i32 2
  store %FIFO* %448, %FIFO** %695
  %696 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %92 to i8*
  store i32* %thread_id30, i32** %93
  %697 = bitcast i32*** %94 to i8**
  store i32** %93, i32*** %94
  %698 = load i8*, i8** %697
  call void @pthread_create(i8* %698, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.30 to i8*), i8* %696)
  %699 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %95, i32 0, i32 0
  store %FIFO* %417, %FIFO** %699
  %700 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %95, i32 0, i32 1
  store %FIFO* %449, %FIFO** %700
  %701 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %95, i32 0, i32 2
  store %FIFO* %450, %FIFO** %701
  %702 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %95 to i8*
  store i32* %thread_id31, i32** %96
  %703 = bitcast i32*** %97 to i8**
  store i32** %96, i32*** %97
  %704 = load i8*, i8** %703
  call void @pthread_create(i8* %704, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.31 to i8*), i8* %702)
  %705 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %98, i32 0, i32 0
  store %FIFO* %418, %FIFO** %705
  %706 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %98, i32 0, i32 1
  store %FIFO* %451, %FIFO** %706
  %707 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %98, i32 0, i32 2
  store %FIFO* %452, %FIFO** %707
  %708 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %98 to i8*
  store i32* %thread_id32, i32** %99
  %709 = bitcast i32*** %100 to i8**
  store i32** %99, i32*** %100
  %710 = load i8*, i8** %709
  call void @pthread_create(i8* %710, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.32 to i8*), i8* %708)
  %711 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %101, i32 0, i32 0
  store %FIFO* %419, %FIFO** %711
  %712 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %101, i32 0, i32 1
  store %FIFO* %453, %FIFO** %712
  %713 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %101, i32 0, i32 2
  store %FIFO* %454, %FIFO** %713
  %714 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %101 to i8*
  store i32* %thread_id33, i32** %102
  %715 = bitcast i32*** %103 to i8**
  store i32** %102, i32*** %103
  %716 = load i8*, i8** %715
  call void @pthread_create(i8* %716, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.33 to i8*), i8* %714)
  %717 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %104, i32 0, i32 0
  store %FIFO* %420, %FIFO** %717
  %718 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %104, i32 0, i32 1
  store %FIFO* %455, %FIFO** %718
  %719 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %104, i32 0, i32 2
  store %FIFO* %456, %FIFO** %719
  %720 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %104 to i8*
  store i32* %thread_id34, i32** %105
  %721 = bitcast i32*** %106 to i8**
  store i32** %105, i32*** %106
  %722 = load i8*, i8** %721
  call void @pthread_create(i8* %722, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.34 to i8*), i8* %720)
  %723 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %107, i32 0, i32 0
  store %FIFO* %421, %FIFO** %723
  %724 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %107, i32 0, i32 1
  store %FIFO* %457, %FIFO** %724
  %725 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %107, i32 0, i32 2
  store %FIFO* %458, %FIFO** %725
  %726 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %107 to i8*
  store i32* %thread_id35, i32** %108
  %727 = bitcast i32*** %109 to i8**
  store i32** %108, i32*** %109
  %728 = load i8*, i8** %727
  call void @pthread_create(i8* %728, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.35 to i8*), i8* %726)
  %729 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %110, i32 0, i32 0
  store %FIFO* %422, %FIFO** %729
  %730 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %110, i32 0, i32 1
  store %FIFO* %459, %FIFO** %730
  %731 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %110, i32 0, i32 2
  store %FIFO* %460, %FIFO** %731
  %732 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %110 to i8*
  store i32* %thread_id36, i32** %111
  %733 = bitcast i32*** %112 to i8**
  store i32** %111, i32*** %112
  %734 = load i8*, i8** %733
  call void @pthread_create(i8* %734, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.36 to i8*), i8* %732)
  %735 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %113, i32 0, i32 0
  store %FIFO* %423, %FIFO** %735
  %736 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %113, i32 0, i32 1
  store %FIFO* %461, %FIFO** %736
  %737 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %113, i32 0, i32 2
  store %FIFO* %462, %FIFO** %737
  %738 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %113 to i8*
  store i32* %thread_id37, i32** %114
  %739 = bitcast i32*** %115 to i8**
  store i32** %114, i32*** %115
  %740 = load i8*, i8** %739
  call void @pthread_create(i8* %740, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.37 to i8*), i8* %738)
  %741 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %116, i32 0, i32 0
  store %FIFO* %424, %FIFO** %741
  %742 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %116, i32 0, i32 1
  store %FIFO* %463, %FIFO** %742
  %743 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %116, i32 0, i32 2
  store %FIFO* %464, %FIFO** %743
  %744 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %116 to i8*
  store i32* %thread_id38, i32** %117
  %745 = bitcast i32*** %118 to i8**
  store i32** %117, i32*** %118
  %746 = load i8*, i8** %745
  call void @pthread_create(i8* %746, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.38 to i8*), i8* %744)
  %747 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %119, i32 0, i32 0
  store %FIFO* %425, %FIFO** %747
  %748 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %119, i32 0, i32 1
  store %FIFO* %465, %FIFO** %748
  %749 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %119, i32 0, i32 2
  store %FIFO* %466, %FIFO** %749
  %750 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %119 to i8*
  store i32* %thread_id39, i32** %120
  %751 = bitcast i32*** %121 to i8**
  store i32** %120, i32*** %121
  %752 = load i8*, i8** %751
  call void @pthread_create(i8* %752, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.39 to i8*), i8* %750)
  %753 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %122, i32 0, i32 0
  store %FIFO* %426, %FIFO** %753
  %754 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %122, i32 0, i32 1
  store %FIFO* %467, %FIFO** %754
  %755 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %122, i32 0, i32 2
  store %FIFO* %468, %FIFO** %755
  %756 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %122 to i8*
  store i32* %thread_id40, i32** %123
  %757 = bitcast i32*** %124 to i8**
  store i32** %123, i32*** %124
  %758 = load i8*, i8** %757
  call void @pthread_create(i8* %758, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.40 to i8*), i8* %756)
  %759 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %125, i32 0, i32 0
  store %FIFO* %427, %FIFO** %759
  %760 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %125, i32 0, i32 1
  store %FIFO* %469, %FIFO** %760
  %761 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %125, i32 0, i32 2
  store %FIFO* %470, %FIFO** %761
  %762 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %125 to i8*
  store i32* %thread_id41, i32** %126
  %763 = bitcast i32*** %127 to i8**
  store i32** %126, i32*** %127
  %764 = load i8*, i8** %763
  call void @pthread_create(i8* %764, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.41 to i8*), i8* %762)
  %765 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %128, i32 0, i32 0
  store %FIFO* %428, %FIFO** %765
  %766 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %128, i32 0, i32 1
  store %FIFO* %471, %FIFO** %766
  %767 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %128, i32 0, i32 2
  store %FIFO* %472, %FIFO** %767
  %768 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %128 to i8*
  store i32* %thread_id42, i32** %129
  %769 = bitcast i32*** %130 to i8**
  store i32** %129, i32*** %130
  %770 = load i8*, i8** %769
  call void @pthread_create(i8* %770, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.42 to i8*), i8* %768)
  %771 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %131, i32 0, i32 0
  store %FIFO* %429, %FIFO** %771
  %772 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %131, i32 0, i32 1
  store %FIFO* %473, %FIFO** %772
  %773 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %131, i32 0, i32 2
  store %FIFO* %474, %FIFO** %773
  %774 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %131 to i8*
  store i32* %thread_id43, i32** %132
  %775 = bitcast i32*** %133 to i8**
  store i32** %132, i32*** %133
  %776 = load i8*, i8** %775
  call void @pthread_create(i8* %776, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.43 to i8*), i8* %774)
  %777 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %134, i32 0, i32 0
  store %FIFO* %430, %FIFO** %777
  %778 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %134, i32 0, i32 1
  store %FIFO* %475, %FIFO** %778
  %779 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %134, i32 0, i32 2
  store %FIFO* %476, %FIFO** %779
  %780 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %134 to i8*
  store i32* %thread_id44, i32** %135
  %781 = bitcast i32*** %136 to i8**
  store i32** %135, i32*** %136
  %782 = load i8*, i8** %781
  call void @pthread_create(i8* %782, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.44 to i8*), i8* %780)
  %783 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %137, i32 0, i32 0
  store %FIFO* %431, %FIFO** %783
  %784 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %137, i32 0, i32 1
  store %FIFO* %477, %FIFO** %784
  %785 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %137, i32 0, i32 2
  store %FIFO* %478, %FIFO** %785
  %786 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %137 to i8*
  store i32* %thread_id45, i32** %138
  %787 = bitcast i32*** %139 to i8**
  store i32** %138, i32*** %139
  %788 = load i8*, i8** %787
  call void @pthread_create(i8* %788, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.45 to i8*), i8* %786)
  %789 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %140, i32 0, i32 0
  store %FIFO* %432, %FIFO** %789
  %790 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %140, i32 0, i32 1
  store %FIFO* %479, %FIFO** %790
  %791 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %140, i32 0, i32 2
  store %FIFO* %480, %FIFO** %791
  %792 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %140 to i8*
  store i32* %thread_id46, i32** %141
  %793 = bitcast i32*** %142 to i8**
  store i32** %141, i32*** %142
  %794 = load i8*, i8** %793
  call void @pthread_create(i8* %794, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.46 to i8*), i8* %792)
  %795 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %143, i32 0, i32 0
  store %FIFO* %433, %FIFO** %795
  %796 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %143, i32 0, i32 1
  store %FIFO* %481, %FIFO** %796
  %797 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %143, i32 0, i32 2
  store %FIFO* %482, %FIFO** %797
  %798 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %143 to i8*
  store i32* %thread_id47, i32** %144
  %799 = bitcast i32*** %145 to i8**
  store i32** %144, i32*** %145
  %800 = load i8*, i8** %799
  call void @pthread_create(i8* %800, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.47 to i8*), i8* %798)
  %801 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %146, i32 0, i32 0
  store %FIFO* %434, %FIFO** %801
  %802 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %146, i32 0, i32 1
  store %FIFO* %483, %FIFO** %802
  %803 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %146, i32 0, i32 2
  store %FIFO* %484, %FIFO** %803
  %804 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %146 to i8*
  store i32* %thread_id48, i32** %147
  %805 = bitcast i32*** %148 to i8**
  store i32** %147, i32*** %148
  %806 = load i8*, i8** %805
  call void @pthread_create(i8* %806, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.48 to i8*), i8* %804)
  %807 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %149, i32 0, i32 0
  store %FIFO* %435, %FIFO** %807
  %808 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %149, i32 0, i32 1
  store %FIFO* %485, %FIFO** %808
  %809 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %149, i32 0, i32 2
  store %FIFO* %486, %FIFO** %809
  %810 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %149 to i8*
  store i32* %thread_id49, i32** %150
  %811 = bitcast i32*** %151 to i8**
  store i32** %150, i32*** %151
  %812 = load i8*, i8** %811
  call void @pthread_create(i8* %812, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.49 to i8*), i8* %810)
  %813 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %152, i32 0, i32 0
  store %FIFO* %436, %FIFO** %813
  %814 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %152, i32 0, i32 1
  store %FIFO* %487, %FIFO** %814
  %815 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %152, i32 0, i32 2
  store %FIFO* %488, %FIFO** %815
  %816 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %152 to i8*
  store i32* %thread_id50, i32** %153
  %817 = bitcast i32*** %154 to i8**
  store i32** %153, i32*** %154
  %818 = load i8*, i8** %817
  call void @pthread_create(i8* %818, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.50 to i8*), i8* %816)
  %819 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %155, i32 0, i32 0
  store %FIFO* %437, %FIFO** %819
  %820 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %155, i32 0, i32 1
  store %FIFO* %489, %FIFO** %820
  %821 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %155, i32 0, i32 2
  store %FIFO* %490, %FIFO** %821
  %822 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %155 to i8*
  store i32* %thread_id51, i32** %156
  %823 = bitcast i32*** %157 to i8**
  store i32** %156, i32*** %157
  %824 = load i8*, i8** %823
  call void @pthread_create(i8* %824, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.51 to i8*), i8* %822)
  %825 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %158, i32 0, i32 0
  store %FIFO* %438, %FIFO** %825
  %826 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %158, i32 0, i32 1
  store %FIFO* %491, %FIFO** %826
  %827 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %158, i32 0, i32 2
  store %FIFO* %492, %FIFO** %827
  %828 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %158 to i8*
  store i32* %thread_id52, i32** %159
  %829 = bitcast i32*** %160 to i8**
  store i32** %159, i32*** %160
  %830 = load i8*, i8** %829
  call void @pthread_create(i8* %830, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.52 to i8*), i8* %828)
  %831 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %161, i32 0, i32 0
  store %FIFO* %439, %FIFO** %831
  %832 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %161, i32 0, i32 1
  store %FIFO* %493, %FIFO** %832
  %833 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %161, i32 0, i32 2
  store %FIFO* %494, %FIFO** %833
  %834 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %161 to i8*
  store i32* %thread_id53, i32** %162
  %835 = bitcast i32*** %163 to i8**
  store i32** %162, i32*** %163
  %836 = load i8*, i8** %835
  call void @pthread_create(i8* %836, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.53 to i8*), i8* %834)
  %837 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %164, i32 0, i32 0
  store %FIFO* %440, %FIFO** %837
  %838 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %164, i32 0, i32 1
  store %FIFO* %495, %FIFO** %838
  %839 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %164, i32 0, i32 2
  store %FIFO* %496, %FIFO** %839
  %840 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %164 to i8*
  store i32* %thread_id54, i32** %165
  %841 = bitcast i32*** %166 to i8**
  store i32** %165, i32*** %166
  %842 = load i8*, i8** %841
  call void @pthread_create(i8* %842, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.54 to i8*), i8* %840)
  %843 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %167, i32 0, i32 0
  store %FIFO* %441, %FIFO** %843
  %844 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %167, i32 0, i32 1
  store %FIFO* %497, %FIFO** %844
  %845 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %167, i32 0, i32 2
  store %FIFO* %498, %FIFO** %845
  %846 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %167 to i8*
  store i32* %thread_id55, i32** %168
  %847 = bitcast i32*** %169 to i8**
  store i32** %168, i32*** %169
  %848 = load i8*, i8** %847
  call void @pthread_create(i8* %848, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.55 to i8*), i8* %846)
  %849 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %170, i32 0, i32 0
  store %FIFO* %442, %FIFO** %849
  %850 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %170, i32 0, i32 1
  store %FIFO* %499, %FIFO** %850
  %851 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %170, i32 0, i32 2
  store %FIFO* %500, %FIFO** %851
  %852 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %170 to i8*
  store i32* %thread_id56, i32** %171
  %853 = bitcast i32*** %172 to i8**
  store i32** %171, i32*** %172
  %854 = load i8*, i8** %853
  call void @pthread_create(i8* %854, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.56 to i8*), i8* %852)
  %855 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %173, i32 0, i32 0
  store %FIFO* %443, %FIFO** %855
  %856 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %173, i32 0, i32 1
  store %FIFO* %501, %FIFO** %856
  %857 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %173, i32 0, i32 2
  store %FIFO* %502, %FIFO** %857
  %858 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %173 to i8*
  store i32* %thread_id57, i32** %174
  %859 = bitcast i32*** %175 to i8**
  store i32** %174, i32*** %175
  %860 = load i8*, i8** %859
  call void @pthread_create(i8* %860, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.57 to i8*), i8* %858)
  %861 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %176, i32 0, i32 0
  store %FIFO* %444, %FIFO** %861
  %862 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %176, i32 0, i32 1
  store %FIFO* %503, %FIFO** %862
  %863 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %176, i32 0, i32 2
  store %FIFO* %504, %FIFO** %863
  %864 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %176 to i8*
  store i32* %thread_id58, i32** %177
  %865 = bitcast i32*** %178 to i8**
  store i32** %177, i32*** %178
  %866 = load i8*, i8** %865
  call void @pthread_create(i8* %866, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.58 to i8*), i8* %864)
  %867 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %179, i32 0, i32 0
  store %FIFO* %445, %FIFO** %867
  %868 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %179, i32 0, i32 1
  store %FIFO* %505, %FIFO** %868
  %869 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %179, i32 0, i32 2
  store %FIFO* %506, %FIFO** %869
  %870 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %179 to i8*
  store i32* %thread_id59, i32** %180
  %871 = bitcast i32*** %181 to i8**
  store i32** %180, i32*** %181
  %872 = load i8*, i8** %871
  call void @pthread_create(i8* %872, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.59 to i8*), i8* %870)
  %873 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %182, i32 0, i32 0
  store %FIFO* %446, %FIFO** %873
  %874 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %182, i32 0, i32 1
  store %FIFO* %507, %FIFO** %874
  %875 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %182, i32 0, i32 2
  store %FIFO* %508, %FIFO** %875
  %876 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %182 to i8*
  store i32* %thread_id60, i32** %183
  %877 = bitcast i32*** %184 to i8**
  store i32** %183, i32*** %184
  %878 = load i8*, i8** %877
  call void @pthread_create(i8* %878, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.60 to i8*), i8* %876)
  %879 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %185, i32 0, i32 0
  store %FIFO* %447, %FIFO** %879
  %880 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %185, i32 0, i32 1
  store %FIFO* %509, %FIFO** %880
  %881 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %185, i32 0, i32 2
  store %FIFO* %510, %FIFO** %881
  %882 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %185 to i8*
  store i32* %thread_id61, i32** %186
  %883 = bitcast i32*** %187 to i8**
  store i32** %186, i32*** %187
  %884 = load i8*, i8** %883
  call void @pthread_create(i8* %884, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.61 to i8*), i8* %882)
  %885 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %188, i32 0, i32 0
  store %FIFO* %448, %FIFO** %885
  %886 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %188, i32 0, i32 1
  store %FIFO* %511, %FIFO** %886
  %887 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %188, i32 0, i32 2
  store %FIFO* %512, %FIFO** %887
  %888 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %188 to i8*
  store i32* %thread_id62, i32** %189
  %889 = bitcast i32*** %190 to i8**
  store i32** %189, i32*** %190
  %890 = load i8*, i8** %889
  call void @pthread_create(i8* %890, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.62 to i8*), i8* %888)
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
  %954 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %191, i32 0, i32 0
  store %FIFO* %449, %FIFO** %954
  %955 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %191, i32 0, i32 1
  store %FIFO* %481, %FIFO** %955
  %956 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %191, i32 0, i32 2
  store %FIFO* %891, %FIFO** %956
  %957 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %191 to i8*
  store i32* %thread_id63, i32** %192
  %958 = bitcast i32*** %193 to i8**
  store i32** %192, i32*** %193
  %959 = load i8*, i8** %958
  call void @pthread_create(i8* %959, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.63 to i8*), i8* %957)
  %960 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %194, i32 0, i32 0
  store %FIFO* %450, %FIFO** %960
  %961 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %194, i32 0, i32 1
  store %FIFO* %482, %FIFO** %961
  %962 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %194, i32 0, i32 2
  store %FIFO* %892, %FIFO** %962
  %963 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %194 to i8*
  store i32* %thread_id64, i32** %195
  %964 = bitcast i32*** %196 to i8**
  store i32** %195, i32*** %196
  %965 = load i8*, i8** %964
  call void @pthread_create(i8* %965, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.64 to i8*), i8* %963)
  %966 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %197, i32 0, i32 0
  store %FIFO* %451, %FIFO** %966
  %967 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %197, i32 0, i32 1
  store %FIFO* %483, %FIFO** %967
  %968 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %197, i32 0, i32 2
  store %FIFO* %893, %FIFO** %968
  %969 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %197 to i8*
  store i32* %thread_id65, i32** %198
  %970 = bitcast i32*** %199 to i8**
  store i32** %198, i32*** %199
  %971 = load i8*, i8** %970
  call void @pthread_create(i8* %971, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.65 to i8*), i8* %969)
  %972 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %200, i32 0, i32 0
  store %FIFO* %452, %FIFO** %972
  %973 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %200, i32 0, i32 1
  store %FIFO* %484, %FIFO** %973
  %974 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %200, i32 0, i32 2
  store %FIFO* %894, %FIFO** %974
  %975 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %200 to i8*
  store i32* %thread_id66, i32** %201
  %976 = bitcast i32*** %202 to i8**
  store i32** %201, i32*** %202
  %977 = load i8*, i8** %976
  call void @pthread_create(i8* %977, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.66 to i8*), i8* %975)
  %978 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %203, i32 0, i32 0
  store %FIFO* %453, %FIFO** %978
  %979 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %203, i32 0, i32 1
  store %FIFO* %485, %FIFO** %979
  %980 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %203, i32 0, i32 2
  store %FIFO* %895, %FIFO** %980
  %981 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %203 to i8*
  store i32* %thread_id67, i32** %204
  %982 = bitcast i32*** %205 to i8**
  store i32** %204, i32*** %205
  %983 = load i8*, i8** %982
  call void @pthread_create(i8* %983, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.67 to i8*), i8* %981)
  %984 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %206, i32 0, i32 0
  store %FIFO* %454, %FIFO** %984
  %985 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %206, i32 0, i32 1
  store %FIFO* %486, %FIFO** %985
  %986 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %206, i32 0, i32 2
  store %FIFO* %896, %FIFO** %986
  %987 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %206 to i8*
  store i32* %thread_id68, i32** %207
  %988 = bitcast i32*** %208 to i8**
  store i32** %207, i32*** %208
  %989 = load i8*, i8** %988
  call void @pthread_create(i8* %989, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.68 to i8*), i8* %987)
  %990 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %209, i32 0, i32 0
  store %FIFO* %455, %FIFO** %990
  %991 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %209, i32 0, i32 1
  store %FIFO* %487, %FIFO** %991
  %992 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %209, i32 0, i32 2
  store %FIFO* %897, %FIFO** %992
  %993 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %209 to i8*
  store i32* %thread_id69, i32** %210
  %994 = bitcast i32*** %211 to i8**
  store i32** %210, i32*** %211
  %995 = load i8*, i8** %994
  call void @pthread_create(i8* %995, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.69 to i8*), i8* %993)
  %996 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %212, i32 0, i32 0
  store %FIFO* %456, %FIFO** %996
  %997 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %212, i32 0, i32 1
  store %FIFO* %488, %FIFO** %997
  %998 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %212, i32 0, i32 2
  store %FIFO* %898, %FIFO** %998
  %999 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %212 to i8*
  store i32* %thread_id70, i32** %213
  %1000 = bitcast i32*** %214 to i8**
  store i32** %213, i32*** %214
  %1001 = load i8*, i8** %1000
  call void @pthread_create(i8* %1001, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.70 to i8*), i8* %999)
  %1002 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %215, i32 0, i32 0
  store %FIFO* %457, %FIFO** %1002
  %1003 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %215, i32 0, i32 1
  store %FIFO* %489, %FIFO** %1003
  %1004 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %215, i32 0, i32 2
  store %FIFO* %899, %FIFO** %1004
  %1005 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %215 to i8*
  store i32* %thread_id71, i32** %216
  %1006 = bitcast i32*** %217 to i8**
  store i32** %216, i32*** %217
  %1007 = load i8*, i8** %1006
  call void @pthread_create(i8* %1007, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.71 to i8*), i8* %1005)
  %1008 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %218, i32 0, i32 0
  store %FIFO* %458, %FIFO** %1008
  %1009 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %218, i32 0, i32 1
  store %FIFO* %490, %FIFO** %1009
  %1010 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %218, i32 0, i32 2
  store %FIFO* %900, %FIFO** %1010
  %1011 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %218 to i8*
  store i32* %thread_id72, i32** %219
  %1012 = bitcast i32*** %220 to i8**
  store i32** %219, i32*** %220
  %1013 = load i8*, i8** %1012
  call void @pthread_create(i8* %1013, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.72 to i8*), i8* %1011)
  %1014 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %221, i32 0, i32 0
  store %FIFO* %459, %FIFO** %1014
  %1015 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %221, i32 0, i32 1
  store %FIFO* %491, %FIFO** %1015
  %1016 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %221, i32 0, i32 2
  store %FIFO* %901, %FIFO** %1016
  %1017 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %221 to i8*
  store i32* %thread_id73, i32** %222
  %1018 = bitcast i32*** %223 to i8**
  store i32** %222, i32*** %223
  %1019 = load i8*, i8** %1018
  call void @pthread_create(i8* %1019, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.73 to i8*), i8* %1017)
  %1020 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %224, i32 0, i32 0
  store %FIFO* %460, %FIFO** %1020
  %1021 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %224, i32 0, i32 1
  store %FIFO* %492, %FIFO** %1021
  %1022 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %224, i32 0, i32 2
  store %FIFO* %902, %FIFO** %1022
  %1023 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %224 to i8*
  store i32* %thread_id74, i32** %225
  %1024 = bitcast i32*** %226 to i8**
  store i32** %225, i32*** %226
  %1025 = load i8*, i8** %1024
  call void @pthread_create(i8* %1025, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.74 to i8*), i8* %1023)
  %1026 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %227, i32 0, i32 0
  store %FIFO* %461, %FIFO** %1026
  %1027 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %227, i32 0, i32 1
  store %FIFO* %493, %FIFO** %1027
  %1028 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %227, i32 0, i32 2
  store %FIFO* %903, %FIFO** %1028
  %1029 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %227 to i8*
  store i32* %thread_id75, i32** %228
  %1030 = bitcast i32*** %229 to i8**
  store i32** %228, i32*** %229
  %1031 = load i8*, i8** %1030
  call void @pthread_create(i8* %1031, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.75 to i8*), i8* %1029)
  %1032 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %230, i32 0, i32 0
  store %FIFO* %462, %FIFO** %1032
  %1033 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %230, i32 0, i32 1
  store %FIFO* %494, %FIFO** %1033
  %1034 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %230, i32 0, i32 2
  store %FIFO* %904, %FIFO** %1034
  %1035 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %230 to i8*
  store i32* %thread_id76, i32** %231
  %1036 = bitcast i32*** %232 to i8**
  store i32** %231, i32*** %232
  %1037 = load i8*, i8** %1036
  call void @pthread_create(i8* %1037, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.76 to i8*), i8* %1035)
  %1038 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %233, i32 0, i32 0
  store %FIFO* %463, %FIFO** %1038
  %1039 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %233, i32 0, i32 1
  store %FIFO* %495, %FIFO** %1039
  %1040 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %233, i32 0, i32 2
  store %FIFO* %905, %FIFO** %1040
  %1041 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %233 to i8*
  store i32* %thread_id77, i32** %234
  %1042 = bitcast i32*** %235 to i8**
  store i32** %234, i32*** %235
  %1043 = load i8*, i8** %1042
  call void @pthread_create(i8* %1043, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.77 to i8*), i8* %1041)
  %1044 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %236, i32 0, i32 0
  store %FIFO* %464, %FIFO** %1044
  %1045 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %236, i32 0, i32 1
  store %FIFO* %496, %FIFO** %1045
  %1046 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %236, i32 0, i32 2
  store %FIFO* %906, %FIFO** %1046
  %1047 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %236 to i8*
  store i32* %thread_id78, i32** %237
  %1048 = bitcast i32*** %238 to i8**
  store i32** %237, i32*** %238
  %1049 = load i8*, i8** %1048
  call void @pthread_create(i8* %1049, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.78 to i8*), i8* %1047)
  %1050 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %239, i32 0, i32 0
  store %FIFO* %465, %FIFO** %1050
  %1051 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %239, i32 0, i32 1
  store %FIFO* %497, %FIFO** %1051
  %1052 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %239, i32 0, i32 2
  store %FIFO* %907, %FIFO** %1052
  %1053 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %239 to i8*
  store i32* %thread_id79, i32** %240
  %1054 = bitcast i32*** %241 to i8**
  store i32** %240, i32*** %241
  %1055 = load i8*, i8** %1054
  call void @pthread_create(i8* %1055, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.79 to i8*), i8* %1053)
  %1056 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %242, i32 0, i32 0
  store %FIFO* %466, %FIFO** %1056
  %1057 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %242, i32 0, i32 1
  store %FIFO* %498, %FIFO** %1057
  %1058 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %242, i32 0, i32 2
  store %FIFO* %908, %FIFO** %1058
  %1059 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %242 to i8*
  store i32* %thread_id80, i32** %243
  %1060 = bitcast i32*** %244 to i8**
  store i32** %243, i32*** %244
  %1061 = load i8*, i8** %1060
  call void @pthread_create(i8* %1061, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.80 to i8*), i8* %1059)
  %1062 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %245, i32 0, i32 0
  store %FIFO* %467, %FIFO** %1062
  %1063 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %245, i32 0, i32 1
  store %FIFO* %499, %FIFO** %1063
  %1064 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %245, i32 0, i32 2
  store %FIFO* %909, %FIFO** %1064
  %1065 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %245 to i8*
  store i32* %thread_id81, i32** %246
  %1066 = bitcast i32*** %247 to i8**
  store i32** %246, i32*** %247
  %1067 = load i8*, i8** %1066
  call void @pthread_create(i8* %1067, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.81 to i8*), i8* %1065)
  %1068 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %248, i32 0, i32 0
  store %FIFO* %468, %FIFO** %1068
  %1069 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %248, i32 0, i32 1
  store %FIFO* %500, %FIFO** %1069
  %1070 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %248, i32 0, i32 2
  store %FIFO* %910, %FIFO** %1070
  %1071 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %248 to i8*
  store i32* %thread_id82, i32** %249
  %1072 = bitcast i32*** %250 to i8**
  store i32** %249, i32*** %250
  %1073 = load i8*, i8** %1072
  call void @pthread_create(i8* %1073, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.82 to i8*), i8* %1071)
  %1074 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %251, i32 0, i32 0
  store %FIFO* %469, %FIFO** %1074
  %1075 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %251, i32 0, i32 1
  store %FIFO* %501, %FIFO** %1075
  %1076 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %251, i32 0, i32 2
  store %FIFO* %911, %FIFO** %1076
  %1077 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %251 to i8*
  store i32* %thread_id83, i32** %252
  %1078 = bitcast i32*** %253 to i8**
  store i32** %252, i32*** %253
  %1079 = load i8*, i8** %1078
  call void @pthread_create(i8* %1079, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.83 to i8*), i8* %1077)
  %1080 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %254, i32 0, i32 0
  store %FIFO* %470, %FIFO** %1080
  %1081 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %254, i32 0, i32 1
  store %FIFO* %502, %FIFO** %1081
  %1082 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %254, i32 0, i32 2
  store %FIFO* %912, %FIFO** %1082
  %1083 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %254 to i8*
  store i32* %thread_id84, i32** %255
  %1084 = bitcast i32*** %256 to i8**
  store i32** %255, i32*** %256
  %1085 = load i8*, i8** %1084
  call void @pthread_create(i8* %1085, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.84 to i8*), i8* %1083)
  %1086 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %257, i32 0, i32 0
  store %FIFO* %471, %FIFO** %1086
  %1087 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %257, i32 0, i32 1
  store %FIFO* %503, %FIFO** %1087
  %1088 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %257, i32 0, i32 2
  store %FIFO* %913, %FIFO** %1088
  %1089 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %257 to i8*
  store i32* %thread_id85, i32** %258
  %1090 = bitcast i32*** %259 to i8**
  store i32** %258, i32*** %259
  %1091 = load i8*, i8** %1090
  call void @pthread_create(i8* %1091, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.85 to i8*), i8* %1089)
  %1092 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %260, i32 0, i32 0
  store %FIFO* %472, %FIFO** %1092
  %1093 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %260, i32 0, i32 1
  store %FIFO* %504, %FIFO** %1093
  %1094 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %260, i32 0, i32 2
  store %FIFO* %914, %FIFO** %1094
  %1095 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %260 to i8*
  store i32* %thread_id86, i32** %261
  %1096 = bitcast i32*** %262 to i8**
  store i32** %261, i32*** %262
  %1097 = load i8*, i8** %1096
  call void @pthread_create(i8* %1097, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.86 to i8*), i8* %1095)
  %1098 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %263, i32 0, i32 0
  store %FIFO* %473, %FIFO** %1098
  %1099 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %263, i32 0, i32 1
  store %FIFO* %505, %FIFO** %1099
  %1100 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %263, i32 0, i32 2
  store %FIFO* %915, %FIFO** %1100
  %1101 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %263 to i8*
  store i32* %thread_id87, i32** %264
  %1102 = bitcast i32*** %265 to i8**
  store i32** %264, i32*** %265
  %1103 = load i8*, i8** %1102
  call void @pthread_create(i8* %1103, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.87 to i8*), i8* %1101)
  %1104 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %266, i32 0, i32 0
  store %FIFO* %474, %FIFO** %1104
  %1105 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %266, i32 0, i32 1
  store %FIFO* %506, %FIFO** %1105
  %1106 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %266, i32 0, i32 2
  store %FIFO* %916, %FIFO** %1106
  %1107 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %266 to i8*
  store i32* %thread_id88, i32** %267
  %1108 = bitcast i32*** %268 to i8**
  store i32** %267, i32*** %268
  %1109 = load i8*, i8** %1108
  call void @pthread_create(i8* %1109, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.88 to i8*), i8* %1107)
  %1110 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %269, i32 0, i32 0
  store %FIFO* %475, %FIFO** %1110
  %1111 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %269, i32 0, i32 1
  store %FIFO* %507, %FIFO** %1111
  %1112 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %269, i32 0, i32 2
  store %FIFO* %917, %FIFO** %1112
  %1113 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %269 to i8*
  store i32* %thread_id89, i32** %270
  %1114 = bitcast i32*** %271 to i8**
  store i32** %270, i32*** %271
  %1115 = load i8*, i8** %1114
  call void @pthread_create(i8* %1115, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.89 to i8*), i8* %1113)
  %1116 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %272, i32 0, i32 0
  store %FIFO* %476, %FIFO** %1116
  %1117 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %272, i32 0, i32 1
  store %FIFO* %508, %FIFO** %1117
  %1118 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %272, i32 0, i32 2
  store %FIFO* %918, %FIFO** %1118
  %1119 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %272 to i8*
  store i32* %thread_id90, i32** %273
  %1120 = bitcast i32*** %274 to i8**
  store i32** %273, i32*** %274
  %1121 = load i8*, i8** %1120
  call void @pthread_create(i8* %1121, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.90 to i8*), i8* %1119)
  %1122 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %275, i32 0, i32 0
  store %FIFO* %477, %FIFO** %1122
  %1123 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %275, i32 0, i32 1
  store %FIFO* %509, %FIFO** %1123
  %1124 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %275, i32 0, i32 2
  store %FIFO* %919, %FIFO** %1124
  %1125 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %275 to i8*
  store i32* %thread_id91, i32** %276
  %1126 = bitcast i32*** %277 to i8**
  store i32** %276, i32*** %277
  %1127 = load i8*, i8** %1126
  call void @pthread_create(i8* %1127, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.91 to i8*), i8* %1125)
  %1128 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %278, i32 0, i32 0
  store %FIFO* %478, %FIFO** %1128
  %1129 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %278, i32 0, i32 1
  store %FIFO* %510, %FIFO** %1129
  %1130 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %278, i32 0, i32 2
  store %FIFO* %920, %FIFO** %1130
  %1131 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %278 to i8*
  store i32* %thread_id92, i32** %279
  %1132 = bitcast i32*** %280 to i8**
  store i32** %279, i32*** %280
  %1133 = load i8*, i8** %1132
  call void @pthread_create(i8* %1133, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.92 to i8*), i8* %1131)
  %1134 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %281, i32 0, i32 0
  store %FIFO* %479, %FIFO** %1134
  %1135 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %281, i32 0, i32 1
  store %FIFO* %511, %FIFO** %1135
  %1136 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %281, i32 0, i32 2
  store %FIFO* %921, %FIFO** %1136
  %1137 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %281 to i8*
  store i32* %thread_id93, i32** %282
  %1138 = bitcast i32*** %283 to i8**
  store i32** %282, i32*** %283
  %1139 = load i8*, i8** %1138
  call void @pthread_create(i8* %1139, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.93 to i8*), i8* %1137)
  %1140 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %284, i32 0, i32 0
  store %FIFO* %480, %FIFO** %1140
  %1141 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %284, i32 0, i32 1
  store %FIFO* %512, %FIFO** %1141
  %1142 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %284, i32 0, i32 2
  store %FIFO* %922, %FIFO** %1142
  %1143 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %284 to i8*
  store i32* %thread_id94, i32** %285
  %1144 = bitcast i32*** %286 to i8**
  store i32** %285, i32*** %286
  %1145 = load i8*, i8** %1144
  call void @pthread_create(i8* %1145, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.94 to i8*), i8* %1143)
  %1146 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %287, i32 0, i32 0
  store %FIFO* %891, %FIFO** %1146
  %1147 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %287, i32 0, i32 1
  store %FIFO* %907, %FIFO** %1147
  %1148 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %287, i32 0, i32 2
  store %FIFO* %923, %FIFO** %1148
  %1149 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %287 to i8*
  store i32* %thread_id95, i32** %288
  %1150 = bitcast i32*** %289 to i8**
  store i32** %288, i32*** %289
  %1151 = load i8*, i8** %1150
  call void @pthread_create(i8* %1151, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.95 to i8*), i8* %1149)
  %1152 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %290, i32 0, i32 0
  store %FIFO* %892, %FIFO** %1152
  %1153 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %290, i32 0, i32 1
  store %FIFO* %908, %FIFO** %1153
  %1154 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %290, i32 0, i32 2
  store %FIFO* %924, %FIFO** %1154
  %1155 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %290 to i8*
  store i32* %thread_id96, i32** %291
  %1156 = bitcast i32*** %292 to i8**
  store i32** %291, i32*** %292
  %1157 = load i8*, i8** %1156
  call void @pthread_create(i8* %1157, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.96 to i8*), i8* %1155)
  %1158 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %293, i32 0, i32 0
  store %FIFO* %893, %FIFO** %1158
  %1159 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %293, i32 0, i32 1
  store %FIFO* %909, %FIFO** %1159
  %1160 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %293, i32 0, i32 2
  store %FIFO* %925, %FIFO** %1160
  %1161 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %293 to i8*
  store i32* %thread_id97, i32** %294
  %1162 = bitcast i32*** %295 to i8**
  store i32** %294, i32*** %295
  %1163 = load i8*, i8** %1162
  call void @pthread_create(i8* %1163, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.97 to i8*), i8* %1161)
  %1164 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %296, i32 0, i32 0
  store %FIFO* %894, %FIFO** %1164
  %1165 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %296, i32 0, i32 1
  store %FIFO* %910, %FIFO** %1165
  %1166 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %296, i32 0, i32 2
  store %FIFO* %926, %FIFO** %1166
  %1167 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %296 to i8*
  store i32* %thread_id98, i32** %297
  %1168 = bitcast i32*** %298 to i8**
  store i32** %297, i32*** %298
  %1169 = load i8*, i8** %1168
  call void @pthread_create(i8* %1169, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.98 to i8*), i8* %1167)
  %1170 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %299, i32 0, i32 0
  store %FIFO* %895, %FIFO** %1170
  %1171 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %299, i32 0, i32 1
  store %FIFO* %911, %FIFO** %1171
  %1172 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %299, i32 0, i32 2
  store %FIFO* %927, %FIFO** %1172
  %1173 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %299 to i8*
  store i32* %thread_id99, i32** %300
  %1174 = bitcast i32*** %301 to i8**
  store i32** %300, i32*** %301
  %1175 = load i8*, i8** %1174
  call void @pthread_create(i8* %1175, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.99 to i8*), i8* %1173)
  %1176 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %302, i32 0, i32 0
  store %FIFO* %896, %FIFO** %1176
  %1177 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %302, i32 0, i32 1
  store %FIFO* %912, %FIFO** %1177
  %1178 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %302, i32 0, i32 2
  store %FIFO* %928, %FIFO** %1178
  %1179 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %302 to i8*
  store i32* %thread_id100, i32** %303
  %1180 = bitcast i32*** %304 to i8**
  store i32** %303, i32*** %304
  %1181 = load i8*, i8** %1180
  call void @pthread_create(i8* %1181, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.100 to i8*), i8* %1179)
  %1182 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %305, i32 0, i32 0
  store %FIFO* %897, %FIFO** %1182
  %1183 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %305, i32 0, i32 1
  store %FIFO* %913, %FIFO** %1183
  %1184 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %305, i32 0, i32 2
  store %FIFO* %929, %FIFO** %1184
  %1185 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %305 to i8*
  store i32* %thread_id101, i32** %306
  %1186 = bitcast i32*** %307 to i8**
  store i32** %306, i32*** %307
  %1187 = load i8*, i8** %1186
  call void @pthread_create(i8* %1187, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.101 to i8*), i8* %1185)
  %1188 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %308, i32 0, i32 0
  store %FIFO* %898, %FIFO** %1188
  %1189 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %308, i32 0, i32 1
  store %FIFO* %914, %FIFO** %1189
  %1190 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %308, i32 0, i32 2
  store %FIFO* %930, %FIFO** %1190
  %1191 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %308 to i8*
  store i32* %thread_id102, i32** %309
  %1192 = bitcast i32*** %310 to i8**
  store i32** %309, i32*** %310
  %1193 = load i8*, i8** %1192
  call void @pthread_create(i8* %1193, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.102 to i8*), i8* %1191)
  %1194 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %311, i32 0, i32 0
  store %FIFO* %899, %FIFO** %1194
  %1195 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %311, i32 0, i32 1
  store %FIFO* %915, %FIFO** %1195
  %1196 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %311, i32 0, i32 2
  store %FIFO* %931, %FIFO** %1196
  %1197 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %311 to i8*
  store i32* %thread_id103, i32** %312
  %1198 = bitcast i32*** %313 to i8**
  store i32** %312, i32*** %313
  %1199 = load i8*, i8** %1198
  call void @pthread_create(i8* %1199, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.103 to i8*), i8* %1197)
  %1200 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %314, i32 0, i32 0
  store %FIFO* %900, %FIFO** %1200
  %1201 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %314, i32 0, i32 1
  store %FIFO* %916, %FIFO** %1201
  %1202 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %314, i32 0, i32 2
  store %FIFO* %932, %FIFO** %1202
  %1203 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %314 to i8*
  store i32* %thread_id104, i32** %315
  %1204 = bitcast i32*** %316 to i8**
  store i32** %315, i32*** %316
  %1205 = load i8*, i8** %1204
  call void @pthread_create(i8* %1205, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.104 to i8*), i8* %1203)
  %1206 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %317, i32 0, i32 0
  store %FIFO* %901, %FIFO** %1206
  %1207 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %317, i32 0, i32 1
  store %FIFO* %917, %FIFO** %1207
  %1208 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %317, i32 0, i32 2
  store %FIFO* %933, %FIFO** %1208
  %1209 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %317 to i8*
  store i32* %thread_id105, i32** %318
  %1210 = bitcast i32*** %319 to i8**
  store i32** %318, i32*** %319
  %1211 = load i8*, i8** %1210
  call void @pthread_create(i8* %1211, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.105 to i8*), i8* %1209)
  %1212 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %320, i32 0, i32 0
  store %FIFO* %902, %FIFO** %1212
  %1213 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %320, i32 0, i32 1
  store %FIFO* %918, %FIFO** %1213
  %1214 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %320, i32 0, i32 2
  store %FIFO* %934, %FIFO** %1214
  %1215 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %320 to i8*
  store i32* %thread_id106, i32** %321
  %1216 = bitcast i32*** %322 to i8**
  store i32** %321, i32*** %322
  %1217 = load i8*, i8** %1216
  call void @pthread_create(i8* %1217, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.106 to i8*), i8* %1215)
  %1218 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %323, i32 0, i32 0
  store %FIFO* %903, %FIFO** %1218
  %1219 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %323, i32 0, i32 1
  store %FIFO* %919, %FIFO** %1219
  %1220 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %323, i32 0, i32 2
  store %FIFO* %935, %FIFO** %1220
  %1221 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %323 to i8*
  store i32* %thread_id107, i32** %324
  %1222 = bitcast i32*** %325 to i8**
  store i32** %324, i32*** %325
  %1223 = load i8*, i8** %1222
  call void @pthread_create(i8* %1223, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.107 to i8*), i8* %1221)
  %1224 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %326, i32 0, i32 0
  store %FIFO* %904, %FIFO** %1224
  %1225 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %326, i32 0, i32 1
  store %FIFO* %920, %FIFO** %1225
  %1226 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %326, i32 0, i32 2
  store %FIFO* %936, %FIFO** %1226
  %1227 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %326 to i8*
  store i32* %thread_id108, i32** %327
  %1228 = bitcast i32*** %328 to i8**
  store i32** %327, i32*** %328
  %1229 = load i8*, i8** %1228
  call void @pthread_create(i8* %1229, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.108 to i8*), i8* %1227)
  %1230 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %329, i32 0, i32 0
  store %FIFO* %905, %FIFO** %1230
  %1231 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %329, i32 0, i32 1
  store %FIFO* %921, %FIFO** %1231
  %1232 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %329, i32 0, i32 2
  store %FIFO* %937, %FIFO** %1232
  %1233 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %329 to i8*
  store i32* %thread_id109, i32** %330
  %1234 = bitcast i32*** %331 to i8**
  store i32** %330, i32*** %331
  %1235 = load i8*, i8** %1234
  call void @pthread_create(i8* %1235, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.109 to i8*), i8* %1233)
  %1236 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %332, i32 0, i32 0
  store %FIFO* %906, %FIFO** %1236
  %1237 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %332, i32 0, i32 1
  store %FIFO* %922, %FIFO** %1237
  %1238 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %332, i32 0, i32 2
  store %FIFO* %938, %FIFO** %1238
  %1239 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %332 to i8*
  store i32* %thread_id110, i32** %333
  %1240 = bitcast i32*** %334 to i8**
  store i32** %333, i32*** %334
  %1241 = load i8*, i8** %1240
  call void @pthread_create(i8* %1241, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.110 to i8*), i8* %1239)
  %1242 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %335, i32 0, i32 0
  store %FIFO* %923, %FIFO** %1242
  %1243 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %335, i32 0, i32 1
  store %FIFO* %931, %FIFO** %1243
  %1244 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %335, i32 0, i32 2
  store %FIFO* %939, %FIFO** %1244
  %1245 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %335 to i8*
  store i32* %thread_id111, i32** %336
  %1246 = bitcast i32*** %337 to i8**
  store i32** %336, i32*** %337
  %1247 = load i8*, i8** %1246
  call void @pthread_create(i8* %1247, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.111 to i8*), i8* %1245)
  %1248 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %338, i32 0, i32 0
  store %FIFO* %924, %FIFO** %1248
  %1249 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %338, i32 0, i32 1
  store %FIFO* %932, %FIFO** %1249
  %1250 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %338, i32 0, i32 2
  store %FIFO* %940, %FIFO** %1250
  %1251 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %338 to i8*
  store i32* %thread_id112, i32** %339
  %1252 = bitcast i32*** %340 to i8**
  store i32** %339, i32*** %340
  %1253 = load i8*, i8** %1252
  call void @pthread_create(i8* %1253, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.112 to i8*), i8* %1251)
  %1254 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %341, i32 0, i32 0
  store %FIFO* %925, %FIFO** %1254
  %1255 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %341, i32 0, i32 1
  store %FIFO* %933, %FIFO** %1255
  %1256 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %341, i32 0, i32 2
  store %FIFO* %941, %FIFO** %1256
  %1257 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %341 to i8*
  store i32* %thread_id113, i32** %342
  %1258 = bitcast i32*** %343 to i8**
  store i32** %342, i32*** %343
  %1259 = load i8*, i8** %1258
  call void @pthread_create(i8* %1259, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.113 to i8*), i8* %1257)
  %1260 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %344, i32 0, i32 0
  store %FIFO* %926, %FIFO** %1260
  %1261 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %344, i32 0, i32 1
  store %FIFO* %934, %FIFO** %1261
  %1262 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %344, i32 0, i32 2
  store %FIFO* %942, %FIFO** %1262
  %1263 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %344 to i8*
  store i32* %thread_id114, i32** %345
  %1264 = bitcast i32*** %346 to i8**
  store i32** %345, i32*** %346
  %1265 = load i8*, i8** %1264
  call void @pthread_create(i8* %1265, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.114 to i8*), i8* %1263)
  %1266 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %347, i32 0, i32 0
  store %FIFO* %927, %FIFO** %1266
  %1267 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %347, i32 0, i32 1
  store %FIFO* %935, %FIFO** %1267
  %1268 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %347, i32 0, i32 2
  store %FIFO* %943, %FIFO** %1268
  %1269 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %347 to i8*
  store i32* %thread_id115, i32** %348
  %1270 = bitcast i32*** %349 to i8**
  store i32** %348, i32*** %349
  %1271 = load i8*, i8** %1270
  call void @pthread_create(i8* %1271, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.115 to i8*), i8* %1269)
  %1272 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %350, i32 0, i32 0
  store %FIFO* %928, %FIFO** %1272
  %1273 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %350, i32 0, i32 1
  store %FIFO* %936, %FIFO** %1273
  %1274 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %350, i32 0, i32 2
  store %FIFO* %944, %FIFO** %1274
  %1275 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %350 to i8*
  store i32* %thread_id116, i32** %351
  %1276 = bitcast i32*** %352 to i8**
  store i32** %351, i32*** %352
  %1277 = load i8*, i8** %1276
  call void @pthread_create(i8* %1277, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.116 to i8*), i8* %1275)
  %1278 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %353, i32 0, i32 0
  store %FIFO* %929, %FIFO** %1278
  %1279 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %353, i32 0, i32 1
  store %FIFO* %937, %FIFO** %1279
  %1280 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %353, i32 0, i32 2
  store %FIFO* %945, %FIFO** %1280
  %1281 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %353 to i8*
  store i32* %thread_id117, i32** %354
  %1282 = bitcast i32*** %355 to i8**
  store i32** %354, i32*** %355
  %1283 = load i8*, i8** %1282
  call void @pthread_create(i8* %1283, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.117 to i8*), i8* %1281)
  %1284 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %356, i32 0, i32 0
  store %FIFO* %930, %FIFO** %1284
  %1285 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %356, i32 0, i32 1
  store %FIFO* %938, %FIFO** %1285
  %1286 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %356, i32 0, i32 2
  store %FIFO* %946, %FIFO** %1286
  %1287 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %356 to i8*
  store i32* %thread_id118, i32** %357
  %1288 = bitcast i32*** %358 to i8**
  store i32** %357, i32*** %358
  %1289 = load i8*, i8** %1288
  call void @pthread_create(i8* %1289, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.118 to i8*), i8* %1287)
  %1290 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %359, i32 0, i32 0
  store %FIFO* %939, %FIFO** %1290
  %1291 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %359, i32 0, i32 1
  store %FIFO* %943, %FIFO** %1291
  %1292 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %359, i32 0, i32 2
  store %FIFO* %947, %FIFO** %1292
  %1293 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %359 to i8*
  store i32* %thread_id119, i32** %360
  %1294 = bitcast i32*** %361 to i8**
  store i32** %360, i32*** %361
  %1295 = load i8*, i8** %1294
  call void @pthread_create(i8* %1295, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.119 to i8*), i8* %1293)
  %1296 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %362, i32 0, i32 0
  store %FIFO* %940, %FIFO** %1296
  %1297 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %362, i32 0, i32 1
  store %FIFO* %944, %FIFO** %1297
  %1298 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %362, i32 0, i32 2
  store %FIFO* %948, %FIFO** %1298
  %1299 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %362 to i8*
  store i32* %thread_id120, i32** %363
  %1300 = bitcast i32*** %364 to i8**
  store i32** %363, i32*** %364
  %1301 = load i8*, i8** %1300
  call void @pthread_create(i8* %1301, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.120 to i8*), i8* %1299)
  %1302 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %365, i32 0, i32 0
  store %FIFO* %941, %FIFO** %1302
  %1303 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %365, i32 0, i32 1
  store %FIFO* %945, %FIFO** %1303
  %1304 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %365, i32 0, i32 2
  store %FIFO* %949, %FIFO** %1304
  %1305 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %365 to i8*
  store i32* %thread_id121, i32** %366
  %1306 = bitcast i32*** %367 to i8**
  store i32** %366, i32*** %367
  %1307 = load i8*, i8** %1306
  call void @pthread_create(i8* %1307, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.121 to i8*), i8* %1305)
  %1308 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %368, i32 0, i32 0
  store %FIFO* %942, %FIFO** %1308
  %1309 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %368, i32 0, i32 1
  store %FIFO* %946, %FIFO** %1309
  %1310 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %368, i32 0, i32 2
  store %FIFO* %950, %FIFO** %1310
  %1311 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %368 to i8*
  store i32* %thread_id122, i32** %369
  %1312 = bitcast i32*** %370 to i8**
  store i32** %369, i32*** %370
  %1313 = load i8*, i8** %1312
  call void @pthread_create(i8* %1313, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.122 to i8*), i8* %1311)
  %1314 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %371, i32 0, i32 0
  store %FIFO* %947, %FIFO** %1314
  %1315 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %371, i32 0, i32 1
  store %FIFO* %949, %FIFO** %1315
  %1316 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %371, i32 0, i32 2
  store %FIFO* %951, %FIFO** %1316
  %1317 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %371 to i8*
  store i32* %thread_id123, i32** %372
  %1318 = bitcast i32*** %373 to i8**
  store i32** %372, i32*** %373
  %1319 = load i8*, i8** %1318
  call void @pthread_create(i8* %1319, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.123 to i8*), i8* %1317)
  %1320 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %374, i32 0, i32 0
  store %FIFO* %948, %FIFO** %1320
  %1321 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %374, i32 0, i32 1
  store %FIFO* %950, %FIFO** %1321
  %1322 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %374, i32 0, i32 2
  store %FIFO* %952, %FIFO** %1322
  %1323 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %374 to i8*
  store i32* %thread_id124, i32** %375
  %1324 = bitcast i32*** %376 to i8**
  store i32** %375, i32*** %376
  %1325 = load i8*, i8** %1324
  call void @pthread_create(i8* %1325, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.124 to i8*), i8* %1323)
  %1326 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %377, i32 0, i32 0
  store %FIFO* %951, %FIFO** %1326
  %1327 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %377, i32 0, i32 1
  store %FIFO* %952, %FIFO** %1327
  %1328 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %377, i32 0, i32 2
  store %FIFO* %953, %FIFO** %1328
  %1329 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %377 to i8*
  store i32* %thread_id125, i32** %378
  %1330 = bitcast i32*** %379 to i8**
  store i32** %378, i32*** %379
  %1331 = load i8*, i8** %1330
  call void @pthread_create(i8* %1331, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.125 to i8*), i8* %1329)
  %1332 = bitcast [64 x i64]* %380 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %1332, i8* bitcast ([64 x i64]* @main.input to i8*), i64 512, i32 1, i1 false)
  br label %.1.rangeindex.loop

.1.rangeindex.loop:                               ; preds = %.2.rangeindex.body, %.0.entry
  %1333 = phi i64 [ -1, %.0.entry ], [ %1334, %.2.rangeindex.body ]
  %1334 = add i64 %1333, 1
  %1335 = icmp slt i64 %1334, 64
  %1336 = zext i1 %1335 to i8
  %1337 = trunc i8 %1336 to i1
  br i1 %1337, label %.2.rangeindex.body, label %.3.rangeindex.done

.2.rangeindex.body:                               ; preds = %.1.rangeindex.loop
  %1338 = getelementptr [64 x i64], [64 x i64]* %380, i64 0, i64 %1334
  %1339 = load i64, i64* %1338
  call void @fifo_write(%FIFO* %386, i64 %1339)
  br label %.1.rangeindex.loop

.3.rangeindex.done:                               ; preds = %.1.rangeindex.loop
  call void @fifo_write(%FIFO* %386, i64 -1)
  %1340 = bitcast [64 x i64]* %381 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %1340, i8* bitcast ([64 x i64]* @main.input to i8*), i64 512, i32 1, i1 false)
  br label %.4.rangeindex.loop

.4.rangeindex.loop:                               ; preds = %.5.rangeindex.body, %.3.rangeindex.done
  %1341 = phi i64 [ -1, %.3.rangeindex.done ], [ %1342, %.5.rangeindex.body ]
  %1342 = add i64 %1341, 1
  %1343 = icmp slt i64 %1342, 64
  %1344 = zext i1 %1343 to i8
  %1345 = trunc i8 %1344 to i1
  br i1 %1345, label %.5.rangeindex.body, label %.6.rangeindex.done

.5.rangeindex.body:                               ; preds = %.4.rangeindex.loop
  %1346 = bitcast i8* %384 to i64*
  %1347 = getelementptr i64, i64* %1346, i64 %1342
  %1348 = bitcast i64* %1347 to i8*
  %1349 = call i64 @fifo_read(%FIFO* %953)
  store i64 %1349, i64* %382
  %1350 = load i64, i64* %382
  %1351 = bitcast i8* %1348 to i64*
  store i64 %1350, i64* %1351
  %1352 = bitcast i8* %384 to i64*
  %1353 = getelementptr i64, i64* %1352, i64 %1342
  %1354 = bitcast i64* %1353 to i8*
  %1355 = bitcast i8* %1354 to i64*
  %1356 = load i64, i64* %1355
  br label %.4.rangeindex.loop

.6.rangeindex.done:                               ; preds = %.4.rangeindex.loop
  %1357 = bitcast i8* %384 to [64 x i64]*
  %1358 = load [64 x i64], [64 x i64]* %1357
  store [64 x i64] %1358, [64 x i64]* %383
  call void @main.checkSort(i8* nest undef, [64 x i64]* byval %383)
  ret void
}

define internal void @0(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper(i8*) #1 {
entry:
  call void @0(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @1(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.1(i8*) #1 {
entry:
  call void @1(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @2(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.2(i8*) #1 {
entry:
  call void @2(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @3(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.3(i8*) #1 {
entry:
  call void @3(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @4(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.4(i8*) #1 {
entry:
  call void @4(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @5(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.5(i8*) #1 {
entry:
  call void @5(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @6(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.6(i8*) #1 {
entry:
  call void @6(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @7(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.7(i8*) #1 {
entry:
  call void @7(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @8(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.8(i8*) #1 {
entry:
  call void @8(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @9(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.9(i8*) #1 {
entry:
  call void @9(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @10(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.10(i8*) #1 {
entry:
  call void @10(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @11(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.11(i8*) #1 {
entry:
  call void @11(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @12(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.12(i8*) #1 {
entry:
  call void @12(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @13(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.13(i8*) #1 {
entry:
  call void @13(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @14(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.14(i8*) #1 {
entry:
  call void @14(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @15(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.15(i8*) #1 {
entry:
  call void @15(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @16(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.16(i8*) #1 {
entry:
  call void @16(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @17(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.17(i8*) #1 {
entry:
  call void @17(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @18(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.18(i8*) #1 {
entry:
  call void @18(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @19(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.19(i8*) #1 {
entry:
  call void @19(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @20(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.20(i8*) #1 {
entry:
  call void @20(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @21(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.21(i8*) #1 {
entry:
  call void @21(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @22(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.22(i8*) #1 {
entry:
  call void @22(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @23(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.23(i8*) #1 {
entry:
  call void @23(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @24(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.24(i8*) #1 {
entry:
  call void @24(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @25(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.25(i8*) #1 {
entry:
  call void @25(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @26(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.26(i8*) #1 {
entry:
  call void @26(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @27(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.27(i8*) #1 {
entry:
  call void @27(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @28(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.28(i8*) #1 {
entry:
  call void @28(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @29(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.29(i8*) #1 {
entry:
  call void @29(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @30(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.30(i8*) #1 {
entry:
  call void @30(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @31(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.31(i8*) #1 {
entry:
  call void @31(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @32(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.32(i8*) #1 {
entry:
  call void @32(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @33(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.33(i8*) #1 {
entry:
  call void @33(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @34(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.34(i8*) #1 {
entry:
  call void @34(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @35(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.35(i8*) #1 {
entry:
  call void @35(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @36(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.36(i8*) #1 {
entry:
  call void @36(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @37(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.37(i8*) #1 {
entry:
  call void @37(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @38(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.38(i8*) #1 {
entry:
  call void @38(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @39(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.39(i8*) #1 {
entry:
  call void @39(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @40(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.40(i8*) #1 {
entry:
  call void @40(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @41(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.41(i8*) #1 {
entry:
  call void @41(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @42(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.42(i8*) #1 {
entry:
  call void @42(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @43(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.43(i8*) #1 {
entry:
  call void @43(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @44(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.44(i8*) #1 {
entry:
  call void @44(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @45(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.45(i8*) #1 {
entry:
  call void @45(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @46(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.46(i8*) #1 {
entry:
  call void @46(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @47(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.47(i8*) #1 {
entry:
  call void @47(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @48(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.48(i8*) #1 {
entry:
  call void @48(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @49(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.49(i8*) #1 {
entry:
  call void @49(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @50(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.50(i8*) #1 {
entry:
  call void @50(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @51(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.51(i8*) #1 {
entry:
  call void @51(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @52(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.52(i8*) #1 {
entry:
  call void @52(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @53(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.53(i8*) #1 {
entry:
  call void @53(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @54(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.54(i8*) #1 {
entry:
  call void @54(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @55(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.55(i8*) #1 {
entry:
  call void @55(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @56(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.56(i8*) #1 {
entry:
  call void @56(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @57(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.57(i8*) #1 {
entry:
  call void @57(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @58(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.58(i8*) #1 {
entry:
  call void @58(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @59(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.59(i8*) #1 {
entry:
  call void @59(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @60(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.60(i8*) #1 {
entry:
  call void @60(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @61(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.61(i8*) #1 {
entry:
  call void @61(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @62(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.62(i8*) #1 {
entry:
  call void @62(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @63(i8*) #1 {
prologue:
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

define internal void @main.merge(i8* nest, %FIFO* %in_left, %FIFO* %in_right, %FIFO* %out) #1 {
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

define internal i8* @auto_pthread_wrapper.63(i8*) #1 {
entry:
  call void @63(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @64(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.64(i8*) #1 {
entry:
  call void @64(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @65(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.65(i8*) #1 {
entry:
  call void @65(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @66(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.66(i8*) #1 {
entry:
  call void @66(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @67(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.67(i8*) #1 {
entry:
  call void @67(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @68(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.68(i8*) #1 {
entry:
  call void @68(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @69(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.69(i8*) #1 {
entry:
  call void @69(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @70(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.70(i8*) #1 {
entry:
  call void @70(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @71(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.71(i8*) #1 {
entry:
  call void @71(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @72(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.72(i8*) #1 {
entry:
  call void @72(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @73(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.73(i8*) #1 {
entry:
  call void @73(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @74(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.74(i8*) #1 {
entry:
  call void @74(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @75(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.75(i8*) #1 {
entry:
  call void @75(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @76(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.76(i8*) #1 {
entry:
  call void @76(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @77(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.77(i8*) #1 {
entry:
  call void @77(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @78(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.78(i8*) #1 {
entry:
  call void @78(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @79(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.79(i8*) #1 {
entry:
  call void @79(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @80(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.80(i8*) #1 {
entry:
  call void @80(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @81(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.81(i8*) #1 {
entry:
  call void @81(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @82(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.82(i8*) #1 {
entry:
  call void @82(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @83(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.83(i8*) #1 {
entry:
  call void @83(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @84(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.84(i8*) #1 {
entry:
  call void @84(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @85(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.85(i8*) #1 {
entry:
  call void @85(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @86(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.86(i8*) #1 {
entry:
  call void @86(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @87(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.87(i8*) #1 {
entry:
  call void @87(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @88(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.88(i8*) #1 {
entry:
  call void @88(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @89(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.89(i8*) #1 {
entry:
  call void @89(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @90(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.90(i8*) #1 {
entry:
  call void @90(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @91(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.91(i8*) #1 {
entry:
  call void @91(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @92(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.92(i8*) #1 {
entry:
  call void @92(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @93(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.93(i8*) #1 {
entry:
  call void @93(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @94(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.94(i8*) #1 {
entry:
  call void @94(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @95(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.95(i8*) #1 {
entry:
  call void @95(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @96(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.96(i8*) #1 {
entry:
  call void @96(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @97(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.97(i8*) #1 {
entry:
  call void @97(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @98(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.98(i8*) #1 {
entry:
  call void @98(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @99(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.99(i8*) #1 {
entry:
  call void @99(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @100(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.100(i8*) #1 {
entry:
  call void @100(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @101(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.101(i8*) #1 {
entry:
  call void @101(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @102(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.102(i8*) #1 {
entry:
  call void @102(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @103(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.103(i8*) #1 {
entry:
  call void @103(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @104(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.104(i8*) #1 {
entry:
  call void @104(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @105(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.105(i8*) #1 {
entry:
  call void @105(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @106(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.106(i8*) #1 {
entry:
  call void @106(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @107(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.107(i8*) #1 {
entry:
  call void @107(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @108(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.108(i8*) #1 {
entry:
  call void @108(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @109(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.109(i8*) #1 {
entry:
  call void @109(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @110(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.110(i8*) #1 {
entry:
  call void @110(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @111(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.111(i8*) #1 {
entry:
  call void @111(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @112(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.112(i8*) #1 {
entry:
  call void @112(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @113(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.113(i8*) #1 {
entry:
  call void @113(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @114(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.114(i8*) #1 {
entry:
  call void @114(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @115(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.115(i8*) #1 {
entry:
  call void @115(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @116(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.116(i8*) #1 {
entry:
  call void @116(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @117(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.117(i8*) #1 {
entry:
  call void @117(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @118(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.118(i8*) #1 {
entry:
  call void @118(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @119(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.119(i8*) #1 {
entry:
  call void @119(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @120(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.120(i8*) #1 {
entry:
  call void @120(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @121(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.121(i8*) #1 {
entry:
  call void @121(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @122(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.122(i8*) #1 {
entry:
  call void @122(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @123(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.123(i8*) #1 {
entry:
  call void @123(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @124(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.124(i8*) #1 {
entry:
  call void @124(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @125(i8*) #1 {
prologue:
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

define internal i8* @auto_pthread_wrapper.125(i8*) #1 {
entry:
  call void @125(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define void @__go_init_main(i8*) #1 {
entry:
  ret void
}

attributes #0 = { argmemonly nounwind }
attributes #1 = { "disable-tail-calls"="true" "split-stack" }
