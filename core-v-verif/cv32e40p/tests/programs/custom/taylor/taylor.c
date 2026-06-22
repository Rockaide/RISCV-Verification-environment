/*
 *
 * Copyright (c) 2005-2020 Imperas Software Ltd., www.imperas.com
 *
 * The contents of this file are provided under the Software License
 * Agreement that you accepted before downloading this file.
 *
 * This source forms part of the Software and can be used for educational,
 * training, and demonstration purposes but cannot be used for derivative
 * works except in cases where the derivative works require OVP technology
 * to run.
 *
 * For open source models released under licenses that you can use for
 * derivative works, please visit www.OVPworld.org or www.imperas.com
 * for the location of the open source models.
 *
 */

#include <stdio.h>
#include <stdlib.h>

void maclaurin_coeff_on_demand(double value, double* resp)
{
    double aux = 1;
    double termo = 1;

    for (int n = 0; n < 5; n++)
    {
        termo *= value / (n + 1);
        aux += termo;
    }

    *resp = aux;
}
int main(int argc, char *argv[]) {

    double x = 1;
    double y = 1;
    maclaurin_coeff_on_demand(x, &y);

    printf("finishing...\n");

    return 0;
}
