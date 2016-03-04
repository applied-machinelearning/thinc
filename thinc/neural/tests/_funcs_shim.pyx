from ..solve cimport *
from ..forward cimport *
from ..backward cimport *


def call_dot_plus(
    weight_t[:] out,
        weight_t[:] in_,
        weight_t[:] W,
        weight_t[:] bias,
        int nr_top,
        int nr_btm):
    dot_plus(&out[0],
        &bias[0], nr_top, &in_[0], nr_btm, &W[0])
    return out


def call_d_dot(
    weight_t[:] btm_diff,
        weight_t[:] top_diff,
        weight_t[:] W,
        int nr_top,
        int nr_btm):
    d_dot(&btm_diff[0],
        nr_btm, &top_diff[0], nr_top, &W[0])
    return btm_diff


def call_ELU(weight_t[:] out, int nr_out):
    ELU(&out[0], nr_out)
    return out


def call_d_ELU(weight_t[:] delta, weight_t[:] signal_out, int nr_out):
    d_ELU(&delta[0], &signal_out[0], nr_out)
    return delta