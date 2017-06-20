/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/Ali Yazdi/Desktop/Ali Yazdi/pc/memory.vhd";
extern char *IEEE_P_1242562249;

int ieee_p_1242562249_sub_1657552908_1035706684(char *, char *, char *);


static void work_a_0606318341_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    char *t13;
    char *t14;
    int t15;
    int t16;

LAB0:    xsi_set_current_line(29, ng0);
    t1 = (t0 + 2488U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)1);
    if (t4 != 0)
        goto LAB2;

LAB4:
LAB3:    xsi_set_current_line(47, ng0);
    t1 = (t0 + 3872);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(49, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB5;

LAB7:
LAB6:    t1 = (t0 + 3792);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(34, ng0);
    t1 = (t0 + 22853);
    t6 = (t0 + 2248U);
    t7 = *((char **)t6);
    t8 = (0 - 0);
    t9 = (t8 * 1);
    t10 = (16U * t9);
    t11 = (0 + t10);
    t6 = (t7 + t11);
    memcpy(t6, t1, 16U);
    xsi_set_current_line(37, ng0);
    t1 = (t0 + 22869);
    t5 = (t0 + 2248U);
    t6 = *((char **)t5);
    t8 = (2 - 0);
    t9 = (t8 * 1);
    t10 = (16U * t9);
    t11 = (0 + t10);
    t5 = (t6 + t11);
    memcpy(t5, t1, 16U);
    xsi_set_current_line(40, ng0);
    t1 = (t0 + 22885);
    t5 = (t0 + 2248U);
    t6 = *((char **)t5);
    t8 = (3 - 0);
    t9 = (t8 * 1);
    t10 = (16U * t9);
    t11 = (0 + t10);
    t5 = (t6 + t11);
    memcpy(t5, t1, 16U);
    xsi_set_current_line(44, ng0);
    t1 = (t0 + 2488U);
    t2 = *((char **)t1);
    t1 = (t2 + 0);
    *((unsigned char *)t1) = (unsigned char)0;
    goto LAB3;

LAB5:    xsi_set_current_line(50, ng0);
    t1 = (t0 + 1512U);
    t5 = *((char **)t1);
    t1 = (t0 + 6372U);
    t8 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t5, t1);
    t6 = (t0 + 2368U);
    t7 = *((char **)t6);
    t6 = (t7 + 0);
    *((int *)t6) = t8;
    xsi_set_current_line(52, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB8;

LAB10:    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB14;

LAB15:    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)2);
    if (t4 != 0)
        goto LAB19;

LAB20:
LAB9:    goto LAB6;

LAB8:    xsi_set_current_line(53, ng0);
    t1 = (t0 + 3872);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t12 = *((char **)t7);
    *((unsigned char *)t12) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(54, ng0);
    t1 = (t0 + 2368U);
    t2 = *((char **)t1);
    t8 = *((int *)t2);
    t3 = (t8 >= 1024);
    if (t3 != 0)
        goto LAB11;

LAB13:    xsi_set_current_line(57, ng0);
    t1 = (t0 + 2248U);
    t2 = *((char **)t1);
    t1 = (t0 + 2368U);
    t5 = *((char **)t1);
    t8 = *((int *)t5);
    t15 = (t8 - 0);
    t9 = (t15 * 1);
    xsi_vhdl_check_range_of_index(0, 1023, 1, t8);
    t10 = (16U * t9);
    t11 = (0 + t10);
    t1 = (t2 + t11);
    t6 = (t0 + 3936);
    t7 = (t6 + 56U);
    t12 = *((char **)t7);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    memcpy(t14, t1, 16U);
    xsi_driver_first_trans_fast_port(t6);

LAB12:    goto LAB9;

LAB11:    xsi_set_current_line(55, ng0);
    t1 = xsi_get_transient_memory(16U);
    memset(t1, 0, 16U);
    t5 = t1;
    memset(t5, (unsigned char)4, 16U);
    t6 = (t0 + 3936);
    t7 = (t6 + 56U);
    t12 = *((char **)t7);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    memcpy(t14, t1, 16U);
    xsi_driver_first_trans_fast_port(t6);
    goto LAB12;

LAB14:    xsi_set_current_line(60, ng0);
    t1 = (t0 + 3872);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t12 = *((char **)t7);
    *((unsigned char *)t12) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(61, ng0);
    t1 = (t0 + 2368U);
    t2 = *((char **)t1);
    t8 = *((int *)t2);
    t3 = (t8 < 1024);
    if (t3 != 0)
        goto LAB16;

LAB18:
LAB17:    goto LAB9;

LAB16:    xsi_set_current_line(62, ng0);
    t1 = (t0 + 1672U);
    t5 = *((char **)t1);
    t1 = (t0 + 2248U);
    t6 = *((char **)t1);
    t1 = (t0 + 2368U);
    t7 = *((char **)t1);
    t15 = *((int *)t7);
    t16 = (t15 - 0);
    t9 = (t16 * 1);
    xsi_vhdl_check_range_of_index(0, 1023, 1, t15);
    t10 = (16U * t9);
    t11 = (0 + t10);
    t1 = (t6 + t11);
    memcpy(t1, t5, 16U);
    goto LAB17;

LAB19:    xsi_set_current_line(65, ng0);
    t1 = xsi_get_transient_memory(16U);
    memset(t1, 0, 16U);
    t5 = t1;
    memset(t5, (unsigned char)4, 16U);
    t6 = (t0 + 3936);
    t7 = (t6 + 56U);
    t12 = *((char **)t7);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    memcpy(t14, t1, 16U);
    xsi_driver_first_trans_fast_port(t6);
    goto LAB9;

}


extern void work_a_0606318341_3212880686_init()
{
	static char *pe[] = {(void *)work_a_0606318341_3212880686_p_0};
	xsi_register_didat("work_a_0606318341_3212880686", "isim/ptb_isim_beh.exe.sim/work/a_0606318341_3212880686.didat");
	xsi_register_executes(pe);
}
