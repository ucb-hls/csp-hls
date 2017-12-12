package main

import "fmt"

var input []int

func divide(in chan int, out_left, out_right chan int) {
   for i := 0;; i++ {
		l := <- in
		if l == -1  {
			// Order matters if channels are not buffered:
			out_left <- -1
			out_right <- -1
			continue
		}
		r := <- in
		//fmt.Printf("splitting %d left and %d right\n", l, r)
		out_left <- l
		out_right <- r
	}
}

func merge(in_left, in_right chan int, out chan int) {
	//fmt.Println("merge waiting for data...")
	l := <- in_left
	r := <- in_right
	for {
		if l == -1 && r == -1 {
		   out <- -1
			//fmt.Println("both channels ended. merge waiting for data...")
			l = <- in_left
			r = <- in_right
			// discard
			continue
		} else if l == -1 {
			//fmt.Println("left channel ended. fetching right")
			out <- r
			r = <- in_right
		} else if r == -1 {
			//fmt.Println("right channel ended. fetching left")
			out <- l
			l = <- in_left
		} else if r <= l {
			out <- r
			//fmt.Println("replacing right")
			r = <- in_right
		} else if l <= r {
			out <- l
			//fmt.Println("replacing left")
			l = <- in_left
		} else {
			//fmt.Println("shit")
		}
	}
}

func checkSort(arr []int) {
	y := arr[0] 
	for _, x := range(arr[1:]) {
		if y > x {
			fmt.Println("not sorted,", y, ">", x)
			return
		}
		y = x
	}
	fmt.Println("sorted")
	return
}

func main() {
	load_values()

	checkSort(input)

	i0 := make(chan int)

	d0 := make(chan int)
	d1 := make(chan int)

	d2 := make(chan int)
	d3 := make(chan int)
	d4 := make(chan int)
	d5 := make(chan int)

	d6 := make(chan int)
	d7 := make(chan int)
	d8 := make(chan int)
	d9 := make(chan int)
	d10 := make(chan int)
	d11 := make(chan int)
	d12 := make(chan int)
	d13 := make(chan int)

	d14 := make(chan int)
	d15 := make(chan int)
	d16 := make(chan int)
	d17 := make(chan int)
	d18 := make(chan int)
	d19 := make(chan int)
	d20 := make(chan int)
	d21 := make(chan int)
	d22 := make(chan int)
	d23 := make(chan int)
	d24 := make(chan int)
	d25 := make(chan int)
	d26 := make(chan int)
	d27 := make(chan int)
	d28 := make(chan int)
	d29 := make(chan int)

	d30 := make(chan int)
	d31 := make(chan int)
	d32 := make(chan int)
	d33 := make(chan int)
	d34 := make(chan int)
	d35 := make(chan int)
	d36 := make(chan int)
	d37 := make(chan int)
	d38 := make(chan int)
	d39 := make(chan int)
	d40 := make(chan int)
	d41 := make(chan int)
	d42 := make(chan int)
	d43 := make(chan int)
	d44 := make(chan int)
	d45 := make(chan int)
	d46 := make(chan int)
	d47 := make(chan int)
	d48 := make(chan int)
	d49 := make(chan int)
	d50 := make(chan int)
	d51 := make(chan int)
	d52 := make(chan int)
	d53 := make(chan int)
	d54 := make(chan int)
	d55 := make(chan int)
	d56 := make(chan int)
	d57 := make(chan int)
	d58 := make(chan int)
	d59 := make(chan int)
	d60 := make(chan int)
	d61 := make(chan int)

	d62 := make(chan int)
	d63 := make(chan int)
	d64 := make(chan int)
	d65 := make(chan int)
	d66 := make(chan int)
	d67 := make(chan int)
	d68 := make(chan int)
	d69 := make(chan int)
	d70 := make(chan int)
	d71 := make(chan int)
	d72 := make(chan int)
	d73 := make(chan int)
	d74 := make(chan int)
	d75 := make(chan int)
	d76 := make(chan int)
	d77 := make(chan int)
	d78 := make(chan int)
	d79 := make(chan int)
	d80 := make(chan int)
	d81 := make(chan int)
	d82 := make(chan int)
	d83 := make(chan int)
	d84 := make(chan int)
	d85 := make(chan int)
	d86 := make(chan int)
	d87 := make(chan int)
	d88 := make(chan int)
	d89 := make(chan int)
	d90 := make(chan int)
	d91 := make(chan int)
	d92 := make(chan int)
	d93 := make(chan int)
	d94 := make(chan int)
	d95 := make(chan int)
	d96 := make(chan int)
	d97 := make(chan int)
	d98 := make(chan int)
	d99 := make(chan int)
	d100 := make(chan int)
	d101 := make(chan int)
	d102 := make(chan int)
	d103 := make(chan int)
	d104 := make(chan int)
	d105 := make(chan int)
	d106 := make(chan int)
	d107 := make(chan int)
	d108 := make(chan int)
	d109 := make(chan int)
	d110 := make(chan int)
	d111 := make(chan int)
	d112 := make(chan int)
	d113 := make(chan int)
	d114 := make(chan int)
	d115 := make(chan int)
	d116 := make(chan int)
	d117 := make(chan int)
	d118 := make(chan int)
	d119 := make(chan int)
	d120 := make(chan int)
	d121 := make(chan int)
	d122 := make(chan int)
	d123 := make(chan int)
	d124 := make(chan int)
	d125 := make(chan int)

	d126 := make(chan int)
	d127 := make(chan int)
	d128 := make(chan int)
	d129 := make(chan int)
	d130 := make(chan int)
	d131 := make(chan int)
	d132 := make(chan int)
	d133 := make(chan int)
	d134 := make(chan int)
	d135 := make(chan int)
	d136 := make(chan int)
	d137 := make(chan int)
	d138 := make(chan int)
	d139 := make(chan int)
	d140 := make(chan int)
	d141 := make(chan int)
	d142 := make(chan int)
	d143 := make(chan int)
	d144 := make(chan int)
	d145 := make(chan int)
	d146 := make(chan int)
	d147 := make(chan int)
	d148 := make(chan int)
	d149 := make(chan int)
	d150 := make(chan int)
	d151 := make(chan int)
	d152 := make(chan int)
	d153 := make(chan int)
	d154 := make(chan int)
	d155 := make(chan int)
	d156 := make(chan int)
	d157 := make(chan int)
	d158 := make(chan int)
	d159 := make(chan int)
	d160 := make(chan int)
	d161 := make(chan int)
	d162 := make(chan int)
	d163 := make(chan int)
	d164 := make(chan int)
	d165 := make(chan int)
	d166 := make(chan int)
	d167 := make(chan int)
	d168 := make(chan int)
	d169 := make(chan int)
	d170 := make(chan int)
	d171 := make(chan int)
	d172 := make(chan int)
	d173 := make(chan int)
	d174 := make(chan int)
	d175 := make(chan int)
	d176 := make(chan int)
	d177 := make(chan int)
	d178 := make(chan int)
	d179 := make(chan int)
	d180 := make(chan int)
	d181 := make(chan int)
	d182 := make(chan int)
	d183 := make(chan int)
	d184 := make(chan int)
	d185 := make(chan int)
	d186 := make(chan int)
	d187 := make(chan int)
	d188 := make(chan int)
	d189 := make(chan int)
	d190 := make(chan int)
	d191 := make(chan int)
	d192 := make(chan int)
	d193 := make(chan int)
	d194 := make(chan int)
	d195 := make(chan int)
	d196 := make(chan int)
	d197 := make(chan int)
	d198 := make(chan int)
	d199 := make(chan int)
	d200 := make(chan int)
	d201 := make(chan int)
	d202 := make(chan int)
	d203 := make(chan int)
	d204 := make(chan int)
	d205 := make(chan int)
	d206 := make(chan int)
	d207 := make(chan int)
	d208 := make(chan int)
	d209 := make(chan int)
	d210 := make(chan int)
	d211 := make(chan int)
	d212 := make(chan int)
	d213 := make(chan int)
	d214 := make(chan int)
	d215 := make(chan int)
	d216 := make(chan int)
	d217 := make(chan int)
	d218 := make(chan int)
	d219 := make(chan int)
	d220 := make(chan int)
	d221 := make(chan int)
	d222 := make(chan int)
	d223 := make(chan int)
	d224 := make(chan int)
	d225 := make(chan int)
	d226 := make(chan int)
	d227 := make(chan int)
	d228 := make(chan int)
	d229 := make(chan int)
	d230 := make(chan int)
	d231 := make(chan int)
	d232 := make(chan int)
	d233 := make(chan int)
	d234 := make(chan int)
	d235 := make(chan int)
	d236 := make(chan int)
	d237 := make(chan int)
	d238 := make(chan int)
	d239 := make(chan int)
	d240 := make(chan int)
	d241 := make(chan int)
	d242 := make(chan int)
	d243 := make(chan int)
	d244 := make(chan int)
	d245 := make(chan int)
	d246 := make(chan int)
	d247 := make(chan int)
	d248 := make(chan int)
	d249 := make(chan int)
	d250 := make(chan int)
	d251 := make(chan int)
	d252 := make(chan int)
	d253 := make(chan int)

	go divide(i0, d0, d1)

	go divide(d0, d2, d3)
	go divide(d1, d4, d5)

	go divide(d2, d6, d7)
	go divide(d3, d8, d9)
	go divide(d4, d10, d11)
	go divide(d5, d12, d13)

	go divide(d6, d14, d15)
	go divide(d7, d16, d17)
	go divide(d8, d18, d19)
	go divide(d9, d20, d21)
	go divide(d10, d22, d23)
	go divide(d11, d24, d25)
	go divide(d12, d26, d27)
	go divide(d13, d28, d29)

	go divide(d14, d30, d31)
	go divide(d15, d32, d33)
	go divide(d16, d34, d35)
	go divide(d17, d36, d37)
	go divide(d18, d38, d39)
	go divide(d19, d40, d41)
	go divide(d20, d42, d43)
	go divide(d21, d44, d45)
	go divide(d22, d46, d47)
	go divide(d23, d48, d49)
	go divide(d24, d50, d51)
	go divide(d25, d52, d53)
	go divide(d26, d54, d55)
	go divide(d27, d56, d57)
	go divide(d28, d58, d59)
	go divide(d29, d60, d61)

	go divide(d30, d62, d63)
	go divide(d31, d64, d65)
	go divide(d32, d66, d67)
	go divide(d33, d68, d69)
	go divide(d34, d70, d71)
	go divide(d35, d72, d73)
	go divide(d36, d74, d75)
	go divide(d37, d76, d77)
	go divide(d38, d78, d79)
	go divide(d39, d80, d81)
	go divide(d40, d82, d83)
	go divide(d41, d84, d85)
	go divide(d42, d86, d87)
	go divide(d43, d88, d89)
	go divide(d44, d90, d91)
	go divide(d45, d92, d93)
	go divide(d46, d94, d95)
	go divide(d47, d96, d97)
	go divide(d48, d98, d99)
	go divide(d49, d100, d101)
	go divide(d50, d102, d103)
	go divide(d51, d104, d105)
	go divide(d52, d106, d107)
	go divide(d53, d108, d109)
	go divide(d54, d110, d111)
	go divide(d55, d112, d113)
	go divide(d56, d114, d115)
	go divide(d57, d116, d117)
	go divide(d58, d118, d119)
	go divide(d59, d120, d121)
	go divide(d60, d122, d123)
	go divide(d61, d124, d125)

	// These produce the final outputs of the mapping/distribution stage.
	go divide(d62, d126, d127)
	go divide(d63, d128, d129)
	go divide(d64, d130, d131)
	go divide(d65, d132, d133)
	go divide(d66, d134, d135)
	go divide(d67, d136, d137)
	go divide(d68, d138, d139)
	go divide(d69, d140, d141)
	go divide(d70, d142, d143)
	go divide(d71, d144, d145)
	go divide(d72, d146, d147)
	go divide(d73, d148, d149)
	go divide(d74, d150, d151)
	go divide(d75, d152, d153)
	go divide(d76, d154, d155)
	go divide(d77, d156, d157)
	go divide(d78, d158, d159)
	go divide(d79, d160, d161)
	go divide(d80, d162, d163)
	go divide(d81, d164, d165)
	go divide(d82, d166, d167)
	go divide(d83, d168, d169)
	go divide(d84, d170, d171)
	go divide(d85, d172, d173)
	go divide(d86, d174, d175)
	go divide(d87, d176, d177)
	go divide(d88, d178, d179)
	go divide(d89, d180, d181)
	go divide(d90, d182, d183)
	go divide(d91, d184, d185)
	go divide(d92, d186, d187)
	go divide(d93, d188, d189)
	go divide(d94, d190, d191)
	go divide(d95, d192, d193)
	go divide(d96, d194, d195)
	go divide(d97, d196, d197)
	go divide(d98, d198, d199)
	go divide(d99, d200, d201)
	go divide(d100, d202, d203)
	go divide(d101, d204, d205)
	go divide(d102, d206, d207)
	go divide(d103, d208, d209)
	go divide(d104, d210, d211)
	go divide(d105, d212, d213)
	go divide(d106, d214, d215)
	go divide(d107, d216, d217)
	go divide(d108, d218, d219)
	go divide(d109, d220, d221)
	go divide(d110, d222, d223)
	go divide(d111, d224, d225)
	go divide(d112, d226, d227)
	go divide(d113, d228, d229)
	go divide(d114, d230, d231)
	go divide(d115, d232, d233)
	go divide(d116, d234, d235)
	go divide(d117, d236, d237)
	go divide(d118, d238, d239)
	go divide(d119, d240, d241)
	go divide(d120, d242, d243)
	go divide(d121, d244, d245)
	go divide(d122, d246, d247)
	go divide(d123, d248, d249)
	go divide(d124, d250, d251)
	go divide(d125, d252, d253)

	m0 := make(chan int)
	m1 := make(chan int)
	m2 := make(chan int)
	m3 := make(chan int)
	m4 := make(chan int)
	m5 := make(chan int)
	m6 := make(chan int)
	m7 := make(chan int)
	m8 := make(chan int)
	m9 := make(chan int)
	m10 := make(chan int)
	m11 := make(chan int)
	m12 := make(chan int)
	m13 := make(chan int)
	m14 := make(chan int)
	m15 := make(chan int)
	m16 := make(chan int)
	m17 := make(chan int)
	m18 := make(chan int)
	m19 := make(chan int)
	m20 := make(chan int)
	m21 := make(chan int)
	m22 := make(chan int)
	m23 := make(chan int)
	m24 := make(chan int)
	m25 := make(chan int)
	m26 := make(chan int)
	m27 := make(chan int)
	m28 := make(chan int)
	m29 := make(chan int)
	m30 := make(chan int)
	m31 := make(chan int)
	m32 := make(chan int)
	m33 := make(chan int)
	m34 := make(chan int)
	m35 := make(chan int)
	m36 := make(chan int)
	m37 := make(chan int)
	m38 := make(chan int)
	m39 := make(chan int)
	m40 := make(chan int)
	m41 := make(chan int)
	m42 := make(chan int)
	m43 := make(chan int)
	m44 := make(chan int)
	m45 := make(chan int)
	m46 := make(chan int)
	m47 := make(chan int)
	m48 := make(chan int)
	m49 := make(chan int)
	m50 := make(chan int)
	m51 := make(chan int)
	m52 := make(chan int)
	m53 := make(chan int)
	m54 := make(chan int)
	m55 := make(chan int)
	m56 := make(chan int)
	m57 := make(chan int)
	m58 := make(chan int)
	m59 := make(chan int)
	m60 := make(chan int)
	m61 := make(chan int)
	m62 := make(chan int)
	m63 := make(chan int)
	m64 := make(chan int)
	m65 := make(chan int)
	m66 := make(chan int)
	m67 := make(chan int)
	m68 := make(chan int)
	m69 := make(chan int)
	m70 := make(chan int)
	m71 := make(chan int)
	m72 := make(chan int)
	m73 := make(chan int)
	m74 := make(chan int)
	m75 := make(chan int)
	m76 := make(chan int)
	m77 := make(chan int)
	m78 := make(chan int)
	m79 := make(chan int)
	m80 := make(chan int)
	m81 := make(chan int)
	m82 := make(chan int)
	m83 := make(chan int)
	m84 := make(chan int)
	m85 := make(chan int)
	m86 := make(chan int)
	m87 := make(chan int)
	m88 := make(chan int)
	m89 := make(chan int)
	m90 := make(chan int)
	m91 := make(chan int)
	m92 := make(chan int)
	m93 := make(chan int)
	m94 := make(chan int)
	m95 := make(chan int)
	m96 := make(chan int)
	m97 := make(chan int)
	m98 := make(chan int)
	m99 := make(chan int)
	m100 := make(chan int)
	m101 := make(chan int)
	m102 := make(chan int)
	m103 := make(chan int)
	m104 := make(chan int)
	m105 := make(chan int)
	m106 := make(chan int)
	m107 := make(chan int)
	m108 := make(chan int)
	m109 := make(chan int)
	m110 := make(chan int)
	m111 := make(chan int)
	m112 := make(chan int)
	m113 := make(chan int)
	m114 := make(chan int)
	m115 := make(chan int)
	m116 := make(chan int)
	m117 := make(chan int)
	m118 := make(chan int)
	m119 := make(chan int)
	m120 := make(chan int)
	m121 := make(chan int)
	m122 := make(chan int)
	m123 := make(chan int)
	m124 := make(chan int)
	m125 := make(chan int)
	m126 := make(chan int)

	go merge(d126, d190, m0)
	go merge(d127, d191, m1)
	go merge(d128, d192, m2)
	go merge(d129, d193, m3)
	go merge(d130, d194, m4)
	go merge(d131, d195, m5)
	go merge(d132, d196, m6)
	go merge(d133, d197, m7)
	go merge(d134, d198, m8)
	go merge(d135, d199, m9)
	go merge(d136, d200, m10)
	go merge(d137, d201, m11)
	go merge(d138, d202, m12)
	go merge(d139, d203, m13)
	go merge(d140, d204, m14)
	go merge(d141, d205, m15)
	go merge(d142, d206, m16)
	go merge(d143, d207, m17)
	go merge(d144, d208, m18)
	go merge(d145, d209, m19)
	go merge(d146, d210, m20)
	go merge(d147, d211, m21)
	go merge(d148, d212, m22)
	go merge(d149, d213, m23)
	go merge(d150, d214, m24)
	go merge(d151, d215, m25)
	go merge(d152, d216, m26)
	go merge(d153, d217, m27)
	go merge(d154, d218, m28)
	go merge(d155, d219, m29)
	go merge(d156, d220, m30)
	go merge(d157, d221, m31)
	go merge(d158, d222, m32)
	go merge(d159, d223, m33)
	go merge(d160, d224, m34)
	go merge(d161, d225, m35)
	go merge(d162, d226, m36)
	go merge(d163, d227, m37)
	go merge(d164, d228, m38)
	go merge(d165, d229, m39)
	go merge(d166, d230, m40)
	go merge(d167, d231, m41)
	go merge(d168, d232, m42)
	go merge(d169, d233, m43)
	go merge(d170, d234, m44)
	go merge(d171, d235, m45)
	go merge(d172, d236, m46)
	go merge(d173, d237, m47)
	go merge(d174, d238, m48)
	go merge(d175, d239, m49)
	go merge(d176, d240, m50)
	go merge(d177, d241, m51)
	go merge(d178, d242, m52)
	go merge(d179, d243, m53)
	go merge(d180, d244, m54)
	go merge(d181, d245, m55)
	go merge(d182, d246, m56)
	go merge(d183, d247, m57)
	go merge(d184, d248, m58)
	go merge(d185, d249, m59)
	go merge(d186, d250, m60)
	go merge(d187, d251, m61)
	go merge(d188, d252, m62)
	go merge(d189, d253, m63)

	go merge(m0, m32, m64)
	go merge(m1, m33, m65)
	go merge(m2, m34, m66)
	go merge(m3, m35, m67)
	go merge(m4, m36, m68)
	go merge(m5, m37, m69)
	go merge(m6, m38, m70)
	go merge(m7, m39, m71)
	go merge(m8, m40, m72)
	go merge(m9, m41, m73)
	go merge(m10, m42, m74)
	go merge(m11, m43, m75)
	go merge(m12, m44, m76)
	go merge(m13, m45, m77)
	go merge(m14, m46, m78)
	go merge(m15, m47, m79)
	go merge(m16, m48, m80)
	go merge(m17, m49, m81)
	go merge(m18, m50, m82)
	go merge(m19, m51, m83)
	go merge(m20, m52, m84)
	go merge(m21, m53, m85)
	go merge(m22, m54, m86)
	go merge(m23, m55, m87)
	go merge(m24, m56, m88)
	go merge(m25, m57, m89)
	go merge(m26, m58, m90)
	go merge(m27, m59, m91)
	go merge(m28, m60, m92)
	go merge(m29, m61, m93)
	go merge(m30, m62, m94)
	go merge(m31, m63, m95)

	go merge(m64, m80, m96)
	go merge(m65, m81, m97)
	go merge(m66, m82, m98)
	go merge(m67, m83, m99)
	go merge(m68, m84, m100)
	go merge(m69, m85, m101)
	go merge(m70, m86, m102)
	go merge(m71, m87, m103)
	go merge(m72, m88, m104)
	go merge(m73, m89, m105)
	go merge(m74, m90, m106)
	go merge(m75, m91, m107)
	go merge(m76, m92, m108)
	go merge(m77, m93, m109)
	go merge(m78, m94, m110)
	go merge(m79, m95, m111)

	go merge(m96, m104, m112)
	go merge(m97, m105, m113)
	go merge(m98, m106, m114)
	go merge(m99, m107, m115)
	go merge(m100, m108, m116)
	go merge(m101, m109, m117)
	go merge(m102, m110, m118)
	go merge(m103, m111, m119)

	go merge(m112, m116, m120)
	go merge(m113, m117, m121)
	go merge(m114, m118, m122)
	go merge(m115, m119, m123)

	go merge(m120, m122, m124)
	go merge(m121, m123, m125)

	go merge(m124, m125, m126)

	output_chan := m126

	fmt.Println("# inputs:", len(input))

	for _, x := range(input) {
		i0 <- x
	}
	i0 <- -1

	maybe := make([]int, len(input))

	for i := range(input) {
		maybe[i] =<- output_chan
		fmt.Printf("%d, ", maybe[i])
		if i % 8 == 7 {
			fmt.Printf("\n")
		}
	}

	checkSort(maybe)
}

// This is 32x32 = 2^10 = 1024 random integers between 0 and 32-bit uint max.
// Generated in Matlab with randi(intmax('uint32'), 32).
func load_values() {
	input = []int{
		1235761368, 3734338523, 26045387, 3593626455, 2624025978, 1047314994, 249162010, 1136607568,
		2697783015, 1028460327, 1604041314, 2395687063, 829816908, 3512856069, 872151033, 3564893569,
		1883155559, 3926769788, 2300858727, 908258304, 2594954262, 3269837735, 1013565733, 2928781266,
		3062120167, 1225708050, 3767424270, 3199502442, 1702651580, 952209131, 250265838, 1684768425,
		213668974, 337964090, 2474628599, 827888263, 990764384, 2482066059, 1616513204, 1241153464,
		2325506692, 3336413292, 1743884936, 3527008682, 857170, 2924828567, 688309556, 859484738,
		2971824392, 1720950776, 3104896070, 156691467, 2344632603, 3741896403, 188579560, 334829707,
		1129787860, 955246496, 2431486451, 2981583155, 2651437058, 3687511230, 2273517397, 3025290067,
		2894245200, 1942928367, 2258053571, 3848661259, 2222038483, 2686925273, 3442776410, 2831365696,
		1070940061, 1388297898, 18687223, 1607479964, 1342410857, 1952136165, 2869034817, 2791120240,
		2952991, 1359631527, 1014283887, 2987183663, 3335203669, 2097839153, 3877339232, 1196102363,
		2083234033, 661722357, 2729648155, 1602437763, 1522245321, 2221291320, 1828700760, 1365074511,
		2968066978, 805651708, 544380992, 340740524, 2245809894, 3215966230, 1986713915, 278422354,
		1211743289, 791422096, 2794082828, 2315859199, 2278300586, 4131312073, 242161714, 1715968229,
		3047239700, 1107991604, 2482810377, 1532185308, 4120945155, 274154457, 1808146213, 1746749344,
		478885317, 804500403, 233911012, 2888944526, 1922137168, 1475190126, 2218721552, 3644993925}//,
//		2176147541, 3207234945, 4264724918, 1748963022, 3336519057, 3660780864, 48953950, 4088032058,
//		1675138339, 1666109690, 3298948360, 1629655455, 3488126543, 3623549285, 2361625573, 2385392337,
//		1096822721, 2261409905, 369485933, 3858424250, 3563691714, 1886773567, 1610763037, 744913414,
//		994491837, 3018967130, 254817593, 3832249498, 3188322280, 1767387108, 3723846227, 2320401887,
//		2825331657, 3699718228, 1970906701, 1909070149, 3652127269, 2929386185, 1124252573, 3348782915,
//		755228850, 709027581, 1814744757, 1726475461, 3443922193, 4292425378, 2189390285, 2839079169,
//		1352702407, 1820581954, 2930535655, 340805926, 3589296602, 571826360, 4029481711, 3013045242,
//		1759215076, 1189563358, 3353096265, 1635691595, 1140867327, 3950238990, 931092356, 1979668474,
//		2886829844, 1067612742, 2854865441, 2853421453, 1823041626, 1309519975, 2998583525, 999442275,
//		2512519415, 2632113372, 458854765, 1005642091, 4044665877, 1675130948, 2100044098, 1175256810,
//		2864914129, 1812251018, 1063558948, 94815362, 3885081904, 2625536099, 4056034825, 4211197206,
//		3607174127, 3434052696, 4234346616, 1824112863, 3391791827, 2896341899, 4113114333, 3802914500,
//		1942430676, 3189907409, 1918113396, 1765219198, 1112686102, 1198113002, 4098891592, 1106311343,
//		3841283226, 3867266041, 3185710271, 3564482602, 3187529860, 3012700450, 1787621016, 4028806320,
//		3084072035, 387797974, 1336213308, 1967450935, 3480683514, 3805337, 1323327472, 473258978,
//		1785565635, 1983123671, 1195421578, 3305214465, 2593406392, 305224649, 1500935326, 3778493552,
//		4253030865, 1934901773, 1244330143, 585710902, 1421428034, 1278865074, 1993070734, 1397860859,
//		488152920, 251457385, 3656001984, 2606018861, 459986364, 2154621780, 1099853074, 3939294437,
//		2031398903, 4028722168, 340061963, 1455975011, 896216631, 3333233869, 549862055, 3516477311,
//		172460270, 1229479787, 2585292832, 2417963285, 770217094, 1995509792, 158088914, 1268394864,
//		3811025291, 1067909119, 2350501108, 810170760, 2560451867, 265924104, 4243163127, 1172693224,
//		2581234740, 1959888199, 673154148, 957934619, 3230994734, 424871781, 2534874949, 1575470588,
//		245584358, 3479848493, 460358913, 3288822240, 2657447877, 148049210, 3691093953, 80835039,
//		172462666, 611525097, 3944282247, 1299849341, 3905104653, 3655030906, 2372899780, 454388050,
//		4190599808, 483354808, 3899738095, 1501223726, 2304321421, 1175735667, 3353661740, 3395820926,
//		551625258, 1158009885, 3071780577, 3641939343, 1843797204, 1309308885, 2009881767, 3627262888,
//		1826120052, 810458056, 2685902181, 194299399, 3316089071, 2632262226, 275376227, 2665513247,
//		3845843001, 3410742615, 2380489630, 2590815208, 3166232084, 2371674174, 599769069, 1793401071,
//		4031577728, 1214462624, 3948591214, 1557071655, 2457701270, 1544525901, 937949785, 3899687317,
//		3292015563, 2507557812, 1014593638, 2646117527, 277772037, 873959913, 702494016, 4133057192,
//		345934257, 3438967811, 3772210947, 1231760329, 2581942503, 1254440551, 275928581, 2798741333,
//		548104998, 29239406, 1192428953, 1905510947, 504672418, 2587710903, 788915271, 3535697641,
//		2898851495, 1301502469, 1347397653, 1707179498, 2681413082, 3233376040, 2674404677, 1749052000,
//		3379515489, 1850208508, 3292728611, 491069919, 1921424964, 1185518523, 821381916, 2367819431,
//		634357107, 4183743924, 3744081037, 310947739, 1303822701, 139663304, 460728398, 779108078,
//		4063296890, 1375349613, 3784187821, 2022088890, 1564271704, 3024598842, 4058793339, 678161151,
//		3699851922, 4272383961, 3262444872, 3460115329, 4285256346, 725570616, 2649022792, 908232826,
//		3669421150, 3227757833, 2543593071, 2403600489, 715953464, 1187496041, 1896667513, 65434606,
//		2535434564, 1679306603, 2411920, 2105650453, 1679897313, 2002633568, 2307609848, 1454620150,
//		2580479099, 2675252990, 2894245102, 1808362377, 2279752239, 2810280200, 1552781197, 3355716506,
//		3084494117, 1651307468, 3774132576, 4217488109, 28525562, 733827641, 4198015737, 843531812,
//		1039575117, 1718883591, 3247746164, 3656565431, 2148931238, 2911320977, 119520154, 3538744230,
//		3496294917, 1681927205, 2335276201, 2384645507, 588907704, 811466093, 1221716629, 1607398001,
//		1999631322, 3884743816, 189529316, 983872366, 2675957150, 2456656946, 556929180, 1493849987,
//		2891606836, 154496296, 2428878181, 3313499517, 1776590922, 464744234, 4001688076, 2399838432,
//		1941650972, 2507933242, 1793161298, 3842569209, 1982995639, 3311636649, 2824480686, 466428867,
//		1409685528, 3435273810, 1767048213, 818475540, 771418188, 714996863, 2963081789, 148039128,
//		2778735643, 1284323459, 892446953, 2873380911, 3657361729, 4023072904, 787495127, 207938355,
//		4203886817, 1963844578, 948424821, 3809229309, 295025977, 603086721, 3817866371, 2559433395,
//		2918388331, 755026949, 2255110320, 2162014614, 3435488568, 622274369, 425637147, 2073472147,
//		2715311487, 3561177666, 854892996, 1545068446, 841446614, 4038996454, 151462674, 535216869,
//		3246159459, 3333512170, 3239457493, 1919181440, 1265813482, 18388096, 2379466666, 1861541384,
//		178019916, 603058563, 3018492375, 2486970050, 4268245835, 568459911, 3651456596, 875255663,
//		1340454930, 4115993720, 703431180, 4282598085, 1742152336, 3907202325, 1590141981, 4162621789,
//		2324284635, 2966124567, 3859264572, 3417802641, 3022912823, 191988944, 4165675852, 1152248387,
//		2890703805, 1651783496, 1933472244, 1140054311, 2676987730, 3728466172, 3849471768, 2918236785,
//		508920272, 1371069435, 3377290679, 3777690725, 3497432860, 1049219766, 1813941176, 3469080505,
//		702806695, 3669178593, 243826656, 1929727532, 2804296904, 2342125776, 2357326275, 4194067552,
//		3148409979, 2306436364, 2640248540, 219012542, 3047070203, 1386573572, 4177453343, 1880231738,
//		915605906, 2912767925, 3290255636, 2768478877, 1831675607, 1955203282, 2267515387, 3364193430,
//		2174388303, 379342087, 3853787520, 48347677, 433507058, 968191753, 2830168566, 3482699365,
//		571671828, 1991402528, 1772378852, 2807451686, 2552325972, 3339216307, 530735400, 970038772,
//		2621382772, 3706057517, 3370524163, 3943790767, 675370559, 3847904771, 742356088, 4281275080,
//		3954142747, 3610143485, 1043345078, 1799130742, 2727737189, 1302355745, 1525045787, 1997789955,
//		694712716, 949353893, 2465149854, 320212429, 227127459, 2410912531, 662680555, 3900131031,
//		3975616213, 631788594, 1556329622, 2382737917, 1962685768, 749166737, 310806977, 3946866776,
//		471114287, 1688711149, 435147494, 1961164478, 4268051599, 1687493639, 759423864, 3519795130,
//		299033957, 1790021607, 1637523370, 3624678339, 529114065, 644201648, 3334830126, 2685455347,
//		2644921541, 3852750014, 1360983118, 2979724626, 2494016470, 1523176862, 635251611, 195790868,
//		4103822767, 1888042583, 645548587, 315022517, 578385963, 2103940906, 461468282, 2872327679,
//		1927392037, 175044215, 318057551, 2572718867, 876324286, 1973698278, 126772839, 1385141490,
//		66437371, 123958124, 1543909282, 3596837212, 948198204, 1813418874, 1978037592, 4030810659,
//		1422045451, 1532179512, 3990078001, 689229297, 1670556742, 2040604102, 1275905796, 3726015120,
//		3055046297, 659016719, 1727552386, 2017874266, 599013738, 1865865122, 1613617491, 2595713714,
//		1704471484, 1639923553, 447082639, 3906649502, 96803687, 4276215118, 3430619233, 4061061954,
//		295313819, 2939461280, 3409056442, 2248308265, 598343841, 946403382, 3240764508, 1273218343,
//		1134014894, 3361514476, 271756279, 2456821733, 1033860450, 2637363188, 2212345785, 3044447762,
//		3721658521, 1127326658, 3894338642, 2425359296, 3165000624, 4221452957, 469898197, 1161271755,
//		1686505936, 2930047223, 1868983741, 1250796972, 1734781130, 3004267814, 2371921091, 2643126185,
//		3405092919, 4190809404, 1806951510, 2255851464, 2973674701, 589111897, 3140900892, 2405005614,
//		1167120172, 976739505, 185230380, 3290876344, 173017664, 3296267873, 3115908442, 3648453813,
//		179008108, 3400503874, 2086901263, 3413993143, 471431308, 799824228, 1950321383, 100806652,
//		1102530858, 2379906581, 2286210081, 3543700243, 3381646647, 2381730404, 2242188644, 165772799,
//		3824161199, 2853425481, 1600298053, 1408765222, 1389214505, 3917683438, 1796776667, 4082462238,
//		4038709090, 247065643, 2566719592, 3650286033, 1141265148, 4246718168, 2484512680, 741632055,
//		1985172488, 2770662669, 1921147358, 1612070300, 3108755041, 1226088813, 2204104421, 1635465706,
//		2357960006, 2142418457, 2938576764, 2599728499, 1462481235, 936507017, 2990896985, 3930919480,
//		3738975565, 2745763186, 1407447946, 55243167, 4249865767, 3223670845, 4004585421, 2170684839,
//		1292346689, 58153866, 2417565927, 2011334719, 2669692825, 4210863472, 4048561104, 3014147206,
//		1971976632, 3475285711, 1365219760, 2672711952, 3459359927, 3921149575, 3783535701, 3912674835,
//		2363925128, 1695311070, 817415200, 3940462477, 3743765474, 3138900629, 2111651803, 1838174362,
//		1730743431, 2207893889, 3233119569, 2285832064, 3420780750, 4280462702, 2386906817, 2910253780,
//		2426038439, 2611863019, 3438871760, 1354576406, 2820032734, 2747922820, 561659957, 3231854507,
//		2139779880, 2954327342, 2019152351, 3006091668, 3440505973, 3968761905, 2969838846, 3423831477,
//		369729637, 184482281, 487806004, 2781465869, 65461526, 3631712801, 1309787801, 190879715,
//		986086931, 516369228, 3050253202, 2771527918, 2635732884, 2873829176, 3403142913, 2426976774,
//		3163472723, 1684841603, 294762576, 3897770383, 800701388, 910274217, 2746695458, 2422703603,
//		1354286148, 4061355428, 2626483012, 2392254189, 3569320773, 3681446974, 238537786, 1054851234,
//		1214247741, 389222498, 922733867, 1228012427, 1042860788, 1931693921, 3802408152, 131094188,
//		3283318644, 3855904971, 2878279714, 3465063858, 1542497586, 3550010144, 3854926288, 2861115436,
//		2872655574, 2431235641, 2529414420, 2158477635, 3012023565, 2202921323, 29723839, 356095430,
//		4081176175, 461057221, 4065207977, 2771274815, 2976055194, 1787405043, 2616081859, 4066823021,
//		2910201645, 761681729, 2648102515, 788884787, 3756049630, 779001420, 4026908158, 1976831467,
//		1884668199, 2038684279, 3496218252, 1259795909, 941079210, 2605599768, 4281603822, 592485634,
//		885841920, 3955399526, 3820062437, 291309525, 3652514741, 1812451328, 3469653819, 502128484,
//		4108796929, 4003541327, 2180199377, 3756438490, 2860853333, 3071542427, 1237302765, 706398771,
//		1980687734, 2853243813, 1970702271, 2341935830, 3277704431, 3425743872, 1399393805, 1485994312,
//		291327022, 1202167002, 2603008620, 3504887354, 889714609, 2512247173, 2754566039, 2701100832,
//		1643999143, 4133029118, 3592744608, 2471951933, 3280414280, 986016689, 4272412301, 1019597780,
//		2471596955, 1350686545, 3825026707, 3466949729, 2690308525, 3732686457, 1765787258, 2803392769,
//		3661789030, 3814692462, 1425272061, 1036599905, 1094833274, 3573011971, 4289810767, 3372335402,
//		1598703553, 2269449615, 3410200552, 1756519791, 3251109759, 1031130348, 2908807983, 1298977605}
}
