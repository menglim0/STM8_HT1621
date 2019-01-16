#ifndef __TYPEDEF_H__
#define __TYPEDEF_H__




#define     IO_OUTPUT       1
#define     IO_INPUT        0


typedef unsigned char   u8;
typedef signed char     s8;
typedef unsigned int    u16;
typedef int             s16;
typedef unsigned long   u32;
typedef long            s32;
typedef float           f32;
typedef enum {
    FALSE,
    TRUE
} bool;

typedef volatile unsigned char   vu8;
typedef volatile signed char     vs8;
typedef volatile unsigned int    vu16;
typedef volatile int             vs16;
typedef volatile unsigned long   vu32;
typedef volatile long            vs32;
typedef volatile float           vf32;

#endif
