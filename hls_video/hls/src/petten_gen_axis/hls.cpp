
#include "hls_video.h"

#define	FRM_WIDTH	1920
#define	FRM_HEIGHT	1080


typedef ap_axiu<24, 1, 1, 1>	if_t;
typedef hls::stream<if_t> 		stream_t;

void petten_gen_axis(stream_t& out)
{
#pragma HLS INTERFACE axis register both port=out

    if_t axi;
    HLS_SIZE_T rows = FRM_HEIGHT;
    HLS_SIZE_T cols = FRM_WIDTH;
    bool sof = 1;

loop_height: for (HLS_SIZE_T i = 0; i < rows; i++) {
	loop_width: for (HLS_SIZE_T j = 0; j < cols; j++) {
#pragma HLS PIPELINE rewind
            if (sof) {
                axi.user = 1;
                sof = 0;
            } else {
                axi.user = 0;
            }
            if (j == (cols-1)) {
                axi.last = 1;
            } else {
                axi.last = 0;
            }

            // Generate pattern
            ap_uint<24> tmp = j % 256;
            axi.data = (tmp << 16) + (tmp << 8) + (tmp);

            axi.keep = -1;
            out << axi;
        }
    }
}
