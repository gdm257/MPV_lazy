// 
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.

//!DESC RAVU-Zoom (rgb, r4, compute)
//!HOOK MAIN
//!BIND HOOKED
//!BIND ravu_zoom_lut4
//!WIDTH OUTPUT.w
//!HEIGHT OUTPUT.h
//!OFFSET ALIGN
//!WHEN HOOKED.w OUTPUT.w < HOOKED.h OUTPUT.h < *
//!COMPUTE 32 8
const vec3 color_primary = vec3(0.2126, 0.7152, 0.0722);
shared vec3 samples[640];
void hook() {
ivec2 group_begin = ivec2(gl_WorkGroupID) * ivec2(gl_WorkGroupSize);
ivec2 group_end = group_begin + ivec2(gl_WorkGroupSize) - ivec2(1);
ivec2 rectl = ivec2(floor(HOOKED_size * HOOKED_map(group_begin) - 0.5)) - 3;
ivec2 rectr = ivec2(floor(HOOKED_size * HOOKED_map(group_end) - 0.5)) + 4;
ivec2 rect = rectr - rectl + 1;
for (int id = int(gl_LocalInvocationIndex); id < rect.x * rect.y; id += int(gl_WorkGroupSize.x * gl_WorkGroupSize.y)) {
int y = id / rect.x, x = id % rect.x;
samples[x + y * 40] = HOOKED_tex(HOOKED_pt * (vec2(rectl + ivec2(x, y)) + vec2(0.5,0.5) + HOOKED_off)).xyz;
}
groupMemoryBarrier();
barrier();
vec2 pos = HOOKED_size * HOOKED_map(ivec2(gl_GlobalInvocationID));
vec2 subpix = fract(pos - 0.5);
pos -= subpix;
subpix = LUT_POS(subpix, vec2(9.0));
vec2 subpix_inv = 1.0 - subpix;
subpix /= vec2(8.0, 288.0);
subpix_inv /= vec2(8.0, 288.0);
ivec2 ipos = ivec2(floor(pos)) - rectl;
int lpos = ipos.x + ipos.y * 40;
vec3 sample0 = samples[-123 + lpos];
vec3 sample1 = samples[-83 + lpos];
float luma1 = dot(sample1, color_primary);
vec3 sample2 = samples[-43 + lpos];
float luma2 = dot(sample2, color_primary);
vec3 sample3 = samples[-3 + lpos];
float luma3 = dot(sample3, color_primary);
vec3 sample4 = samples[37 + lpos];
float luma4 = dot(sample4, color_primary);
vec3 sample5 = samples[77 + lpos];
float luma5 = dot(sample5, color_primary);
vec3 sample6 = samples[117 + lpos];
float luma6 = dot(sample6, color_primary);
vec3 sample7 = samples[157 + lpos];
vec3 sample8 = samples[-122 + lpos];
float luma8 = dot(sample8, color_primary);
vec3 sample9 = samples[-82 + lpos];
float luma9 = dot(sample9, color_primary);
vec3 sample10 = samples[-42 + lpos];
float luma10 = dot(sample10, color_primary);
vec3 sample11 = samples[-2 + lpos];
float luma11 = dot(sample11, color_primary);
vec3 sample12 = samples[38 + lpos];
float luma12 = dot(sample12, color_primary);
vec3 sample13 = samples[78 + lpos];
float luma13 = dot(sample13, color_primary);
vec3 sample14 = samples[118 + lpos];
float luma14 = dot(sample14, color_primary);
vec3 sample15 = samples[158 + lpos];
float luma15 = dot(sample15, color_primary);
vec3 sample16 = samples[-121 + lpos];
float luma16 = dot(sample16, color_primary);
vec3 sample17 = samples[-81 + lpos];
float luma17 = dot(sample17, color_primary);
vec3 sample18 = samples[-41 + lpos];
float luma18 = dot(sample18, color_primary);
vec3 sample19 = samples[-1 + lpos];
float luma19 = dot(sample19, color_primary);
vec3 sample20 = samples[39 + lpos];
float luma20 = dot(sample20, color_primary);
vec3 sample21 = samples[79 + lpos];
float luma21 = dot(sample21, color_primary);
vec3 sample22 = samples[119 + lpos];
float luma22 = dot(sample22, color_primary);
vec3 sample23 = samples[159 + lpos];
float luma23 = dot(sample23, color_primary);
vec3 sample24 = samples[-120 + lpos];
float luma24 = dot(sample24, color_primary);
vec3 sample25 = samples[-80 + lpos];
float luma25 = dot(sample25, color_primary);
vec3 sample26 = samples[-40 + lpos];
float luma26 = dot(sample26, color_primary);
vec3 sample27 = samples[0 + lpos];
float luma27 = dot(sample27, color_primary);
vec3 sample28 = samples[40 + lpos];
float luma28 = dot(sample28, color_primary);
vec3 sample29 = samples[80 + lpos];
float luma29 = dot(sample29, color_primary);
vec3 sample30 = samples[120 + lpos];
float luma30 = dot(sample30, color_primary);
vec3 sample31 = samples[160 + lpos];
float luma31 = dot(sample31, color_primary);
vec3 sample32 = samples[-119 + lpos];
float luma32 = dot(sample32, color_primary);
vec3 sample33 = samples[-79 + lpos];
float luma33 = dot(sample33, color_primary);
vec3 sample34 = samples[-39 + lpos];
float luma34 = dot(sample34, color_primary);
vec3 sample35 = samples[1 + lpos];
float luma35 = dot(sample35, color_primary);
vec3 sample36 = samples[41 + lpos];
float luma36 = dot(sample36, color_primary);
vec3 sample37 = samples[81 + lpos];
float luma37 = dot(sample37, color_primary);
vec3 sample38 = samples[121 + lpos];
float luma38 = dot(sample38, color_primary);
vec3 sample39 = samples[161 + lpos];
float luma39 = dot(sample39, color_primary);
vec3 sample40 = samples[-118 + lpos];
float luma40 = dot(sample40, color_primary);
vec3 sample41 = samples[-78 + lpos];
float luma41 = dot(sample41, color_primary);
vec3 sample42 = samples[-38 + lpos];
float luma42 = dot(sample42, color_primary);
vec3 sample43 = samples[2 + lpos];
float luma43 = dot(sample43, color_primary);
vec3 sample44 = samples[42 + lpos];
float luma44 = dot(sample44, color_primary);
vec3 sample45 = samples[82 + lpos];
float luma45 = dot(sample45, color_primary);
vec3 sample46 = samples[122 + lpos];
float luma46 = dot(sample46, color_primary);
vec3 sample47 = samples[162 + lpos];
float luma47 = dot(sample47, color_primary);
vec3 sample48 = samples[-117 + lpos];
float luma48 = dot(sample48, color_primary);
vec3 sample49 = samples[-77 + lpos];
float luma49 = dot(sample49, color_primary);
vec3 sample50 = samples[-37 + lpos];
float luma50 = dot(sample50, color_primary);
vec3 sample51 = samples[3 + lpos];
float luma51 = dot(sample51, color_primary);
vec3 sample52 = samples[43 + lpos];
float luma52 = dot(sample52, color_primary);
vec3 sample53 = samples[83 + lpos];
float luma53 = dot(sample53, color_primary);
vec3 sample54 = samples[123 + lpos];
float luma54 = dot(sample54, color_primary);
vec3 sample55 = samples[163 + lpos];
float luma55 = dot(sample55, color_primary);
vec3 sample56 = samples[-116 + lpos];
vec3 sample57 = samples[-76 + lpos];
float luma57 = dot(sample57, color_primary);
vec3 sample58 = samples[-36 + lpos];
float luma58 = dot(sample58, color_primary);
vec3 sample59 = samples[4 + lpos];
float luma59 = dot(sample59, color_primary);
vec3 sample60 = samples[44 + lpos];
float luma60 = dot(sample60, color_primary);
vec3 sample61 = samples[84 + lpos];
float luma61 = dot(sample61, color_primary);
vec3 sample62 = samples[124 + lpos];
float luma62 = dot(sample62, color_primary);
vec3 sample63 = samples[164 + lpos];
vec3 abd = vec3(0.0);
float gx, gy;
gx = (luma17-luma1)/2.0;
gy = (luma10-luma8)/2.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.011007348802298533;
gx = (luma18-luma2)/2.0;
gy = (-luma12+8.0*luma11-8.0*luma9+luma8)/12.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.018148050104365175;
gx = (luma19-luma3)/2.0;
gy = (-luma13+8.0*luma12-8.0*luma10+luma9)/12.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.0233025575973275;
gx = (luma20-luma4)/2.0;
gy = (-luma14+8.0*luma13-8.0*luma11+luma10)/12.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.0233025575973275;
gx = (luma21-luma5)/2.0;
gy = (-luma15+8.0*luma14-8.0*luma12+luma11)/12.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.018148050104365175;
gx = (luma22-luma6)/2.0;
gy = (luma15-luma13)/2.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.011007348802298533;
gx = (-luma33+8.0*luma25-8.0*luma9+luma1)/12.0;
gy = (luma18-luma16)/2.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.018148050104365175;
gx = (-luma34+8.0*luma26-8.0*luma10+luma2)/12.0;
gy = (-luma20+8.0*luma19-8.0*luma17+luma16)/12.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.02992107622879854;
gx = (-luma35+8.0*luma27-8.0*luma11+luma3)/12.0;
gy = (-luma21+8.0*luma20-8.0*luma18+luma17)/12.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.03841942237242872;
gx = (-luma36+8.0*luma28-8.0*luma12+luma4)/12.0;
gy = (-luma22+8.0*luma21-8.0*luma19+luma18)/12.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.03841942237242872;
gx = (-luma37+8.0*luma29-8.0*luma13+luma5)/12.0;
gy = (-luma23+8.0*luma22-8.0*luma20+luma19)/12.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.02992107622879854;
gx = (-luma38+8.0*luma30-8.0*luma14+luma6)/12.0;
gy = (luma23-luma21)/2.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.018148050104365175;
gx = (-luma41+8.0*luma33-8.0*luma17+luma9)/12.0;
gy = (luma26-luma24)/2.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.0233025575973275;
gx = (-luma42+8.0*luma34-8.0*luma18+luma10)/12.0;
gy = (-luma28+8.0*luma27-8.0*luma25+luma24)/12.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.03841942237242872;
gx = (-luma43+8.0*luma35-8.0*luma19+luma11)/12.0;
gy = (-luma29+8.0*luma28-8.0*luma26+luma25)/12.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.04933151482066013;
gx = (-luma44+8.0*luma36-8.0*luma20+luma12)/12.0;
gy = (-luma30+8.0*luma29-8.0*luma27+luma26)/12.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.04933151482066013;
gx = (-luma45+8.0*luma37-8.0*luma21+luma13)/12.0;
gy = (-luma31+8.0*luma30-8.0*luma28+luma27)/12.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.03841942237242872;
gx = (-luma46+8.0*luma38-8.0*luma22+luma14)/12.0;
gy = (luma31-luma29)/2.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.0233025575973275;
gx = (-luma49+8.0*luma41-8.0*luma25+luma17)/12.0;
gy = (luma34-luma32)/2.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.0233025575973275;
gx = (-luma50+8.0*luma42-8.0*luma26+luma18)/12.0;
gy = (-luma36+8.0*luma35-8.0*luma33+luma32)/12.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.03841942237242872;
gx = (-luma51+8.0*luma43-8.0*luma27+luma19)/12.0;
gy = (-luma37+8.0*luma36-8.0*luma34+luma33)/12.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.04933151482066013;
gx = (-luma52+8.0*luma44-8.0*luma28+luma20)/12.0;
gy = (-luma38+8.0*luma37-8.0*luma35+luma34)/12.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.04933151482066013;
gx = (-luma53+8.0*luma45-8.0*luma29+luma21)/12.0;
gy = (-luma39+8.0*luma38-8.0*luma36+luma35)/12.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.03841942237242872;
gx = (-luma54+8.0*luma46-8.0*luma30+luma22)/12.0;
gy = (luma39-luma37)/2.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.0233025575973275;
gx = (-luma57+8.0*luma49-8.0*luma33+luma25)/12.0;
gy = (luma42-luma40)/2.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.018148050104365175;
gx = (-luma58+8.0*luma50-8.0*luma34+luma26)/12.0;
gy = (-luma44+8.0*luma43-8.0*luma41+luma40)/12.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.02992107622879854;
gx = (-luma59+8.0*luma51-8.0*luma35+luma27)/12.0;
gy = (-luma45+8.0*luma44-8.0*luma42+luma41)/12.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.03841942237242872;
gx = (-luma60+8.0*luma52-8.0*luma36+luma28)/12.0;
gy = (-luma46+8.0*luma45-8.0*luma43+luma42)/12.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.03841942237242872;
gx = (-luma61+8.0*luma53-8.0*luma37+luma29)/12.0;
gy = (-luma47+8.0*luma46-8.0*luma44+luma43)/12.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.02992107622879854;
gx = (-luma62+8.0*luma54-8.0*luma38+luma30)/12.0;
gy = (luma47-luma45)/2.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.018148050104365175;
gx = (luma57-luma41)/2.0;
gy = (luma50-luma48)/2.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.011007348802298533;
gx = (luma58-luma42)/2.0;
gy = (-luma52+8.0*luma51-8.0*luma49+luma48)/12.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.018148050104365175;
gx = (luma59-luma43)/2.0;
gy = (-luma53+8.0*luma52-8.0*luma50+luma49)/12.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.0233025575973275;
gx = (luma60-luma44)/2.0;
gy = (-luma54+8.0*luma53-8.0*luma51+luma50)/12.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.0233025575973275;
gx = (luma61-luma45)/2.0;
gy = (-luma55+8.0*luma54-8.0*luma52+luma51)/12.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.018148050104365175;
gx = (luma62-luma46)/2.0;
gy = (luma55-luma53)/2.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.011007348802298533;
float a = abd.x, b = abd.y, d = abd.z;
float T = a + d, D = a * d - b * b;
float delta = sqrt(max(T * T / 4.0 - D, 0.0));
float L1 = T / 2.0 + delta, L2 = T / 2.0 - delta;
float sqrtL1 = sqrt(L1), sqrtL2 = sqrt(L2);
float theta = mix(mod(atan(L1 - a, b) + 3.141592653589793, 3.141592653589793), 0.0, abs(b) < 1.192092896e-7);
float lambda = sqrtL1;
float mu = mix((sqrtL1 - sqrtL2) / (sqrtL1 + sqrtL2), 0.0, sqrtL1 + sqrtL2 < 1.192092896e-7);
float angle = floor(theta * 24.0 / 3.141592653589793);
float strength = mix(mix(0.0, 1.0, lambda >= 0.004), mix(2.0, 3.0, lambda >= 0.05), lambda >= 0.016);
float coherence = mix(mix(0.0, 1.0, mu >= 0.25), 2.0, mu >= 0.5);
float coord_y = ((angle * 4.0 + strength) * 3.0 + coherence) / 288.0;
vec3 res = vec3(0.0);
vec4 w;
w = texture(ravu_zoom_lut4, vec2(0.0, coord_y) + subpix);
res += sample0 * w[0];
res += sample1 * w[1];
res += sample2 * w[2];
res += sample3 * w[3];
w = texture(ravu_zoom_lut4, vec2(0.125, coord_y) + subpix);
res += sample4 * w[0];
res += sample5 * w[1];
res += sample6 * w[2];
res += sample7 * w[3];
w = texture(ravu_zoom_lut4, vec2(0.25, coord_y) + subpix);
res += sample8 * w[0];
res += sample9 * w[1];
res += sample10 * w[2];
res += sample11 * w[3];
w = texture(ravu_zoom_lut4, vec2(0.375, coord_y) + subpix);
res += sample12 * w[0];
res += sample13 * w[1];
res += sample14 * w[2];
res += sample15 * w[3];
w = texture(ravu_zoom_lut4, vec2(0.5, coord_y) + subpix);
res += sample16 * w[0];
res += sample17 * w[1];
res += sample18 * w[2];
res += sample19 * w[3];
w = texture(ravu_zoom_lut4, vec2(0.625, coord_y) + subpix);
res += sample20 * w[0];
res += sample21 * w[1];
res += sample22 * w[2];
res += sample23 * w[3];
w = texture(ravu_zoom_lut4, vec2(0.75, coord_y) + subpix);
res += sample24 * w[0];
res += sample25 * w[1];
res += sample26 * w[2];
res += sample27 * w[3];
w = texture(ravu_zoom_lut4, vec2(0.875, coord_y) + subpix);
res += sample28 * w[0];
res += sample29 * w[1];
res += sample30 * w[2];
res += sample31 * w[3];
w = texture(ravu_zoom_lut4, vec2(0.0, coord_y) + subpix_inv);
res += sample63 * w[0];
res += sample62 * w[1];
res += sample61 * w[2];
res += sample60 * w[3];
w = texture(ravu_zoom_lut4, vec2(0.125, coord_y) + subpix_inv);
res += sample59 * w[0];
res += sample58 * w[1];
res += sample57 * w[2];
res += sample56 * w[3];
w = texture(ravu_zoom_lut4, vec2(0.25, coord_y) + subpix_inv);
res += sample55 * w[0];
res += sample54 * w[1];
res += sample53 * w[2];
res += sample52 * w[3];
w = texture(ravu_zoom_lut4, vec2(0.375, coord_y) + subpix_inv);
res += sample51 * w[0];
res += sample50 * w[1];
res += sample49 * w[2];
res += sample48 * w[3];
w = texture(ravu_zoom_lut4, vec2(0.5, coord_y) + subpix_inv);
res += sample47 * w[0];
res += sample46 * w[1];
res += sample45 * w[2];
res += sample44 * w[3];
w = texture(ravu_zoom_lut4, vec2(0.625, coord_y) + subpix_inv);
res += sample43 * w[0];
res += sample42 * w[1];
res += sample41 * w[2];
res += sample40 * w[3];
w = texture(ravu_zoom_lut4, vec2(0.75, coord_y) + subpix_inv);
res += sample39 * w[0];
res += sample38 * w[1];
res += sample37 * w[2];
res += sample36 * w[3];
w = texture(ravu_zoom_lut4, vec2(0.875, coord_y) + subpix_inv);
res += sample35 * w[0];
res += sample34 * w[1];
res += sample33 * w[2];
res += sample32 * w[3];
res = clamp(res, 0.0, 1.0);
imageStore(out_image, ivec2(gl_GlobalInvocationID), vec4(res, 0.0));
}
//!TEXTURE ravu_zoom_lut4
//!SIZE 72 2592
//!FORMAT rgba16hf
//!FILTER LINEAR