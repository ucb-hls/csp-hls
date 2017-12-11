; ModuleID = 'main'
; TODO(growly): Does commenting this out break anything?
; source_filename = "main"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%funcVal = type { void ()* }
%sliceType = type { %commonType, %commonType* }
%commonType = type { i8, i8, i8, i64, i32, %funcVal*, %funcVal*, i8*, { i8*, i64 }*, %uncommonType*, %commonType* }
%uncommonType = type { { i8*, i64 }*, { i8*, i64 }*, %methodSlice }
%methodSlice = type { %method*, i64, i64 }
%method = type { { i8*, i64 }*, { i8*, i64 }*, %commonType*, %commonType*, i8* }
%FIFO = type {}

@__go_type_hash_identity_descriptor = external global %funcVal
@__go_type_equal_identity_descriptor = external global %funcVal
@__go_type_hash_error_descriptor = external global %funcVal
@__go_type_equal_error_descriptor = external global %funcVal
@"init$guard" = internal global i1 false
@main.input = external global { i8*, i64, i64 }
@__go_td_AN3_inte = linkonce_odr constant %sliceType { %commonType { i8 23, i8 8, i8 8, i64 24, i32 50332931, %funcVal* @__go_type_hash_error_descriptor, %funcVal* @__go_type_equal_error_descriptor, i8* bitcast ([5 x i8*]* @"__go_td_AN3_inte$gc" to i8*), { i8*, i64 }* @1, %uncommonType* null, %commonType* null }, %commonType* @__go_tdn_int }
@0 = internal constant [5 x i8] c"[]int"
@1 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @0, i32 0, i32 0), i64 5 }
@__go_tdn_int = linkonce_odr constant %commonType { i8 -126, i8 8, i8 8, i64 8, i32 50332917, %funcVal* @__go_type_hash_identity_descriptor, %funcVal* @__go_type_equal_identity_descriptor, i8* bitcast ([2 x i8*]* @"__go_tdn_int$gc" to i8*), { i8*, i64 }* @3, %uncommonType* @6, %commonType* null }
@"__go_td_AN3_inte$gc" = linkonce_odr constant [5 x i8*] [i8* inttoptr (i64 24 to i8*), i8* inttoptr (i64 10 to i8*), i8* null, i8* bitcast ([2 x i8*]* @"__go_tdn_int$gc" to i8*), i8* null]
@2 = internal constant [3 x i8] c"int"
@3 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([3 x i8], [3 x i8]* @2, i32 0, i32 0), i64 3 }
@4 = internal constant [3 x i8] c"int"
@5 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([3 x i8], [3 x i8]* @4, i32 0, i32 0), i64 3 }
@6 = internal constant %uncommonType { { i8*, i64 }* @5, { i8*, i64 }* null, %methodSlice zeroinitializer }
@"__go_tdn_int$gc" = linkonce_odr constant [2 x i8*] [i8* inttoptr (i64 8 to i8*), i8* null]

declare void @pthread_create(i8*, i8*, i8*, i8*)

declare void @__go_make_slice2({ i8*, i64, i64 }* sret, i8* nest, i8*, i64, i64)

declare %FIFO* @fifo_malloc(i8 zeroext, i64)

declare i64 @fifo_read(%FIFO*)

declare void @pthread_exit(i8*)

declare void @fifo_write(%FIFO*, i64)

define internal void @main.checkSort(i8* nest, { i8*, i64, i64 }* byval) #0 {
prologue:
  %arr = load { i8*, i64, i64 }, { i8*, i64, i64 }* %1
  br label %.0.entry

.0.entry:                                         ; preds = %prologue
  %2 = extractvalue { i8*, i64, i64 } %arr, 0
  %3 = bitcast i8* %2 to i64*
  %4 = getelementptr i64, i64* %3, i64 0
  %5 = bitcast i64* %4 to i8*
  %6 = bitcast i8* %5 to i64*
  %7 = load i64, i64* %6
  %8 = extractvalue { i8*, i64, i64 } %arr, 0
  %9 = extractvalue { i8*, i64, i64 } %arr, 1
  %10 = extractvalue { i8*, i64, i64 } %arr, 2
  %11 = icmp slt i64 %9, 1
  %12 = icmp slt i64 %10, %9
  %13 = icmp slt i64 %10, %10
  %14 = or i1 false, %11
  %15 = or i1 %14, %12
  %16 = or i1 %15, %13
  br i1 %16, label %31, label %32, !prof !0

.1.rangeindex.loop:                               ; preds = %.5.if.done, %32
  %y = phi i64 [ %7, %32 ], [ %27, %.5.if.done ]
  %17 = phi i64 [ -1, %32 ], [ %18, %.5.if.done ]
  %18 = add i64 %17, 1
  %19 = icmp slt i64 %18, %39
  %20 = zext i1 %19 to i8
  %21 = trunc i8 %20 to i1
  br i1 %21, label %.2.rangeindex.body, label %.3.rangeindex.done

.2.rangeindex.body:                               ; preds = %.1.rangeindex.loop
  %22 = extractvalue { i8*, i64, i64 } %38, 0
  %23 = bitcast i8* %22 to i64*
  %24 = getelementptr i64, i64* %23, i64 %18
  %25 = bitcast i64* %24 to i8*
  %26 = bitcast i8* %25 to i64*
  %27 = load i64, i64* %26
  %28 = icmp sgt i64 %y, %27
  %29 = zext i1 %28 to i8
  %30 = trunc i8 %29 to i1
  br i1 %30, label %.4.if.then, label %.5.if.done

.3.rangeindex.done:                               ; preds = %.1.rangeindex.loop
  ret void

.4.if.then:                                       ; preds = %.2.rangeindex.body
  ret void

.5.if.done:                                       ; preds = %.2.rangeindex.body
  br label %.1.rangeindex.loop

; <label>:31:                                     ; preds = %.0.entry
  call void @pthread_exit(i8* null)
  unreachable

; <label>:32:                                     ; preds = %.0.entry
  %33 = sub i64 %9, 1
  %34 = sub i64 %10, 1
  %35 = getelementptr inbounds i8, i8* %8, i64 8
  %36 = insertvalue { i8*, i64, i64 } undef, i8* %35, 0
  %37 = insertvalue { i8*, i64, i64 } %36, i64 %33, 1
  %38 = insertvalue { i8*, i64, i64 } %37, i64 %34, 2
  %39 = extractvalue { i8*, i64, i64 } %38, 1
  br label %.1.rangeindex.loop
}

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
  %380 = alloca { i8*, i64, i64 }
  %381 = alloca i64
  %382 = alloca { i8*, i64, i64 }
  br label %.0.entry

.0.entry:                                         ; preds = %prologue
  call void @main.load_values(i8* nest undef)
  %383 = load { i8*, i64, i64 }, { i8*, i64, i64 }* @main.input
  store { i8*, i64, i64 } %383, { i8*, i64, i64 }* %1
  call void @main.checkSort(i8* nest undef, { i8*, i64, i64 }* byval %1)
  %384 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %385 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
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
  %511 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %2, i32 0, i32 0
  store %FIFO* %384, %FIFO** %511
  %512 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %2, i32 0, i32 1
  store %FIFO* %385, %FIFO** %512
  %513 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %2, i32 0, i32 2
  store %FIFO* %386, %FIFO** %513
  %514 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %2 to i8*
  store i32* %thread_id, i32** %3
  %515 = bitcast i32*** %4 to i8**
  store i32** %3, i32*** %4
  %516 = load i8*, i8** %515
  call void @pthread_create(i8* %516, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper to i8*), i8* %514)
  %517 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %5, i32 0, i32 0
  store %FIFO* %385, %FIFO** %517
  %518 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %5, i32 0, i32 1
  store %FIFO* %387, %FIFO** %518
  %519 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %5, i32 0, i32 2
  store %FIFO* %388, %FIFO** %519
  %520 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %5 to i8*
  store i32* %thread_id1, i32** %6
  %521 = bitcast i32*** %7 to i8**
  store i32** %6, i32*** %7
  %522 = load i8*, i8** %521
  call void @pthread_create(i8* %522, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.1 to i8*), i8* %520)
  %523 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %8, i32 0, i32 0
  store %FIFO* %386, %FIFO** %523
  %524 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %8, i32 0, i32 1
  store %FIFO* %389, %FIFO** %524
  %525 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %8, i32 0, i32 2
  store %FIFO* %390, %FIFO** %525
  %526 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %8 to i8*
  store i32* %thread_id2, i32** %9
  %527 = bitcast i32*** %10 to i8**
  store i32** %9, i32*** %10
  %528 = load i8*, i8** %527
  call void @pthread_create(i8* %528, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.2 to i8*), i8* %526)
  %529 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %11, i32 0, i32 0
  store %FIFO* %387, %FIFO** %529
  %530 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %11, i32 0, i32 1
  store %FIFO* %391, %FIFO** %530
  %531 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %11, i32 0, i32 2
  store %FIFO* %392, %FIFO** %531
  %532 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %11 to i8*
  store i32* %thread_id3, i32** %12
  %533 = bitcast i32*** %13 to i8**
  store i32** %12, i32*** %13
  %534 = load i8*, i8** %533
  call void @pthread_create(i8* %534, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.3 to i8*), i8* %532)
  %535 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %14, i32 0, i32 0
  store %FIFO* %388, %FIFO** %535
  %536 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %14, i32 0, i32 1
  store %FIFO* %393, %FIFO** %536
  %537 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %14, i32 0, i32 2
  store %FIFO* %394, %FIFO** %537
  %538 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %14 to i8*
  store i32* %thread_id4, i32** %15
  %539 = bitcast i32*** %16 to i8**
  store i32** %15, i32*** %16
  %540 = load i8*, i8** %539
  call void @pthread_create(i8* %540, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.4 to i8*), i8* %538)
  %541 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %17, i32 0, i32 0
  store %FIFO* %389, %FIFO** %541
  %542 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %17, i32 0, i32 1
  store %FIFO* %395, %FIFO** %542
  %543 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %17, i32 0, i32 2
  store %FIFO* %396, %FIFO** %543
  %544 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %17 to i8*
  store i32* %thread_id5, i32** %18
  %545 = bitcast i32*** %19 to i8**
  store i32** %18, i32*** %19
  %546 = load i8*, i8** %545
  call void @pthread_create(i8* %546, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.5 to i8*), i8* %544)
  %547 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %20, i32 0, i32 0
  store %FIFO* %390, %FIFO** %547
  %548 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %20, i32 0, i32 1
  store %FIFO* %397, %FIFO** %548
  %549 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %20, i32 0, i32 2
  store %FIFO* %398, %FIFO** %549
  %550 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %20 to i8*
  store i32* %thread_id6, i32** %21
  %551 = bitcast i32*** %22 to i8**
  store i32** %21, i32*** %22
  %552 = load i8*, i8** %551
  call void @pthread_create(i8* %552, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.6 to i8*), i8* %550)
  %553 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %23, i32 0, i32 0
  store %FIFO* %391, %FIFO** %553
  %554 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %23, i32 0, i32 1
  store %FIFO* %399, %FIFO** %554
  %555 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %23, i32 0, i32 2
  store %FIFO* %400, %FIFO** %555
  %556 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %23 to i8*
  store i32* %thread_id7, i32** %24
  %557 = bitcast i32*** %25 to i8**
  store i32** %24, i32*** %25
  %558 = load i8*, i8** %557
  call void @pthread_create(i8* %558, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.7 to i8*), i8* %556)
  %559 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %26, i32 0, i32 0
  store %FIFO* %392, %FIFO** %559
  %560 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %26, i32 0, i32 1
  store %FIFO* %401, %FIFO** %560
  %561 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %26, i32 0, i32 2
  store %FIFO* %402, %FIFO** %561
  %562 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %26 to i8*
  store i32* %thread_id8, i32** %27
  %563 = bitcast i32*** %28 to i8**
  store i32** %27, i32*** %28
  %564 = load i8*, i8** %563
  call void @pthread_create(i8* %564, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.8 to i8*), i8* %562)
  %565 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %29, i32 0, i32 0
  store %FIFO* %393, %FIFO** %565
  %566 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %29, i32 0, i32 1
  store %FIFO* %403, %FIFO** %566
  %567 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %29, i32 0, i32 2
  store %FIFO* %404, %FIFO** %567
  %568 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %29 to i8*
  store i32* %thread_id9, i32** %30
  %569 = bitcast i32*** %31 to i8**
  store i32** %30, i32*** %31
  %570 = load i8*, i8** %569
  call void @pthread_create(i8* %570, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.9 to i8*), i8* %568)
  %571 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %32, i32 0, i32 0
  store %FIFO* %394, %FIFO** %571
  %572 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %32, i32 0, i32 1
  store %FIFO* %405, %FIFO** %572
  %573 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %32, i32 0, i32 2
  store %FIFO* %406, %FIFO** %573
  %574 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %32 to i8*
  store i32* %thread_id10, i32** %33
  %575 = bitcast i32*** %34 to i8**
  store i32** %33, i32*** %34
  %576 = load i8*, i8** %575
  call void @pthread_create(i8* %576, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.10 to i8*), i8* %574)
  %577 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %35, i32 0, i32 0
  store %FIFO* %395, %FIFO** %577
  %578 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %35, i32 0, i32 1
  store %FIFO* %407, %FIFO** %578
  %579 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %35, i32 0, i32 2
  store %FIFO* %408, %FIFO** %579
  %580 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %35 to i8*
  store i32* %thread_id11, i32** %36
  %581 = bitcast i32*** %37 to i8**
  store i32** %36, i32*** %37
  %582 = load i8*, i8** %581
  call void @pthread_create(i8* %582, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.11 to i8*), i8* %580)
  %583 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %38, i32 0, i32 0
  store %FIFO* %396, %FIFO** %583
  %584 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %38, i32 0, i32 1
  store %FIFO* %409, %FIFO** %584
  %585 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %38, i32 0, i32 2
  store %FIFO* %410, %FIFO** %585
  %586 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %38 to i8*
  store i32* %thread_id12, i32** %39
  %587 = bitcast i32*** %40 to i8**
  store i32** %39, i32*** %40
  %588 = load i8*, i8** %587
  call void @pthread_create(i8* %588, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.12 to i8*), i8* %586)
  %589 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %41, i32 0, i32 0
  store %FIFO* %397, %FIFO** %589
  %590 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %41, i32 0, i32 1
  store %FIFO* %411, %FIFO** %590
  %591 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %41, i32 0, i32 2
  store %FIFO* %412, %FIFO** %591
  %592 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %41 to i8*
  store i32* %thread_id13, i32** %42
  %593 = bitcast i32*** %43 to i8**
  store i32** %42, i32*** %43
  %594 = load i8*, i8** %593
  call void @pthread_create(i8* %594, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.13 to i8*), i8* %592)
  %595 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %44, i32 0, i32 0
  store %FIFO* %398, %FIFO** %595
  %596 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %44, i32 0, i32 1
  store %FIFO* %413, %FIFO** %596
  %597 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %44, i32 0, i32 2
  store %FIFO* %414, %FIFO** %597
  %598 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %44 to i8*
  store i32* %thread_id14, i32** %45
  %599 = bitcast i32*** %46 to i8**
  store i32** %45, i32*** %46
  %600 = load i8*, i8** %599
  call void @pthread_create(i8* %600, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.14 to i8*), i8* %598)
  %601 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %47, i32 0, i32 0
  store %FIFO* %399, %FIFO** %601
  %602 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %47, i32 0, i32 1
  store %FIFO* %415, %FIFO** %602
  %603 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %47, i32 0, i32 2
  store %FIFO* %416, %FIFO** %603
  %604 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %47 to i8*
  store i32* %thread_id15, i32** %48
  %605 = bitcast i32*** %49 to i8**
  store i32** %48, i32*** %49
  %606 = load i8*, i8** %605
  call void @pthread_create(i8* %606, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.15 to i8*), i8* %604)
  %607 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %50, i32 0, i32 0
  store %FIFO* %400, %FIFO** %607
  %608 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %50, i32 0, i32 1
  store %FIFO* %417, %FIFO** %608
  %609 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %50, i32 0, i32 2
  store %FIFO* %418, %FIFO** %609
  %610 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %50 to i8*
  store i32* %thread_id16, i32** %51
  %611 = bitcast i32*** %52 to i8**
  store i32** %51, i32*** %52
  %612 = load i8*, i8** %611
  call void @pthread_create(i8* %612, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.16 to i8*), i8* %610)
  %613 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %53, i32 0, i32 0
  store %FIFO* %401, %FIFO** %613
  %614 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %53, i32 0, i32 1
  store %FIFO* %419, %FIFO** %614
  %615 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %53, i32 0, i32 2
  store %FIFO* %420, %FIFO** %615
  %616 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %53 to i8*
  store i32* %thread_id17, i32** %54
  %617 = bitcast i32*** %55 to i8**
  store i32** %54, i32*** %55
  %618 = load i8*, i8** %617
  call void @pthread_create(i8* %618, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.17 to i8*), i8* %616)
  %619 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %56, i32 0, i32 0
  store %FIFO* %402, %FIFO** %619
  %620 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %56, i32 0, i32 1
  store %FIFO* %421, %FIFO** %620
  %621 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %56, i32 0, i32 2
  store %FIFO* %422, %FIFO** %621
  %622 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %56 to i8*
  store i32* %thread_id18, i32** %57
  %623 = bitcast i32*** %58 to i8**
  store i32** %57, i32*** %58
  %624 = load i8*, i8** %623
  call void @pthread_create(i8* %624, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.18 to i8*), i8* %622)
  %625 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %59, i32 0, i32 0
  store %FIFO* %403, %FIFO** %625
  %626 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %59, i32 0, i32 1
  store %FIFO* %423, %FIFO** %626
  %627 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %59, i32 0, i32 2
  store %FIFO* %424, %FIFO** %627
  %628 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %59 to i8*
  store i32* %thread_id19, i32** %60
  %629 = bitcast i32*** %61 to i8**
  store i32** %60, i32*** %61
  %630 = load i8*, i8** %629
  call void @pthread_create(i8* %630, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.19 to i8*), i8* %628)
  %631 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %62, i32 0, i32 0
  store %FIFO* %404, %FIFO** %631
  %632 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %62, i32 0, i32 1
  store %FIFO* %425, %FIFO** %632
  %633 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %62, i32 0, i32 2
  store %FIFO* %426, %FIFO** %633
  %634 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %62 to i8*
  store i32* %thread_id20, i32** %63
  %635 = bitcast i32*** %64 to i8**
  store i32** %63, i32*** %64
  %636 = load i8*, i8** %635
  call void @pthread_create(i8* %636, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.20 to i8*), i8* %634)
  %637 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %65, i32 0, i32 0
  store %FIFO* %405, %FIFO** %637
  %638 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %65, i32 0, i32 1
  store %FIFO* %427, %FIFO** %638
  %639 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %65, i32 0, i32 2
  store %FIFO* %428, %FIFO** %639
  %640 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %65 to i8*
  store i32* %thread_id21, i32** %66
  %641 = bitcast i32*** %67 to i8**
  store i32** %66, i32*** %67
  %642 = load i8*, i8** %641
  call void @pthread_create(i8* %642, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.21 to i8*), i8* %640)
  %643 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %68, i32 0, i32 0
  store %FIFO* %406, %FIFO** %643
  %644 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %68, i32 0, i32 1
  store %FIFO* %429, %FIFO** %644
  %645 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %68, i32 0, i32 2
  store %FIFO* %430, %FIFO** %645
  %646 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %68 to i8*
  store i32* %thread_id22, i32** %69
  %647 = bitcast i32*** %70 to i8**
  store i32** %69, i32*** %70
  %648 = load i8*, i8** %647
  call void @pthread_create(i8* %648, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.22 to i8*), i8* %646)
  %649 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %71, i32 0, i32 0
  store %FIFO* %407, %FIFO** %649
  %650 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %71, i32 0, i32 1
  store %FIFO* %431, %FIFO** %650
  %651 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %71, i32 0, i32 2
  store %FIFO* %432, %FIFO** %651
  %652 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %71 to i8*
  store i32* %thread_id23, i32** %72
  %653 = bitcast i32*** %73 to i8**
  store i32** %72, i32*** %73
  %654 = load i8*, i8** %653
  call void @pthread_create(i8* %654, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.23 to i8*), i8* %652)
  %655 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %74, i32 0, i32 0
  store %FIFO* %408, %FIFO** %655
  %656 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %74, i32 0, i32 1
  store %FIFO* %433, %FIFO** %656
  %657 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %74, i32 0, i32 2
  store %FIFO* %434, %FIFO** %657
  %658 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %74 to i8*
  store i32* %thread_id24, i32** %75
  %659 = bitcast i32*** %76 to i8**
  store i32** %75, i32*** %76
  %660 = load i8*, i8** %659
  call void @pthread_create(i8* %660, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.24 to i8*), i8* %658)
  %661 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %77, i32 0, i32 0
  store %FIFO* %409, %FIFO** %661
  %662 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %77, i32 0, i32 1
  store %FIFO* %435, %FIFO** %662
  %663 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %77, i32 0, i32 2
  store %FIFO* %436, %FIFO** %663
  %664 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %77 to i8*
  store i32* %thread_id25, i32** %78
  %665 = bitcast i32*** %79 to i8**
  store i32** %78, i32*** %79
  %666 = load i8*, i8** %665
  call void @pthread_create(i8* %666, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.25 to i8*), i8* %664)
  %667 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %80, i32 0, i32 0
  store %FIFO* %410, %FIFO** %667
  %668 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %80, i32 0, i32 1
  store %FIFO* %437, %FIFO** %668
  %669 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %80, i32 0, i32 2
  store %FIFO* %438, %FIFO** %669
  %670 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %80 to i8*
  store i32* %thread_id26, i32** %81
  %671 = bitcast i32*** %82 to i8**
  store i32** %81, i32*** %82
  %672 = load i8*, i8** %671
  call void @pthread_create(i8* %672, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.26 to i8*), i8* %670)
  %673 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %83, i32 0, i32 0
  store %FIFO* %411, %FIFO** %673
  %674 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %83, i32 0, i32 1
  store %FIFO* %439, %FIFO** %674
  %675 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %83, i32 0, i32 2
  store %FIFO* %440, %FIFO** %675
  %676 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %83 to i8*
  store i32* %thread_id27, i32** %84
  %677 = bitcast i32*** %85 to i8**
  store i32** %84, i32*** %85
  %678 = load i8*, i8** %677
  call void @pthread_create(i8* %678, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.27 to i8*), i8* %676)
  %679 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %86, i32 0, i32 0
  store %FIFO* %412, %FIFO** %679
  %680 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %86, i32 0, i32 1
  store %FIFO* %441, %FIFO** %680
  %681 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %86, i32 0, i32 2
  store %FIFO* %442, %FIFO** %681
  %682 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %86 to i8*
  store i32* %thread_id28, i32** %87
  %683 = bitcast i32*** %88 to i8**
  store i32** %87, i32*** %88
  %684 = load i8*, i8** %683
  call void @pthread_create(i8* %684, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.28 to i8*), i8* %682)
  %685 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %89, i32 0, i32 0
  store %FIFO* %413, %FIFO** %685
  %686 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %89, i32 0, i32 1
  store %FIFO* %443, %FIFO** %686
  %687 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %89, i32 0, i32 2
  store %FIFO* %444, %FIFO** %687
  %688 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %89 to i8*
  store i32* %thread_id29, i32** %90
  %689 = bitcast i32*** %91 to i8**
  store i32** %90, i32*** %91
  %690 = load i8*, i8** %689
  call void @pthread_create(i8* %690, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.29 to i8*), i8* %688)
  %691 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %92, i32 0, i32 0
  store %FIFO* %414, %FIFO** %691
  %692 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %92, i32 0, i32 1
  store %FIFO* %445, %FIFO** %692
  %693 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %92, i32 0, i32 2
  store %FIFO* %446, %FIFO** %693
  %694 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %92 to i8*
  store i32* %thread_id30, i32** %93
  %695 = bitcast i32*** %94 to i8**
  store i32** %93, i32*** %94
  %696 = load i8*, i8** %695
  call void @pthread_create(i8* %696, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.30 to i8*), i8* %694)
  %697 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %95, i32 0, i32 0
  store %FIFO* %415, %FIFO** %697
  %698 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %95, i32 0, i32 1
  store %FIFO* %447, %FIFO** %698
  %699 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %95, i32 0, i32 2
  store %FIFO* %448, %FIFO** %699
  %700 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %95 to i8*
  store i32* %thread_id31, i32** %96
  %701 = bitcast i32*** %97 to i8**
  store i32** %96, i32*** %97
  %702 = load i8*, i8** %701
  call void @pthread_create(i8* %702, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.31 to i8*), i8* %700)
  %703 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %98, i32 0, i32 0
  store %FIFO* %416, %FIFO** %703
  %704 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %98, i32 0, i32 1
  store %FIFO* %449, %FIFO** %704
  %705 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %98, i32 0, i32 2
  store %FIFO* %450, %FIFO** %705
  %706 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %98 to i8*
  store i32* %thread_id32, i32** %99
  %707 = bitcast i32*** %100 to i8**
  store i32** %99, i32*** %100
  %708 = load i8*, i8** %707
  call void @pthread_create(i8* %708, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.32 to i8*), i8* %706)
  %709 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %101, i32 0, i32 0
  store %FIFO* %417, %FIFO** %709
  %710 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %101, i32 0, i32 1
  store %FIFO* %451, %FIFO** %710
  %711 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %101, i32 0, i32 2
  store %FIFO* %452, %FIFO** %711
  %712 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %101 to i8*
  store i32* %thread_id33, i32** %102
  %713 = bitcast i32*** %103 to i8**
  store i32** %102, i32*** %103
  %714 = load i8*, i8** %713
  call void @pthread_create(i8* %714, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.33 to i8*), i8* %712)
  %715 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %104, i32 0, i32 0
  store %FIFO* %418, %FIFO** %715
  %716 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %104, i32 0, i32 1
  store %FIFO* %453, %FIFO** %716
  %717 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %104, i32 0, i32 2
  store %FIFO* %454, %FIFO** %717
  %718 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %104 to i8*
  store i32* %thread_id34, i32** %105
  %719 = bitcast i32*** %106 to i8**
  store i32** %105, i32*** %106
  %720 = load i8*, i8** %719
  call void @pthread_create(i8* %720, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.34 to i8*), i8* %718)
  %721 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %107, i32 0, i32 0
  store %FIFO* %419, %FIFO** %721
  %722 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %107, i32 0, i32 1
  store %FIFO* %455, %FIFO** %722
  %723 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %107, i32 0, i32 2
  store %FIFO* %456, %FIFO** %723
  %724 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %107 to i8*
  store i32* %thread_id35, i32** %108
  %725 = bitcast i32*** %109 to i8**
  store i32** %108, i32*** %109
  %726 = load i8*, i8** %725
  call void @pthread_create(i8* %726, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.35 to i8*), i8* %724)
  %727 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %110, i32 0, i32 0
  store %FIFO* %420, %FIFO** %727
  %728 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %110, i32 0, i32 1
  store %FIFO* %457, %FIFO** %728
  %729 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %110, i32 0, i32 2
  store %FIFO* %458, %FIFO** %729
  %730 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %110 to i8*
  store i32* %thread_id36, i32** %111
  %731 = bitcast i32*** %112 to i8**
  store i32** %111, i32*** %112
  %732 = load i8*, i8** %731
  call void @pthread_create(i8* %732, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.36 to i8*), i8* %730)
  %733 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %113, i32 0, i32 0
  store %FIFO* %421, %FIFO** %733
  %734 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %113, i32 0, i32 1
  store %FIFO* %459, %FIFO** %734
  %735 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %113, i32 0, i32 2
  store %FIFO* %460, %FIFO** %735
  %736 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %113 to i8*
  store i32* %thread_id37, i32** %114
  %737 = bitcast i32*** %115 to i8**
  store i32** %114, i32*** %115
  %738 = load i8*, i8** %737
  call void @pthread_create(i8* %738, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.37 to i8*), i8* %736)
  %739 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %116, i32 0, i32 0
  store %FIFO* %422, %FIFO** %739
  %740 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %116, i32 0, i32 1
  store %FIFO* %461, %FIFO** %740
  %741 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %116, i32 0, i32 2
  store %FIFO* %462, %FIFO** %741
  %742 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %116 to i8*
  store i32* %thread_id38, i32** %117
  %743 = bitcast i32*** %118 to i8**
  store i32** %117, i32*** %118
  %744 = load i8*, i8** %743
  call void @pthread_create(i8* %744, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.38 to i8*), i8* %742)
  %745 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %119, i32 0, i32 0
  store %FIFO* %423, %FIFO** %745
  %746 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %119, i32 0, i32 1
  store %FIFO* %463, %FIFO** %746
  %747 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %119, i32 0, i32 2
  store %FIFO* %464, %FIFO** %747
  %748 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %119 to i8*
  store i32* %thread_id39, i32** %120
  %749 = bitcast i32*** %121 to i8**
  store i32** %120, i32*** %121
  %750 = load i8*, i8** %749
  call void @pthread_create(i8* %750, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.39 to i8*), i8* %748)
  %751 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %122, i32 0, i32 0
  store %FIFO* %424, %FIFO** %751
  %752 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %122, i32 0, i32 1
  store %FIFO* %465, %FIFO** %752
  %753 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %122, i32 0, i32 2
  store %FIFO* %466, %FIFO** %753
  %754 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %122 to i8*
  store i32* %thread_id40, i32** %123
  %755 = bitcast i32*** %124 to i8**
  store i32** %123, i32*** %124
  %756 = load i8*, i8** %755
  call void @pthread_create(i8* %756, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.40 to i8*), i8* %754)
  %757 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %125, i32 0, i32 0
  store %FIFO* %425, %FIFO** %757
  %758 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %125, i32 0, i32 1
  store %FIFO* %467, %FIFO** %758
  %759 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %125, i32 0, i32 2
  store %FIFO* %468, %FIFO** %759
  %760 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %125 to i8*
  store i32* %thread_id41, i32** %126
  %761 = bitcast i32*** %127 to i8**
  store i32** %126, i32*** %127
  %762 = load i8*, i8** %761
  call void @pthread_create(i8* %762, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.41 to i8*), i8* %760)
  %763 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %128, i32 0, i32 0
  store %FIFO* %426, %FIFO** %763
  %764 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %128, i32 0, i32 1
  store %FIFO* %469, %FIFO** %764
  %765 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %128, i32 0, i32 2
  store %FIFO* %470, %FIFO** %765
  %766 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %128 to i8*
  store i32* %thread_id42, i32** %129
  %767 = bitcast i32*** %130 to i8**
  store i32** %129, i32*** %130
  %768 = load i8*, i8** %767
  call void @pthread_create(i8* %768, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.42 to i8*), i8* %766)
  %769 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %131, i32 0, i32 0
  store %FIFO* %427, %FIFO** %769
  %770 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %131, i32 0, i32 1
  store %FIFO* %471, %FIFO** %770
  %771 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %131, i32 0, i32 2
  store %FIFO* %472, %FIFO** %771
  %772 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %131 to i8*
  store i32* %thread_id43, i32** %132
  %773 = bitcast i32*** %133 to i8**
  store i32** %132, i32*** %133
  %774 = load i8*, i8** %773
  call void @pthread_create(i8* %774, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.43 to i8*), i8* %772)
  %775 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %134, i32 0, i32 0
  store %FIFO* %428, %FIFO** %775
  %776 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %134, i32 0, i32 1
  store %FIFO* %473, %FIFO** %776
  %777 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %134, i32 0, i32 2
  store %FIFO* %474, %FIFO** %777
  %778 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %134 to i8*
  store i32* %thread_id44, i32** %135
  %779 = bitcast i32*** %136 to i8**
  store i32** %135, i32*** %136
  %780 = load i8*, i8** %779
  call void @pthread_create(i8* %780, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.44 to i8*), i8* %778)
  %781 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %137, i32 0, i32 0
  store %FIFO* %429, %FIFO** %781
  %782 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %137, i32 0, i32 1
  store %FIFO* %475, %FIFO** %782
  %783 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %137, i32 0, i32 2
  store %FIFO* %476, %FIFO** %783
  %784 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %137 to i8*
  store i32* %thread_id45, i32** %138
  %785 = bitcast i32*** %139 to i8**
  store i32** %138, i32*** %139
  %786 = load i8*, i8** %785
  call void @pthread_create(i8* %786, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.45 to i8*), i8* %784)
  %787 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %140, i32 0, i32 0
  store %FIFO* %430, %FIFO** %787
  %788 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %140, i32 0, i32 1
  store %FIFO* %477, %FIFO** %788
  %789 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %140, i32 0, i32 2
  store %FIFO* %478, %FIFO** %789
  %790 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %140 to i8*
  store i32* %thread_id46, i32** %141
  %791 = bitcast i32*** %142 to i8**
  store i32** %141, i32*** %142
  %792 = load i8*, i8** %791
  call void @pthread_create(i8* %792, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.46 to i8*), i8* %790)
  %793 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %143, i32 0, i32 0
  store %FIFO* %431, %FIFO** %793
  %794 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %143, i32 0, i32 1
  store %FIFO* %479, %FIFO** %794
  %795 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %143, i32 0, i32 2
  store %FIFO* %480, %FIFO** %795
  %796 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %143 to i8*
  store i32* %thread_id47, i32** %144
  %797 = bitcast i32*** %145 to i8**
  store i32** %144, i32*** %145
  %798 = load i8*, i8** %797
  call void @pthread_create(i8* %798, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.47 to i8*), i8* %796)
  %799 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %146, i32 0, i32 0
  store %FIFO* %432, %FIFO** %799
  %800 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %146, i32 0, i32 1
  store %FIFO* %481, %FIFO** %800
  %801 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %146, i32 0, i32 2
  store %FIFO* %482, %FIFO** %801
  %802 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %146 to i8*
  store i32* %thread_id48, i32** %147
  %803 = bitcast i32*** %148 to i8**
  store i32** %147, i32*** %148
  %804 = load i8*, i8** %803
  call void @pthread_create(i8* %804, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.48 to i8*), i8* %802)
  %805 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %149, i32 0, i32 0
  store %FIFO* %433, %FIFO** %805
  %806 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %149, i32 0, i32 1
  store %FIFO* %483, %FIFO** %806
  %807 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %149, i32 0, i32 2
  store %FIFO* %484, %FIFO** %807
  %808 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %149 to i8*
  store i32* %thread_id49, i32** %150
  %809 = bitcast i32*** %151 to i8**
  store i32** %150, i32*** %151
  %810 = load i8*, i8** %809
  call void @pthread_create(i8* %810, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.49 to i8*), i8* %808)
  %811 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %152, i32 0, i32 0
  store %FIFO* %434, %FIFO** %811
  %812 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %152, i32 0, i32 1
  store %FIFO* %485, %FIFO** %812
  %813 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %152, i32 0, i32 2
  store %FIFO* %486, %FIFO** %813
  %814 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %152 to i8*
  store i32* %thread_id50, i32** %153
  %815 = bitcast i32*** %154 to i8**
  store i32** %153, i32*** %154
  %816 = load i8*, i8** %815
  call void @pthread_create(i8* %816, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.50 to i8*), i8* %814)
  %817 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %155, i32 0, i32 0
  store %FIFO* %435, %FIFO** %817
  %818 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %155, i32 0, i32 1
  store %FIFO* %487, %FIFO** %818
  %819 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %155, i32 0, i32 2
  store %FIFO* %488, %FIFO** %819
  %820 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %155 to i8*
  store i32* %thread_id51, i32** %156
  %821 = bitcast i32*** %157 to i8**
  store i32** %156, i32*** %157
  %822 = load i8*, i8** %821
  call void @pthread_create(i8* %822, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.51 to i8*), i8* %820)
  %823 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %158, i32 0, i32 0
  store %FIFO* %436, %FIFO** %823
  %824 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %158, i32 0, i32 1
  store %FIFO* %489, %FIFO** %824
  %825 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %158, i32 0, i32 2
  store %FIFO* %490, %FIFO** %825
  %826 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %158 to i8*
  store i32* %thread_id52, i32** %159
  %827 = bitcast i32*** %160 to i8**
  store i32** %159, i32*** %160
  %828 = load i8*, i8** %827
  call void @pthread_create(i8* %828, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.52 to i8*), i8* %826)
  %829 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %161, i32 0, i32 0
  store %FIFO* %437, %FIFO** %829
  %830 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %161, i32 0, i32 1
  store %FIFO* %491, %FIFO** %830
  %831 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %161, i32 0, i32 2
  store %FIFO* %492, %FIFO** %831
  %832 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %161 to i8*
  store i32* %thread_id53, i32** %162
  %833 = bitcast i32*** %163 to i8**
  store i32** %162, i32*** %163
  %834 = load i8*, i8** %833
  call void @pthread_create(i8* %834, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.53 to i8*), i8* %832)
  %835 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %164, i32 0, i32 0
  store %FIFO* %438, %FIFO** %835
  %836 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %164, i32 0, i32 1
  store %FIFO* %493, %FIFO** %836
  %837 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %164, i32 0, i32 2
  store %FIFO* %494, %FIFO** %837
  %838 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %164 to i8*
  store i32* %thread_id54, i32** %165
  %839 = bitcast i32*** %166 to i8**
  store i32** %165, i32*** %166
  %840 = load i8*, i8** %839
  call void @pthread_create(i8* %840, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.54 to i8*), i8* %838)
  %841 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %167, i32 0, i32 0
  store %FIFO* %439, %FIFO** %841
  %842 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %167, i32 0, i32 1
  store %FIFO* %495, %FIFO** %842
  %843 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %167, i32 0, i32 2
  store %FIFO* %496, %FIFO** %843
  %844 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %167 to i8*
  store i32* %thread_id55, i32** %168
  %845 = bitcast i32*** %169 to i8**
  store i32** %168, i32*** %169
  %846 = load i8*, i8** %845
  call void @pthread_create(i8* %846, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.55 to i8*), i8* %844)
  %847 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %170, i32 0, i32 0
  store %FIFO* %440, %FIFO** %847
  %848 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %170, i32 0, i32 1
  store %FIFO* %497, %FIFO** %848
  %849 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %170, i32 0, i32 2
  store %FIFO* %498, %FIFO** %849
  %850 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %170 to i8*
  store i32* %thread_id56, i32** %171
  %851 = bitcast i32*** %172 to i8**
  store i32** %171, i32*** %172
  %852 = load i8*, i8** %851
  call void @pthread_create(i8* %852, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.56 to i8*), i8* %850)
  %853 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %173, i32 0, i32 0
  store %FIFO* %441, %FIFO** %853
  %854 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %173, i32 0, i32 1
  store %FIFO* %499, %FIFO** %854
  %855 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %173, i32 0, i32 2
  store %FIFO* %500, %FIFO** %855
  %856 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %173 to i8*
  store i32* %thread_id57, i32** %174
  %857 = bitcast i32*** %175 to i8**
  store i32** %174, i32*** %175
  %858 = load i8*, i8** %857
  call void @pthread_create(i8* %858, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.57 to i8*), i8* %856)
  %859 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %176, i32 0, i32 0
  store %FIFO* %442, %FIFO** %859
  %860 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %176, i32 0, i32 1
  store %FIFO* %501, %FIFO** %860
  %861 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %176, i32 0, i32 2
  store %FIFO* %502, %FIFO** %861
  %862 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %176 to i8*
  store i32* %thread_id58, i32** %177
  %863 = bitcast i32*** %178 to i8**
  store i32** %177, i32*** %178
  %864 = load i8*, i8** %863
  call void @pthread_create(i8* %864, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.58 to i8*), i8* %862)
  %865 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %179, i32 0, i32 0
  store %FIFO* %443, %FIFO** %865
  %866 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %179, i32 0, i32 1
  store %FIFO* %503, %FIFO** %866
  %867 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %179, i32 0, i32 2
  store %FIFO* %504, %FIFO** %867
  %868 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %179 to i8*
  store i32* %thread_id59, i32** %180
  %869 = bitcast i32*** %181 to i8**
  store i32** %180, i32*** %181
  %870 = load i8*, i8** %869
  call void @pthread_create(i8* %870, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.59 to i8*), i8* %868)
  %871 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %182, i32 0, i32 0
  store %FIFO* %444, %FIFO** %871
  %872 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %182, i32 0, i32 1
  store %FIFO* %505, %FIFO** %872
  %873 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %182, i32 0, i32 2
  store %FIFO* %506, %FIFO** %873
  %874 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %182 to i8*
  store i32* %thread_id60, i32** %183
  %875 = bitcast i32*** %184 to i8**
  store i32** %183, i32*** %184
  %876 = load i8*, i8** %875
  call void @pthread_create(i8* %876, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.60 to i8*), i8* %874)
  %877 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %185, i32 0, i32 0
  store %FIFO* %445, %FIFO** %877
  %878 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %185, i32 0, i32 1
  store %FIFO* %507, %FIFO** %878
  %879 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %185, i32 0, i32 2
  store %FIFO* %508, %FIFO** %879
  %880 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %185 to i8*
  store i32* %thread_id61, i32** %186
  %881 = bitcast i32*** %187 to i8**
  store i32** %186, i32*** %187
  %882 = load i8*, i8** %881
  call void @pthread_create(i8* %882, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.61 to i8*), i8* %880)
  %883 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %188, i32 0, i32 0
  store %FIFO* %446, %FIFO** %883
  %884 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %188, i32 0, i32 1
  store %FIFO* %509, %FIFO** %884
  %885 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %188, i32 0, i32 2
  store %FIFO* %510, %FIFO** %885
  %886 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %188 to i8*
  store i32* %thread_id62, i32** %189
  %887 = bitcast i32*** %190 to i8**
  store i32** %189, i32*** %190
  %888 = load i8*, i8** %887
  call void @pthread_create(i8* %888, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.62 to i8*), i8* %886)
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
  %952 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %191, i32 0, i32 0
  store %FIFO* %447, %FIFO** %952
  %953 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %191, i32 0, i32 1
  store %FIFO* %479, %FIFO** %953
  %954 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %191, i32 0, i32 2
  store %FIFO* %889, %FIFO** %954
  %955 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %191 to i8*
  store i32* %thread_id63, i32** %192
  %956 = bitcast i32*** %193 to i8**
  store i32** %192, i32*** %193
  %957 = load i8*, i8** %956
  call void @pthread_create(i8* %957, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.63 to i8*), i8* %955)
  %958 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %194, i32 0, i32 0
  store %FIFO* %448, %FIFO** %958
  %959 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %194, i32 0, i32 1
  store %FIFO* %480, %FIFO** %959
  %960 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %194, i32 0, i32 2
  store %FIFO* %890, %FIFO** %960
  %961 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %194 to i8*
  store i32* %thread_id64, i32** %195
  %962 = bitcast i32*** %196 to i8**
  store i32** %195, i32*** %196
  %963 = load i8*, i8** %962
  call void @pthread_create(i8* %963, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.64 to i8*), i8* %961)
  %964 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %197, i32 0, i32 0
  store %FIFO* %449, %FIFO** %964
  %965 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %197, i32 0, i32 1
  store %FIFO* %481, %FIFO** %965
  %966 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %197, i32 0, i32 2
  store %FIFO* %891, %FIFO** %966
  %967 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %197 to i8*
  store i32* %thread_id65, i32** %198
  %968 = bitcast i32*** %199 to i8**
  store i32** %198, i32*** %199
  %969 = load i8*, i8** %968
  call void @pthread_create(i8* %969, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.65 to i8*), i8* %967)
  %970 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %200, i32 0, i32 0
  store %FIFO* %450, %FIFO** %970
  %971 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %200, i32 0, i32 1
  store %FIFO* %482, %FIFO** %971
  %972 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %200, i32 0, i32 2
  store %FIFO* %892, %FIFO** %972
  %973 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %200 to i8*
  store i32* %thread_id66, i32** %201
  %974 = bitcast i32*** %202 to i8**
  store i32** %201, i32*** %202
  %975 = load i8*, i8** %974
  call void @pthread_create(i8* %975, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.66 to i8*), i8* %973)
  %976 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %203, i32 0, i32 0
  store %FIFO* %451, %FIFO** %976
  %977 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %203, i32 0, i32 1
  store %FIFO* %483, %FIFO** %977
  %978 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %203, i32 0, i32 2
  store %FIFO* %893, %FIFO** %978
  %979 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %203 to i8*
  store i32* %thread_id67, i32** %204
  %980 = bitcast i32*** %205 to i8**
  store i32** %204, i32*** %205
  %981 = load i8*, i8** %980
  call void @pthread_create(i8* %981, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.67 to i8*), i8* %979)
  %982 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %206, i32 0, i32 0
  store %FIFO* %452, %FIFO** %982
  %983 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %206, i32 0, i32 1
  store %FIFO* %484, %FIFO** %983
  %984 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %206, i32 0, i32 2
  store %FIFO* %894, %FIFO** %984
  %985 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %206 to i8*
  store i32* %thread_id68, i32** %207
  %986 = bitcast i32*** %208 to i8**
  store i32** %207, i32*** %208
  %987 = load i8*, i8** %986
  call void @pthread_create(i8* %987, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.68 to i8*), i8* %985)
  %988 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %209, i32 0, i32 0
  store %FIFO* %453, %FIFO** %988
  %989 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %209, i32 0, i32 1
  store %FIFO* %485, %FIFO** %989
  %990 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %209, i32 0, i32 2
  store %FIFO* %895, %FIFO** %990
  %991 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %209 to i8*
  store i32* %thread_id69, i32** %210
  %992 = bitcast i32*** %211 to i8**
  store i32** %210, i32*** %211
  %993 = load i8*, i8** %992
  call void @pthread_create(i8* %993, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.69 to i8*), i8* %991)
  %994 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %212, i32 0, i32 0
  store %FIFO* %454, %FIFO** %994
  %995 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %212, i32 0, i32 1
  store %FIFO* %486, %FIFO** %995
  %996 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %212, i32 0, i32 2
  store %FIFO* %896, %FIFO** %996
  %997 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %212 to i8*
  store i32* %thread_id70, i32** %213
  %998 = bitcast i32*** %214 to i8**
  store i32** %213, i32*** %214
  %999 = load i8*, i8** %998
  call void @pthread_create(i8* %999, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.70 to i8*), i8* %997)
  %1000 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %215, i32 0, i32 0
  store %FIFO* %455, %FIFO** %1000
  %1001 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %215, i32 0, i32 1
  store %FIFO* %487, %FIFO** %1001
  %1002 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %215, i32 0, i32 2
  store %FIFO* %897, %FIFO** %1002
  %1003 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %215 to i8*
  store i32* %thread_id71, i32** %216
  %1004 = bitcast i32*** %217 to i8**
  store i32** %216, i32*** %217
  %1005 = load i8*, i8** %1004
  call void @pthread_create(i8* %1005, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.71 to i8*), i8* %1003)
  %1006 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %218, i32 0, i32 0
  store %FIFO* %456, %FIFO** %1006
  %1007 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %218, i32 0, i32 1
  store %FIFO* %488, %FIFO** %1007
  %1008 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %218, i32 0, i32 2
  store %FIFO* %898, %FIFO** %1008
  %1009 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %218 to i8*
  store i32* %thread_id72, i32** %219
  %1010 = bitcast i32*** %220 to i8**
  store i32** %219, i32*** %220
  %1011 = load i8*, i8** %1010
  call void @pthread_create(i8* %1011, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.72 to i8*), i8* %1009)
  %1012 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %221, i32 0, i32 0
  store %FIFO* %457, %FIFO** %1012
  %1013 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %221, i32 0, i32 1
  store %FIFO* %489, %FIFO** %1013
  %1014 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %221, i32 0, i32 2
  store %FIFO* %899, %FIFO** %1014
  %1015 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %221 to i8*
  store i32* %thread_id73, i32** %222
  %1016 = bitcast i32*** %223 to i8**
  store i32** %222, i32*** %223
  %1017 = load i8*, i8** %1016
  call void @pthread_create(i8* %1017, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.73 to i8*), i8* %1015)
  %1018 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %224, i32 0, i32 0
  store %FIFO* %458, %FIFO** %1018
  %1019 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %224, i32 0, i32 1
  store %FIFO* %490, %FIFO** %1019
  %1020 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %224, i32 0, i32 2
  store %FIFO* %900, %FIFO** %1020
  %1021 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %224 to i8*
  store i32* %thread_id74, i32** %225
  %1022 = bitcast i32*** %226 to i8**
  store i32** %225, i32*** %226
  %1023 = load i8*, i8** %1022
  call void @pthread_create(i8* %1023, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.74 to i8*), i8* %1021)
  %1024 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %227, i32 0, i32 0
  store %FIFO* %459, %FIFO** %1024
  %1025 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %227, i32 0, i32 1
  store %FIFO* %491, %FIFO** %1025
  %1026 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %227, i32 0, i32 2
  store %FIFO* %901, %FIFO** %1026
  %1027 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %227 to i8*
  store i32* %thread_id75, i32** %228
  %1028 = bitcast i32*** %229 to i8**
  store i32** %228, i32*** %229
  %1029 = load i8*, i8** %1028
  call void @pthread_create(i8* %1029, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.75 to i8*), i8* %1027)
  %1030 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %230, i32 0, i32 0
  store %FIFO* %460, %FIFO** %1030
  %1031 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %230, i32 0, i32 1
  store %FIFO* %492, %FIFO** %1031
  %1032 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %230, i32 0, i32 2
  store %FIFO* %902, %FIFO** %1032
  %1033 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %230 to i8*
  store i32* %thread_id76, i32** %231
  %1034 = bitcast i32*** %232 to i8**
  store i32** %231, i32*** %232
  %1035 = load i8*, i8** %1034
  call void @pthread_create(i8* %1035, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.76 to i8*), i8* %1033)
  %1036 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %233, i32 0, i32 0
  store %FIFO* %461, %FIFO** %1036
  %1037 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %233, i32 0, i32 1
  store %FIFO* %493, %FIFO** %1037
  %1038 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %233, i32 0, i32 2
  store %FIFO* %903, %FIFO** %1038
  %1039 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %233 to i8*
  store i32* %thread_id77, i32** %234
  %1040 = bitcast i32*** %235 to i8**
  store i32** %234, i32*** %235
  %1041 = load i8*, i8** %1040
  call void @pthread_create(i8* %1041, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.77 to i8*), i8* %1039)
  %1042 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %236, i32 0, i32 0
  store %FIFO* %462, %FIFO** %1042
  %1043 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %236, i32 0, i32 1
  store %FIFO* %494, %FIFO** %1043
  %1044 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %236, i32 0, i32 2
  store %FIFO* %904, %FIFO** %1044
  %1045 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %236 to i8*
  store i32* %thread_id78, i32** %237
  %1046 = bitcast i32*** %238 to i8**
  store i32** %237, i32*** %238
  %1047 = load i8*, i8** %1046
  call void @pthread_create(i8* %1047, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.78 to i8*), i8* %1045)
  %1048 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %239, i32 0, i32 0
  store %FIFO* %463, %FIFO** %1048
  %1049 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %239, i32 0, i32 1
  store %FIFO* %495, %FIFO** %1049
  %1050 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %239, i32 0, i32 2
  store %FIFO* %905, %FIFO** %1050
  %1051 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %239 to i8*
  store i32* %thread_id79, i32** %240
  %1052 = bitcast i32*** %241 to i8**
  store i32** %240, i32*** %241
  %1053 = load i8*, i8** %1052
  call void @pthread_create(i8* %1053, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.79 to i8*), i8* %1051)
  %1054 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %242, i32 0, i32 0
  store %FIFO* %464, %FIFO** %1054
  %1055 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %242, i32 0, i32 1
  store %FIFO* %496, %FIFO** %1055
  %1056 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %242, i32 0, i32 2
  store %FIFO* %906, %FIFO** %1056
  %1057 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %242 to i8*
  store i32* %thread_id80, i32** %243
  %1058 = bitcast i32*** %244 to i8**
  store i32** %243, i32*** %244
  %1059 = load i8*, i8** %1058
  call void @pthread_create(i8* %1059, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.80 to i8*), i8* %1057)
  %1060 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %245, i32 0, i32 0
  store %FIFO* %465, %FIFO** %1060
  %1061 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %245, i32 0, i32 1
  store %FIFO* %497, %FIFO** %1061
  %1062 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %245, i32 0, i32 2
  store %FIFO* %907, %FIFO** %1062
  %1063 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %245 to i8*
  store i32* %thread_id81, i32** %246
  %1064 = bitcast i32*** %247 to i8**
  store i32** %246, i32*** %247
  %1065 = load i8*, i8** %1064
  call void @pthread_create(i8* %1065, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.81 to i8*), i8* %1063)
  %1066 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %248, i32 0, i32 0
  store %FIFO* %466, %FIFO** %1066
  %1067 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %248, i32 0, i32 1
  store %FIFO* %498, %FIFO** %1067
  %1068 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %248, i32 0, i32 2
  store %FIFO* %908, %FIFO** %1068
  %1069 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %248 to i8*
  store i32* %thread_id82, i32** %249
  %1070 = bitcast i32*** %250 to i8**
  store i32** %249, i32*** %250
  %1071 = load i8*, i8** %1070
  call void @pthread_create(i8* %1071, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.82 to i8*), i8* %1069)
  %1072 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %251, i32 0, i32 0
  store %FIFO* %467, %FIFO** %1072
  %1073 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %251, i32 0, i32 1
  store %FIFO* %499, %FIFO** %1073
  %1074 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %251, i32 0, i32 2
  store %FIFO* %909, %FIFO** %1074
  %1075 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %251 to i8*
  store i32* %thread_id83, i32** %252
  %1076 = bitcast i32*** %253 to i8**
  store i32** %252, i32*** %253
  %1077 = load i8*, i8** %1076
  call void @pthread_create(i8* %1077, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.83 to i8*), i8* %1075)
  %1078 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %254, i32 0, i32 0
  store %FIFO* %468, %FIFO** %1078
  %1079 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %254, i32 0, i32 1
  store %FIFO* %500, %FIFO** %1079
  %1080 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %254, i32 0, i32 2
  store %FIFO* %910, %FIFO** %1080
  %1081 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %254 to i8*
  store i32* %thread_id84, i32** %255
  %1082 = bitcast i32*** %256 to i8**
  store i32** %255, i32*** %256
  %1083 = load i8*, i8** %1082
  call void @pthread_create(i8* %1083, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.84 to i8*), i8* %1081)
  %1084 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %257, i32 0, i32 0
  store %FIFO* %469, %FIFO** %1084
  %1085 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %257, i32 0, i32 1
  store %FIFO* %501, %FIFO** %1085
  %1086 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %257, i32 0, i32 2
  store %FIFO* %911, %FIFO** %1086
  %1087 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %257 to i8*
  store i32* %thread_id85, i32** %258
  %1088 = bitcast i32*** %259 to i8**
  store i32** %258, i32*** %259
  %1089 = load i8*, i8** %1088
  call void @pthread_create(i8* %1089, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.85 to i8*), i8* %1087)
  %1090 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %260, i32 0, i32 0
  store %FIFO* %470, %FIFO** %1090
  %1091 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %260, i32 0, i32 1
  store %FIFO* %502, %FIFO** %1091
  %1092 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %260, i32 0, i32 2
  store %FIFO* %912, %FIFO** %1092
  %1093 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %260 to i8*
  store i32* %thread_id86, i32** %261
  %1094 = bitcast i32*** %262 to i8**
  store i32** %261, i32*** %262
  %1095 = load i8*, i8** %1094
  call void @pthread_create(i8* %1095, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.86 to i8*), i8* %1093)
  %1096 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %263, i32 0, i32 0
  store %FIFO* %471, %FIFO** %1096
  %1097 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %263, i32 0, i32 1
  store %FIFO* %503, %FIFO** %1097
  %1098 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %263, i32 0, i32 2
  store %FIFO* %913, %FIFO** %1098
  %1099 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %263 to i8*
  store i32* %thread_id87, i32** %264
  %1100 = bitcast i32*** %265 to i8**
  store i32** %264, i32*** %265
  %1101 = load i8*, i8** %1100
  call void @pthread_create(i8* %1101, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.87 to i8*), i8* %1099)
  %1102 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %266, i32 0, i32 0
  store %FIFO* %472, %FIFO** %1102
  %1103 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %266, i32 0, i32 1
  store %FIFO* %504, %FIFO** %1103
  %1104 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %266, i32 0, i32 2
  store %FIFO* %914, %FIFO** %1104
  %1105 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %266 to i8*
  store i32* %thread_id88, i32** %267
  %1106 = bitcast i32*** %268 to i8**
  store i32** %267, i32*** %268
  %1107 = load i8*, i8** %1106
  call void @pthread_create(i8* %1107, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.88 to i8*), i8* %1105)
  %1108 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %269, i32 0, i32 0
  store %FIFO* %473, %FIFO** %1108
  %1109 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %269, i32 0, i32 1
  store %FIFO* %505, %FIFO** %1109
  %1110 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %269, i32 0, i32 2
  store %FIFO* %915, %FIFO** %1110
  %1111 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %269 to i8*
  store i32* %thread_id89, i32** %270
  %1112 = bitcast i32*** %271 to i8**
  store i32** %270, i32*** %271
  %1113 = load i8*, i8** %1112
  call void @pthread_create(i8* %1113, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.89 to i8*), i8* %1111)
  %1114 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %272, i32 0, i32 0
  store %FIFO* %474, %FIFO** %1114
  %1115 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %272, i32 0, i32 1
  store %FIFO* %506, %FIFO** %1115
  %1116 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %272, i32 0, i32 2
  store %FIFO* %916, %FIFO** %1116
  %1117 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %272 to i8*
  store i32* %thread_id90, i32** %273
  %1118 = bitcast i32*** %274 to i8**
  store i32** %273, i32*** %274
  %1119 = load i8*, i8** %1118
  call void @pthread_create(i8* %1119, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.90 to i8*), i8* %1117)
  %1120 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %275, i32 0, i32 0
  store %FIFO* %475, %FIFO** %1120
  %1121 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %275, i32 0, i32 1
  store %FIFO* %507, %FIFO** %1121
  %1122 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %275, i32 0, i32 2
  store %FIFO* %917, %FIFO** %1122
  %1123 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %275 to i8*
  store i32* %thread_id91, i32** %276
  %1124 = bitcast i32*** %277 to i8**
  store i32** %276, i32*** %277
  %1125 = load i8*, i8** %1124
  call void @pthread_create(i8* %1125, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.91 to i8*), i8* %1123)
  %1126 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %278, i32 0, i32 0
  store %FIFO* %476, %FIFO** %1126
  %1127 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %278, i32 0, i32 1
  store %FIFO* %508, %FIFO** %1127
  %1128 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %278, i32 0, i32 2
  store %FIFO* %918, %FIFO** %1128
  %1129 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %278 to i8*
  store i32* %thread_id92, i32** %279
  %1130 = bitcast i32*** %280 to i8**
  store i32** %279, i32*** %280
  %1131 = load i8*, i8** %1130
  call void @pthread_create(i8* %1131, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.92 to i8*), i8* %1129)
  %1132 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %281, i32 0, i32 0
  store %FIFO* %477, %FIFO** %1132
  %1133 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %281, i32 0, i32 1
  store %FIFO* %509, %FIFO** %1133
  %1134 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %281, i32 0, i32 2
  store %FIFO* %919, %FIFO** %1134
  %1135 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %281 to i8*
  store i32* %thread_id93, i32** %282
  %1136 = bitcast i32*** %283 to i8**
  store i32** %282, i32*** %283
  %1137 = load i8*, i8** %1136
  call void @pthread_create(i8* %1137, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.93 to i8*), i8* %1135)
  %1138 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %284, i32 0, i32 0
  store %FIFO* %478, %FIFO** %1138
  %1139 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %284, i32 0, i32 1
  store %FIFO* %510, %FIFO** %1139
  %1140 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %284, i32 0, i32 2
  store %FIFO* %920, %FIFO** %1140
  %1141 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %284 to i8*
  store i32* %thread_id94, i32** %285
  %1142 = bitcast i32*** %286 to i8**
  store i32** %285, i32*** %286
  %1143 = load i8*, i8** %1142
  call void @pthread_create(i8* %1143, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.94 to i8*), i8* %1141)
  %1144 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %287, i32 0, i32 0
  store %FIFO* %889, %FIFO** %1144
  %1145 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %287, i32 0, i32 1
  store %FIFO* %905, %FIFO** %1145
  %1146 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %287, i32 0, i32 2
  store %FIFO* %921, %FIFO** %1146
  %1147 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %287 to i8*
  store i32* %thread_id95, i32** %288
  %1148 = bitcast i32*** %289 to i8**
  store i32** %288, i32*** %289
  %1149 = load i8*, i8** %1148
  call void @pthread_create(i8* %1149, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.95 to i8*), i8* %1147)
  %1150 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %290, i32 0, i32 0
  store %FIFO* %890, %FIFO** %1150
  %1151 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %290, i32 0, i32 1
  store %FIFO* %906, %FIFO** %1151
  %1152 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %290, i32 0, i32 2
  store %FIFO* %922, %FIFO** %1152
  %1153 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %290 to i8*
  store i32* %thread_id96, i32** %291
  %1154 = bitcast i32*** %292 to i8**
  store i32** %291, i32*** %292
  %1155 = load i8*, i8** %1154
  call void @pthread_create(i8* %1155, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.96 to i8*), i8* %1153)
  %1156 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %293, i32 0, i32 0
  store %FIFO* %891, %FIFO** %1156
  %1157 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %293, i32 0, i32 1
  store %FIFO* %907, %FIFO** %1157
  %1158 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %293, i32 0, i32 2
  store %FIFO* %923, %FIFO** %1158
  %1159 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %293 to i8*
  store i32* %thread_id97, i32** %294
  %1160 = bitcast i32*** %295 to i8**
  store i32** %294, i32*** %295
  %1161 = load i8*, i8** %1160
  call void @pthread_create(i8* %1161, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.97 to i8*), i8* %1159)
  %1162 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %296, i32 0, i32 0
  store %FIFO* %892, %FIFO** %1162
  %1163 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %296, i32 0, i32 1
  store %FIFO* %908, %FIFO** %1163
  %1164 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %296, i32 0, i32 2
  store %FIFO* %924, %FIFO** %1164
  %1165 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %296 to i8*
  store i32* %thread_id98, i32** %297
  %1166 = bitcast i32*** %298 to i8**
  store i32** %297, i32*** %298
  %1167 = load i8*, i8** %1166
  call void @pthread_create(i8* %1167, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.98 to i8*), i8* %1165)
  %1168 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %299, i32 0, i32 0
  store %FIFO* %893, %FIFO** %1168
  %1169 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %299, i32 0, i32 1
  store %FIFO* %909, %FIFO** %1169
  %1170 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %299, i32 0, i32 2
  store %FIFO* %925, %FIFO** %1170
  %1171 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %299 to i8*
  store i32* %thread_id99, i32** %300
  %1172 = bitcast i32*** %301 to i8**
  store i32** %300, i32*** %301
  %1173 = load i8*, i8** %1172
  call void @pthread_create(i8* %1173, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.99 to i8*), i8* %1171)
  %1174 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %302, i32 0, i32 0
  store %FIFO* %894, %FIFO** %1174
  %1175 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %302, i32 0, i32 1
  store %FIFO* %910, %FIFO** %1175
  %1176 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %302, i32 0, i32 2
  store %FIFO* %926, %FIFO** %1176
  %1177 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %302 to i8*
  store i32* %thread_id100, i32** %303
  %1178 = bitcast i32*** %304 to i8**
  store i32** %303, i32*** %304
  %1179 = load i8*, i8** %1178
  call void @pthread_create(i8* %1179, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.100 to i8*), i8* %1177)
  %1180 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %305, i32 0, i32 0
  store %FIFO* %895, %FIFO** %1180
  %1181 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %305, i32 0, i32 1
  store %FIFO* %911, %FIFO** %1181
  %1182 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %305, i32 0, i32 2
  store %FIFO* %927, %FIFO** %1182
  %1183 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %305 to i8*
  store i32* %thread_id101, i32** %306
  %1184 = bitcast i32*** %307 to i8**
  store i32** %306, i32*** %307
  %1185 = load i8*, i8** %1184
  call void @pthread_create(i8* %1185, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.101 to i8*), i8* %1183)
  %1186 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %308, i32 0, i32 0
  store %FIFO* %896, %FIFO** %1186
  %1187 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %308, i32 0, i32 1
  store %FIFO* %912, %FIFO** %1187
  %1188 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %308, i32 0, i32 2
  store %FIFO* %928, %FIFO** %1188
  %1189 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %308 to i8*
  store i32* %thread_id102, i32** %309
  %1190 = bitcast i32*** %310 to i8**
  store i32** %309, i32*** %310
  %1191 = load i8*, i8** %1190
  call void @pthread_create(i8* %1191, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.102 to i8*), i8* %1189)
  %1192 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %311, i32 0, i32 0
  store %FIFO* %897, %FIFO** %1192
  %1193 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %311, i32 0, i32 1
  store %FIFO* %913, %FIFO** %1193
  %1194 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %311, i32 0, i32 2
  store %FIFO* %929, %FIFO** %1194
  %1195 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %311 to i8*
  store i32* %thread_id103, i32** %312
  %1196 = bitcast i32*** %313 to i8**
  store i32** %312, i32*** %313
  %1197 = load i8*, i8** %1196
  call void @pthread_create(i8* %1197, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.103 to i8*), i8* %1195)
  %1198 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %314, i32 0, i32 0
  store %FIFO* %898, %FIFO** %1198
  %1199 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %314, i32 0, i32 1
  store %FIFO* %914, %FIFO** %1199
  %1200 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %314, i32 0, i32 2
  store %FIFO* %930, %FIFO** %1200
  %1201 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %314 to i8*
  store i32* %thread_id104, i32** %315
  %1202 = bitcast i32*** %316 to i8**
  store i32** %315, i32*** %316
  %1203 = load i8*, i8** %1202
  call void @pthread_create(i8* %1203, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.104 to i8*), i8* %1201)
  %1204 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %317, i32 0, i32 0
  store %FIFO* %899, %FIFO** %1204
  %1205 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %317, i32 0, i32 1
  store %FIFO* %915, %FIFO** %1205
  %1206 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %317, i32 0, i32 2
  store %FIFO* %931, %FIFO** %1206
  %1207 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %317 to i8*
  store i32* %thread_id105, i32** %318
  %1208 = bitcast i32*** %319 to i8**
  store i32** %318, i32*** %319
  %1209 = load i8*, i8** %1208
  call void @pthread_create(i8* %1209, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.105 to i8*), i8* %1207)
  %1210 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %320, i32 0, i32 0
  store %FIFO* %900, %FIFO** %1210
  %1211 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %320, i32 0, i32 1
  store %FIFO* %916, %FIFO** %1211
  %1212 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %320, i32 0, i32 2
  store %FIFO* %932, %FIFO** %1212
  %1213 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %320 to i8*
  store i32* %thread_id106, i32** %321
  %1214 = bitcast i32*** %322 to i8**
  store i32** %321, i32*** %322
  %1215 = load i8*, i8** %1214
  call void @pthread_create(i8* %1215, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.106 to i8*), i8* %1213)
  %1216 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %323, i32 0, i32 0
  store %FIFO* %901, %FIFO** %1216
  %1217 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %323, i32 0, i32 1
  store %FIFO* %917, %FIFO** %1217
  %1218 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %323, i32 0, i32 2
  store %FIFO* %933, %FIFO** %1218
  %1219 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %323 to i8*
  store i32* %thread_id107, i32** %324
  %1220 = bitcast i32*** %325 to i8**
  store i32** %324, i32*** %325
  %1221 = load i8*, i8** %1220
  call void @pthread_create(i8* %1221, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.107 to i8*), i8* %1219)
  %1222 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %326, i32 0, i32 0
  store %FIFO* %902, %FIFO** %1222
  %1223 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %326, i32 0, i32 1
  store %FIFO* %918, %FIFO** %1223
  %1224 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %326, i32 0, i32 2
  store %FIFO* %934, %FIFO** %1224
  %1225 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %326 to i8*
  store i32* %thread_id108, i32** %327
  %1226 = bitcast i32*** %328 to i8**
  store i32** %327, i32*** %328
  %1227 = load i8*, i8** %1226
  call void @pthread_create(i8* %1227, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.108 to i8*), i8* %1225)
  %1228 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %329, i32 0, i32 0
  store %FIFO* %903, %FIFO** %1228
  %1229 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %329, i32 0, i32 1
  store %FIFO* %919, %FIFO** %1229
  %1230 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %329, i32 0, i32 2
  store %FIFO* %935, %FIFO** %1230
  %1231 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %329 to i8*
  store i32* %thread_id109, i32** %330
  %1232 = bitcast i32*** %331 to i8**
  store i32** %330, i32*** %331
  %1233 = load i8*, i8** %1232
  call void @pthread_create(i8* %1233, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.109 to i8*), i8* %1231)
  %1234 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %332, i32 0, i32 0
  store %FIFO* %904, %FIFO** %1234
  %1235 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %332, i32 0, i32 1
  store %FIFO* %920, %FIFO** %1235
  %1236 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %332, i32 0, i32 2
  store %FIFO* %936, %FIFO** %1236
  %1237 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %332 to i8*
  store i32* %thread_id110, i32** %333
  %1238 = bitcast i32*** %334 to i8**
  store i32** %333, i32*** %334
  %1239 = load i8*, i8** %1238
  call void @pthread_create(i8* %1239, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.110 to i8*), i8* %1237)
  %1240 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %335, i32 0, i32 0
  store %FIFO* %921, %FIFO** %1240
  %1241 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %335, i32 0, i32 1
  store %FIFO* %929, %FIFO** %1241
  %1242 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %335, i32 0, i32 2
  store %FIFO* %937, %FIFO** %1242
  %1243 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %335 to i8*
  store i32* %thread_id111, i32** %336
  %1244 = bitcast i32*** %337 to i8**
  store i32** %336, i32*** %337
  %1245 = load i8*, i8** %1244
  call void @pthread_create(i8* %1245, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.111 to i8*), i8* %1243)
  %1246 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %338, i32 0, i32 0
  store %FIFO* %922, %FIFO** %1246
  %1247 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %338, i32 0, i32 1
  store %FIFO* %930, %FIFO** %1247
  %1248 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %338, i32 0, i32 2
  store %FIFO* %938, %FIFO** %1248
  %1249 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %338 to i8*
  store i32* %thread_id112, i32** %339
  %1250 = bitcast i32*** %340 to i8**
  store i32** %339, i32*** %340
  %1251 = load i8*, i8** %1250
  call void @pthread_create(i8* %1251, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.112 to i8*), i8* %1249)
  %1252 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %341, i32 0, i32 0
  store %FIFO* %923, %FIFO** %1252
  %1253 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %341, i32 0, i32 1
  store %FIFO* %931, %FIFO** %1253
  %1254 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %341, i32 0, i32 2
  store %FIFO* %939, %FIFO** %1254
  %1255 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %341 to i8*
  store i32* %thread_id113, i32** %342
  %1256 = bitcast i32*** %343 to i8**
  store i32** %342, i32*** %343
  %1257 = load i8*, i8** %1256
  call void @pthread_create(i8* %1257, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.113 to i8*), i8* %1255)
  %1258 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %344, i32 0, i32 0
  store %FIFO* %924, %FIFO** %1258
  %1259 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %344, i32 0, i32 1
  store %FIFO* %932, %FIFO** %1259
  %1260 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %344, i32 0, i32 2
  store %FIFO* %940, %FIFO** %1260
  %1261 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %344 to i8*
  store i32* %thread_id114, i32** %345
  %1262 = bitcast i32*** %346 to i8**
  store i32** %345, i32*** %346
  %1263 = load i8*, i8** %1262
  call void @pthread_create(i8* %1263, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.114 to i8*), i8* %1261)
  %1264 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %347, i32 0, i32 0
  store %FIFO* %925, %FIFO** %1264
  %1265 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %347, i32 0, i32 1
  store %FIFO* %933, %FIFO** %1265
  %1266 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %347, i32 0, i32 2
  store %FIFO* %941, %FIFO** %1266
  %1267 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %347 to i8*
  store i32* %thread_id115, i32** %348
  %1268 = bitcast i32*** %349 to i8**
  store i32** %348, i32*** %349
  %1269 = load i8*, i8** %1268
  call void @pthread_create(i8* %1269, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.115 to i8*), i8* %1267)
  %1270 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %350, i32 0, i32 0
  store %FIFO* %926, %FIFO** %1270
  %1271 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %350, i32 0, i32 1
  store %FIFO* %934, %FIFO** %1271
  %1272 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %350, i32 0, i32 2
  store %FIFO* %942, %FIFO** %1272
  %1273 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %350 to i8*
  store i32* %thread_id116, i32** %351
  %1274 = bitcast i32*** %352 to i8**
  store i32** %351, i32*** %352
  %1275 = load i8*, i8** %1274
  call void @pthread_create(i8* %1275, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.116 to i8*), i8* %1273)
  %1276 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %353, i32 0, i32 0
  store %FIFO* %927, %FIFO** %1276
  %1277 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %353, i32 0, i32 1
  store %FIFO* %935, %FIFO** %1277
  %1278 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %353, i32 0, i32 2
  store %FIFO* %943, %FIFO** %1278
  %1279 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %353 to i8*
  store i32* %thread_id117, i32** %354
  %1280 = bitcast i32*** %355 to i8**
  store i32** %354, i32*** %355
  %1281 = load i8*, i8** %1280
  call void @pthread_create(i8* %1281, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.117 to i8*), i8* %1279)
  %1282 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %356, i32 0, i32 0
  store %FIFO* %928, %FIFO** %1282
  %1283 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %356, i32 0, i32 1
  store %FIFO* %936, %FIFO** %1283
  %1284 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %356, i32 0, i32 2
  store %FIFO* %944, %FIFO** %1284
  %1285 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %356 to i8*
  store i32* %thread_id118, i32** %357
  %1286 = bitcast i32*** %358 to i8**
  store i32** %357, i32*** %358
  %1287 = load i8*, i8** %1286
  call void @pthread_create(i8* %1287, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.118 to i8*), i8* %1285)
  %1288 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %359, i32 0, i32 0
  store %FIFO* %937, %FIFO** %1288
  %1289 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %359, i32 0, i32 1
  store %FIFO* %941, %FIFO** %1289
  %1290 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %359, i32 0, i32 2
  store %FIFO* %945, %FIFO** %1290
  %1291 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %359 to i8*
  store i32* %thread_id119, i32** %360
  %1292 = bitcast i32*** %361 to i8**
  store i32** %360, i32*** %361
  %1293 = load i8*, i8** %1292
  call void @pthread_create(i8* %1293, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.119 to i8*), i8* %1291)
  %1294 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %362, i32 0, i32 0
  store %FIFO* %938, %FIFO** %1294
  %1295 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %362, i32 0, i32 1
  store %FIFO* %942, %FIFO** %1295
  %1296 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %362, i32 0, i32 2
  store %FIFO* %946, %FIFO** %1296
  %1297 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %362 to i8*
  store i32* %thread_id120, i32** %363
  %1298 = bitcast i32*** %364 to i8**
  store i32** %363, i32*** %364
  %1299 = load i8*, i8** %1298
  call void @pthread_create(i8* %1299, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.120 to i8*), i8* %1297)
  %1300 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %365, i32 0, i32 0
  store %FIFO* %939, %FIFO** %1300
  %1301 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %365, i32 0, i32 1
  store %FIFO* %943, %FIFO** %1301
  %1302 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %365, i32 0, i32 2
  store %FIFO* %947, %FIFO** %1302
  %1303 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %365 to i8*
  store i32* %thread_id121, i32** %366
  %1304 = bitcast i32*** %367 to i8**
  store i32** %366, i32*** %367
  %1305 = load i8*, i8** %1304
  call void @pthread_create(i8* %1305, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.121 to i8*), i8* %1303)
  %1306 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %368, i32 0, i32 0
  store %FIFO* %940, %FIFO** %1306
  %1307 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %368, i32 0, i32 1
  store %FIFO* %944, %FIFO** %1307
  %1308 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %368, i32 0, i32 2
  store %FIFO* %948, %FIFO** %1308
  %1309 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %368 to i8*
  store i32* %thread_id122, i32** %369
  %1310 = bitcast i32*** %370 to i8**
  store i32** %369, i32*** %370
  %1311 = load i8*, i8** %1310
  call void @pthread_create(i8* %1311, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.122 to i8*), i8* %1309)
  %1312 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %371, i32 0, i32 0
  store %FIFO* %945, %FIFO** %1312
  %1313 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %371, i32 0, i32 1
  store %FIFO* %947, %FIFO** %1313
  %1314 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %371, i32 0, i32 2
  store %FIFO* %949, %FIFO** %1314
  %1315 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %371 to i8*
  store i32* %thread_id123, i32** %372
  %1316 = bitcast i32*** %373 to i8**
  store i32** %372, i32*** %373
  %1317 = load i8*, i8** %1316
  call void @pthread_create(i8* %1317, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.123 to i8*), i8* %1315)
  %1318 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %374, i32 0, i32 0
  store %FIFO* %946, %FIFO** %1318
  %1319 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %374, i32 0, i32 1
  store %FIFO* %948, %FIFO** %1319
  %1320 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %374, i32 0, i32 2
  store %FIFO* %950, %FIFO** %1320
  %1321 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %374 to i8*
  store i32* %thread_id124, i32** %375
  %1322 = bitcast i32*** %376 to i8**
  store i32** %375, i32*** %376
  %1323 = load i8*, i8** %1322
  call void @pthread_create(i8* %1323, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.124 to i8*), i8* %1321)
  %1324 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %377, i32 0, i32 0
  store %FIFO* %949, %FIFO** %1324
  %1325 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %377, i32 0, i32 1
  store %FIFO* %950, %FIFO** %1325
  %1326 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO* }* %377, i32 0, i32 2
  store %FIFO* %951, %FIFO** %1326
  %1327 = bitcast { %FIFO*, %FIFO*, %FIFO* }* %377 to i8*
  store i32* %thread_id125, i32** %378
  %1328 = bitcast i32*** %379 to i8**
  store i32** %378, i32*** %379
  %1329 = load i8*, i8** %1328
  call void @pthread_create(i8* %1329, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.125 to i8*), i8* %1327)
  %1330 = load { i8*, i64, i64 }, { i8*, i64, i64 }* @main.input
  %1331 = extractvalue { i8*, i64, i64 } %1330, 1
  br label %.1.rangeindex.loop

.1.rangeindex.loop:                               ; preds = %.2.rangeindex.body, %.0.entry
  %1332 = phi i64 [ -1, %.0.entry ], [ %1333, %.2.rangeindex.body ]
  %1333 = add i64 %1332, 1
  %1334 = icmp slt i64 %1333, %1331
  %1335 = zext i1 %1334 to i8
  %1336 = trunc i8 %1335 to i1
  br i1 %1336, label %.2.rangeindex.body, label %.3.rangeindex.done

.2.rangeindex.body:                               ; preds = %.1.rangeindex.loop
  %1337 = extractvalue { i8*, i64, i64 } %1330, 0
  %1338 = bitcast i8* %1337 to i64*
  %1339 = getelementptr i64, i64* %1338, i64 %1333
  %1340 = bitcast i64* %1339 to i8*
  %1341 = bitcast i8* %1340 to i64*
  %1342 = load i64, i64* %1341
  call void @fifo_write(%FIFO* %384, i64 %1342)
  br label %.1.rangeindex.loop

.3.rangeindex.done:                               ; preds = %.1.rangeindex.loop
  call void @fifo_write(%FIFO* %384, i64 -1)
  %1343 = load { i8*, i64, i64 }, { i8*, i64, i64 }* @main.input
  %1344 = extractvalue { i8*, i64, i64 } %1343, 1
  call void @__go_make_slice2({ i8*, i64, i64 }* sret %380, i8* nest undef, i8* getelementptr inbounds (%sliceType, %sliceType* @__go_td_AN3_inte, i32 0, i32 0, i32 0), i64 %1344, i64 %1344)
  %1345 = load { i8*, i64, i64 }, { i8*, i64, i64 }* %380
  %1346 = load { i8*, i64, i64 }, { i8*, i64, i64 }* @main.input
  %1347 = extractvalue { i8*, i64, i64 } %1346, 1
  br label %.4.rangeindex.loop

.4.rangeindex.loop:                               ; preds = %.5.rangeindex.body, %.3.rangeindex.done
  %1348 = phi i64 [ -1, %.3.rangeindex.done ], [ %1349, %.5.rangeindex.body ]
  %1349 = add i64 %1348, 1
  %1350 = icmp slt i64 %1349, %1347
  %1351 = zext i1 %1350 to i8
  %1352 = trunc i8 %1351 to i1
  br i1 %1352, label %.5.rangeindex.body, label %.6.rangeindex.done

.5.rangeindex.body:                               ; preds = %.4.rangeindex.loop
  %1353 = extractvalue { i8*, i64, i64 } %1345, 0
  %1354 = bitcast i8* %1353 to i64*
  %1355 = getelementptr i64, i64* %1354, i64 %1349
  %1356 = bitcast i64* %1355 to i8*
  %1357 = call i64 @fifo_read(%FIFO* %951)
  store i64 %1357, i64* %381
  %1358 = load i64, i64* %381
  %1359 = bitcast i8* %1356 to i64*
  store i64 %1358, i64* %1359
  %1360 = extractvalue { i8*, i64, i64 } %1345, 0
  %1361 = bitcast i8* %1360 to i64*
  %1362 = getelementptr i64, i64* %1361, i64 %1349
  %1363 = bitcast i64* %1362 to i8*
  %1364 = bitcast i8* %1363 to i64*
  %1365 = load i64, i64* %1364
  br label %.4.rangeindex.loop

.6.rangeindex.done:                               ; preds = %.4.rangeindex.loop
  store { i8*, i64, i64 } %1345, { i8*, i64, i64 }* %382
  call void @main.checkSort(i8* nest undef, { i8*, i64, i64 }* byval %382)
  ret void
}

define internal void @7(i8*) #0 {
prologue:
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
  call void @7(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @8(i8*) #0 {
prologue:
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
  call void @8(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @9(i8*) #0 {
prologue:
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
  call void @9(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @10(i8*) #0 {
prologue:
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
  call void @10(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @11(i8*) #0 {
prologue:
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
  call void @11(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @12(i8*) #0 {
prologue:
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
  call void @12(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @13(i8*) #0 {
prologue:
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
  call void @13(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @14(i8*) #0 {
prologue:
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
  call void @14(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @15(i8*) #0 {
prologue:
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
  call void @15(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @16(i8*) #0 {
prologue:
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
  call void @16(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @17(i8*) #0 {
prologue:
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
  call void @17(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
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

define internal i8* @auto_pthread_wrapper.11(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.12(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.13(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.14(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.15(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.16(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.17(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.18(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.19(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.20(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.21(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.22(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.23(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.24(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.25(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.26(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.27(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.28(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.29(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.30(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.31(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.32(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.33(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.34(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.35(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.36(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.37(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.38(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.39(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.40(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.41(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.42(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.43(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.44(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.45(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.46(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.47(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.48(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.49(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.50(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.51(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.52(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.53(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.54(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.55(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.56(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.57(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.58(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.59(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.60(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.61(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.62(i8*) #0 {
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
  call void @main.merge(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.64(i8*) #0 {
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
  call void @main.merge(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.65(i8*) #0 {
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
  call void @main.merge(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.66(i8*) #0 {
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
  call void @main.merge(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.67(i8*) #0 {
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
  call void @main.merge(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.68(i8*) #0 {
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
  call void @main.merge(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.69(i8*) #0 {
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
  call void @main.merge(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.70(i8*) #0 {
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
  call void @main.merge(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.71(i8*) #0 {
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
  call void @main.merge(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.72(i8*) #0 {
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
  call void @main.merge(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7)
  ret void
}

define internal i8* @auto_pthread_wrapper.73(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.74(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.75(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.76(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.77(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.78(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.79(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.80(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.81(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.82(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.83(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.84(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.85(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.86(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.87(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.88(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.89(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.90(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.91(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.92(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.93(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.94(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.95(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.96(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.97(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.98(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.99(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.100(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.101(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.102(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.103(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.104(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.105(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.106(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.107(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.108(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.109(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.110(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.111(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.112(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.113(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.114(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.115(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.116(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.117(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.118(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.119(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.120(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.121(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.122(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.123(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.124(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.125(i8*) #0 {
entry:
  call void @132(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define void @__go_init_main(i8*) #0 {
entry:
  ret void
}

attributes #0 = { "disable-tail-calls"="true" "split-stack" }

!0 = !{!"branch_weights", i32 1, i32 1000}
