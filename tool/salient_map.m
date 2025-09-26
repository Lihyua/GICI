function [Qa,Qb,sf]=salient_map(f,f1,f2,bb,fmeasure)

    sf=calcFocusMeasure_new(f, bb, fmeasure);
    sa=calcFocusMeasure_new(f1, bb, fmeasure);
    sb=calcFocusMeasure_new(f2, bb, fmeasure);
    difa=Dif_operation(sf,sb);
    difb=Dif_operation(sf,sa);
    sa2=calcFocusMeasure_new(difa, bb, fmeasure);
    sb2=calcFocusMeasure_new(difb, bb, fmeasure);
    Qa=GICI_block(sa,sa2,sb2);
    Qb=GICI_block(sb,sb2,sa2);