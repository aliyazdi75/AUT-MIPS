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

#include "xsi.h"

struct XSI_INFO xsi_info;

char *IEEE_P_2592010699;
char *STD_STANDARD;
char *WORK_P_0057184414;
char *IEEE_P_1242562249;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    work_p_0057184414_init();
    ieee_p_1242562249_init();
    work_a_3623696577_3212880686_init();
    work_a_2426902226_3212880686_init();
    work_a_4064855755_3212880686_init();
    work_a_0380725995_3212880686_init();
    work_a_0058372147_3212880686_init();
    work_a_0440555915_3212880686_init();
    work_a_2779334651_3212880686_init();
    work_a_0039736933_3212880686_init();
    work_a_2740651633_3212880686_init();
    work_a_4198592189_3212880686_init();
    work_a_0416868682_3212880686_init();
    work_a_0157877642_3212880686_init();
    work_a_4000226436_3212880686_init();
    work_a_1208337864_3212880686_init();
    work_a_0295974560_3212880686_init();
    work_a_3511433552_3212880686_init();
    work_a_1182382131_3212880686_init();
    work_a_1673823861_3212880686_init();
    work_a_0743685656_3212880686_init();
    work_a_0832606739_3212880686_init();
    work_a_0389493290_3212880686_init();
    work_a_0268493156_3212880686_init();
    work_a_0606318341_3212880686_init();
    work_a_2399776393_3212880686_init();
    work_a_3193465487_2372691052_init();


    xsi_register_tops("work_a_3193465487_2372691052");

    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    STD_STANDARD = xsi_get_engine_memory("std_standard");
    WORK_P_0057184414 = xsi_get_engine_memory("work_p_0057184414");
    IEEE_P_1242562249 = xsi_get_engine_memory("ieee_p_1242562249");

    return xsi_run_simulation(argc, argv);

}
