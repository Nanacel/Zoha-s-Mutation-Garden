enum crops 
{
 cauliflower,
 tomato,
 sunflower,
 height
}

number_of_stats = 13;
number_of_lands = 1

global.ds_crops = ds_grid_create( number_of_stats, crops.height);

//------------Plant Number------------//
var _m = 0;
var _n = 0;
global.ds_crops[# _n, _m++] = 0;
global.ds_crops[# _n, _m++] = 1;
global.ds_crops[# _n, _m++] = 2;

//------------Base Health------------//
var _e = 0;
var _f = 1;
global.ds_crops[# _f, _e++] = 120;
global.ds_crops[# _f, _e++] = 100;
global.ds_crops[# _f, _e++] = 100;

//------------Base Max Health------------//
var _g = 0;
var _h = 2;
global.ds_crops[# _h, _g++] = 120;
global.ds_crops[# _h, _g++] = 100;
global.ds_crops[# _h, _g++] = 100;

//------------Base Yield------------//
var _i = 0;
var _j = 3;
global.ds_crops[# _j, _i++] = 1;
global.ds_crops[# _j, _i++] = 5;
global.ds_crops[# _j, _i++] = 1;

//------------Harvestable Multiple Time------------//
// 0 = false; 1 = true
var _z = 0;
var _x = 4;
global.ds_crops[# _x, _z++] = 0;
global.ds_crops[# _x, _z++] = 1;
global.ds_crops[# _x, _z++] = 0;

//------------Growth Stage Duration------------//
// 5 = 30 days
var _a = 0;
var _b = 5;
global.ds_crops[# _b, _a++] = 20; // 4 months
global.ds_crops[# _b, _a++] = 15; // 3 months
global.ds_crops[# _b, _a++] = 20; // 4 months

//------------Base Traits------------//
var _l = 0;
var _k = 6;
global.ds_crops[# _k, _l++] = [];
global.ds_crops[# _k, _l++] = [];
global.ds_crops[# _k, _l++] = [];

//------------Base Price------------//
var _c = 0;
var _d = 7;
global.ds_crops[# _d, _c++] = 20000;
global.ds_crops[# _d, _c++] = 160;
global.ds_crops[# _d, _c++] = 2400;

//------------Sprite ID------------//
var _q = 0;
var _r = 8;
global.ds_crops[# _r, _q++] = 5;
global.ds_crops[# _r, _q++] = 6;
global.ds_crops[# _r, _q++] = 9;

//------------Item Type------------//
// 5 = fruits, 6 = vegetables, 8 = flowers
var _o = 0;
var _p = 9;
global.ds_crops[# _p, _o++] = 6;
global.ds_crops[# _p, _o++] = 5;
global.ds_crops[# _p, _o++] = 8;

//------------Needs A Stake------------//
//0 = false, 1 = true
var _s = 0;
var _t = 10;
global.ds_crops[# _t, _s++] = 0;
global.ds_crops[# _t, _s++] = 1;
global.ds_crops[# _t, _s++] = 0;

//------------Months You Can't Grow This Plant------------//
//1 = january, 2 = febuary, 3 = march, 4 = april, 5 = may, 6 = june; 7 = july, 8 = august, 9 = september, 10 = october, 11 = november, 12 = december
var _aa = 0;
var _ab = 11;
global.ds_crops[# _ab, _aa++] = [12, 1, 2];
global.ds_crops[# _ab, _aa++] = [1, 2, 3, 4, 11, 12];
global.ds_crops[# _ab, _aa++] = [12, 1, 2];

//------------HP Loss Per Day When Bad Season------------//
var _ac = 0;
var _ad = 12;
global.ds_crops[# _ad, _ac++] = 5;
global.ds_crops[# _ad, _ac++] = 10;
global.ds_crops[# _ad, _ac++] = 10;