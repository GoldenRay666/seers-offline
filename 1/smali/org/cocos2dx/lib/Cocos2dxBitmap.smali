.class public Lorg/cocos2dx/lib/Cocos2dxBitmap;
.super Ljava/lang/Object;
.source "Cocos2dxBitmap.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/cocos2dx/lib/Cocos2dxBitmap$TextProperty;
    }
.end annotation


# static fields
.field private static final HORIZONTALALIGN_CENTER:I = 0x3

.field private static final HORIZONTALALIGN_LEFT:I = 0x1

.field private static final HORIZONTALALIGN_RIGHT:I = 0x2

.field private static final VERTICALALIGN_BOTTOM:I = 0x2

.field private static final VERTICALALIGN_CENTER:I = 0x3

.field private static final VERTICALALIGN_TOP:I = 0x1

.field private static sContext:Landroid/content/Context;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static computeTextProperty(Ljava/lang/String;IILandroid/graphics/Paint;)Lorg/cocos2dx/lib/Cocos2dxBitmap$TextProperty;
    .locals 10
    .param p0, "pString"    # Ljava/lang/String;
    .param p1, "pWidth"    # I
    .param p2, "pHeight"    # I
    .param p3, "pPaint"    # Landroid/graphics/Paint;

    .prologue
    const/4 v7, 0x0

    .line 157
    invoke-virtual {p3}, Landroid/graphics/Paint;->getFontMetricsInt()Landroid/graphics/Paint$FontMetricsInt;

    move-result-object v0

    .line 158
    .local v0, "fm":Landroid/graphics/Paint$FontMetricsInt;
    iget v6, v0, Landroid/graphics/Paint$FontMetricsInt;->descent:I

    iget v8, v0, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    sub-int/2addr v6, v8

    iget v8, v0, Landroid/graphics/Paint$FontMetricsInt;->leading:I

    add-int/2addr v6, v8

    int-to-double v8, v6

    invoke-static {v8, v9}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v8

    double-to-int v1, v8

    .line 159
    .local v1, "h":I
    const/4 v4, 0x0

    .line 161
    .local v4, "maxContentWidth":I
    invoke-static {p0, p1, p2, p3}, Lorg/cocos2dx/lib/Cocos2dxBitmap;->splitString(Ljava/lang/String;IILandroid/graphics/Paint;)[Ljava/lang/String;

    move-result-object v3

    .line 163
    .local v3, "lines":[Ljava/lang/String;
    if-eqz p1, :cond_1

    .line 164
    move v4, p1

    .line 176
    :cond_0
    new-instance v6, Lorg/cocos2dx/lib/Cocos2dxBitmap$TextProperty;

    invoke-direct {v6, v4, v1, v3}, Lorg/cocos2dx/lib/Cocos2dxBitmap$TextProperty;-><init>(II[Ljava/lang/String;)V

    return-object v6

    .line 167
    :cond_1
    const/4 v5, 0x0

    .line 168
    .local v5, "temp":I
    array-length v8, v3

    move v6, v7

    :goto_0
    if-ge v6, v8, :cond_0

    aget-object v2, v3, v6

    .line 169
    .local v2, "line":Ljava/lang/String;
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v9

    invoke-virtual {p3, v2, v7, v9}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;II)F

    move-result v9

    invoke-static {v9}, Landroid/util/FloatMath;->ceil(F)F

    move-result v9

    float-to-int v5, v9

    .line 170
    if-le v5, v4, :cond_2

    .line 171
    move v4, v5

    .line 168
    :cond_2
    add-int/lit8 v6, v6, 0x1

    goto :goto_0
.end method

.method private static computeX(Ljava/lang/String;II)I
    .locals 1
    .param p0, "pText"    # Ljava/lang/String;
    .param p1, "pMaxWidth"    # I
    .param p2, "pHorizontalAlignment"    # I

    .prologue
    .line 180
    const/4 v0, 0x0

    .line 182
    .local v0, "ret":I
    packed-switch p2, :pswitch_data_0

    .line 194
    :goto_0
    return v0

    .line 184
    :pswitch_0
    div-int/lit8 v0, p1, 0x2

    .line 185
    goto :goto_0

    .line 187
    :pswitch_1
    move v0, p1

    .line 188
    goto :goto_0

    .line 182
    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static computeY(Landroid/graphics/Paint$FontMetricsInt;III)I
    .locals 3
    .param p0, "pFontMetricsInt"    # Landroid/graphics/Paint$FontMetricsInt;
    .param p1, "pConstrainHeight"    # I
    .param p2, "pTotalHeight"    # I
    .param p3, "pVerticalAlignment"    # I

    .prologue
    .line 198
    iget v1, p0, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    neg-int v0, v1

    .line 200
    .local v0, "y":I
    if-le p1, p2, :cond_0

    .line 201
    packed-switch p3, :pswitch_data_0

    .line 216
    :cond_0
    :goto_0
    return v0

    .line 203
    :pswitch_0
    iget v1, p0, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    neg-int v0, v1

    .line 204
    goto :goto_0

    .line 206
    :pswitch_1
    iget v1, p0, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    neg-int v1, v1

    sub-int v2, p1, p2

    div-int/lit8 v2, v2, 0x2

    add-int v0, v1, v2

    .line 207
    goto :goto_0

    .line 209
    :pswitch_2
    iget v1, p0, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    neg-int v1, v1

    sub-int v2, p1, p2

    add-int v0, v1, v2

    .line 210
    goto :goto_0

    .line 201
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method public static createTextBitmap(Ljava/lang/String;Ljava/lang/String;IIII)V
    .locals 19
    .param p0, "pString"    # Ljava/lang/String;
    .param p1, "pFontName"    # Ljava/lang/String;
    .param p2, "pFontSize"    # I
    .param p3, "pAlignment"    # I
    .param p4, "pWidth"    # I
    .param p5, "pHeight"    # I

    .prologue
    .line 92
    and-int/lit8 v7, p3, 0xf

    .line 93
    .local v7, "horizontalAlignment":I
    shr-int/lit8 v15, p3, 0x4

    and-int/lit8 v12, v15, 0xf

    .line 95
    .local v12, "verticalAlignment":I
    invoke-static/range {p0 .. p0}, Lorg/cocos2dx/lib/Cocos2dxBitmap;->refactorString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 96
    move-object/from16 v0, p1

    move/from16 v1, p2

    invoke-static {v0, v1, v7}, Lorg/cocos2dx/lib/Cocos2dxBitmap;->newPaint(Ljava/lang/String;II)Landroid/graphics/Paint;

    move-result-object v10

    .line 98
    .local v10, "paint":Landroid/graphics/Paint;
    move-object/from16 v0, p0

    move/from16 v1, p4

    move/from16 v2, p5

    invoke-static {v0, v1, v2, v10}, Lorg/cocos2dx/lib/Cocos2dxBitmap;->computeTextProperty(Ljava/lang/String;IILandroid/graphics/Paint;)Lorg/cocos2dx/lib/Cocos2dxBitmap$TextProperty;

    move-result-object v11

    .line 100
    .local v11, "textProperty":Lorg/cocos2dx/lib/Cocos2dxBitmap$TextProperty;
    if-nez p5, :cond_0

    invoke-static {v11}, Lorg/cocos2dx/lib/Cocos2dxBitmap$TextProperty;->access$0(Lorg/cocos2dx/lib/Cocos2dxBitmap$TextProperty;)I

    move-result v4

    .line 102
    .local v4, "bitmapTotalHeight":I
    :goto_0
    invoke-static {v11}, Lorg/cocos2dx/lib/Cocos2dxBitmap$TextProperty;->access$1(Lorg/cocos2dx/lib/Cocos2dxBitmap$TextProperty;)I

    move-result v15

    sget-object v16, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    move-object/from16 v0, v16

    invoke-static {v15, v4, v0}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v3

    .line 103
    .local v3, "bitmap":Landroid/graphics/Bitmap;
    new-instance v5, Landroid/graphics/Canvas;

    invoke-direct {v5, v3}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 106
    .local v5, "canvas":Landroid/graphics/Canvas;
    invoke-virtual {v10}, Landroid/graphics/Paint;->getFontMetricsInt()Landroid/graphics/Paint$FontMetricsInt;

    move-result-object v6

    .line 107
    .local v6, "fontMetricsInt":Landroid/graphics/Paint$FontMetricsInt;
    const/4 v13, 0x0

    .line 108
    .local v13, "x":I
    invoke-static {v11}, Lorg/cocos2dx/lib/Cocos2dxBitmap$TextProperty;->access$0(Lorg/cocos2dx/lib/Cocos2dxBitmap$TextProperty;)I

    move-result v15

    move/from16 v0, p5

    invoke-static {v6, v0, v15, v12}, Lorg/cocos2dx/lib/Cocos2dxBitmap;->computeY(Landroid/graphics/Paint$FontMetricsInt;III)I

    move-result v14

    .line 109
    .local v14, "y":I
    invoke-static {v11}, Lorg/cocos2dx/lib/Cocos2dxBitmap$TextProperty;->access$2(Lorg/cocos2dx/lib/Cocos2dxBitmap$TextProperty;)[Ljava/lang/String;

    move-result-object v9

    .line 110
    .local v9, "lines":[Ljava/lang/String;
    array-length v0, v9

    move/from16 v16, v0

    const/4 v15, 0x0

    :goto_1
    move/from16 v0, v16

    if-lt v15, v0, :cond_1

    .line 116
    invoke-static {v3}, Lorg/cocos2dx/lib/Cocos2dxBitmap;->initNativeObject(Landroid/graphics/Bitmap;)V

    .line 117
    return-void

    .end local v3    # "bitmap":Landroid/graphics/Bitmap;
    .end local v4    # "bitmapTotalHeight":I
    .end local v5    # "canvas":Landroid/graphics/Canvas;
    .end local v6    # "fontMetricsInt":Landroid/graphics/Paint$FontMetricsInt;
    .end local v9    # "lines":[Ljava/lang/String;
    .end local v13    # "x":I
    .end local v14    # "y":I
    :cond_0
    move/from16 v4, p5

    .line 100
    goto :goto_0

    .line 110
    .restart local v3    # "bitmap":Landroid/graphics/Bitmap;
    .restart local v4    # "bitmapTotalHeight":I
    .restart local v5    # "canvas":Landroid/graphics/Canvas;
    .restart local v6    # "fontMetricsInt":Landroid/graphics/Paint$FontMetricsInt;
    .restart local v9    # "lines":[Ljava/lang/String;
    .restart local v13    # "x":I
    .restart local v14    # "y":I
    :cond_1
    aget-object v8, v9, v15

    .line 111
    .local v8, "line":Ljava/lang/String;
    invoke-static {v11}, Lorg/cocos2dx/lib/Cocos2dxBitmap$TextProperty;->access$1(Lorg/cocos2dx/lib/Cocos2dxBitmap$TextProperty;)I

    move-result v17

    move/from16 v0, v17

    invoke-static {v8, v0, v7}, Lorg/cocos2dx/lib/Cocos2dxBitmap;->computeX(Ljava/lang/String;II)I

    move-result v13

    .line 112
    int-to-float v0, v13

    move/from16 v17, v0

    int-to-float v0, v14

    move/from16 v18, v0

    move/from16 v0, v17

    move/from16 v1, v18

    invoke-virtual {v5, v8, v0, v1, v10}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 113
    invoke-static {v11}, Lorg/cocos2dx/lib/Cocos2dxBitmap$TextProperty;->access$3(Lorg/cocos2dx/lib/Cocos2dxBitmap$TextProperty;)I

    move-result v17

    add-int v14, v14, v17

    .line 110
    add-int/lit8 v15, v15, 0x1

    goto :goto_1
.end method

.method private static divideStringWithMaxWidth(Ljava/lang/String;ILandroid/graphics/Paint;)Ljava/util/LinkedList;
    .locals 13
    .param p0, "pString"    # Ljava/lang/String;
    .param p1, "pMaxWidth"    # I
    .param p2, "pPaint"    # Landroid/graphics/Paint;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I",
            "Landroid/graphics/Paint;",
            ")",
            "Ljava/util/LinkedList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    const/16 v12, 0x20

    const/4 v9, 0x0

    .line 271
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    .line 272
    .local v0, "charLength":I
    const/4 v6, 0x0

    .line 273
    .local v6, "start":I
    const/4 v8, 0x0

    .line 274
    .local v8, "tempWidth":I
    new-instance v7, Ljava/util/LinkedList;

    invoke-direct {v7}, Ljava/util/LinkedList;-><init>()V

    .line 276
    .local v7, "strList":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Ljava/lang/String;>;"
    const/4 v2, 0x0

    .line 277
    .local v2, "foreHeadSpaceLength":I
    :goto_0
    add-int v10, v6, v2

    invoke-virtual {p0, v10}, Ljava/lang/String;->charAt(I)C

    move-result v10

    if-eq v10, v12, :cond_1

    .line 282
    const/4 v3, 0x1

    .local v3, "i":I
    :goto_1
    if-le v3, v0, :cond_2

    .line 317
    if-ge v6, v0, :cond_0

    .line 318
    invoke-virtual {p0, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v9}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 321
    :cond_0
    return-object v7

    .line 278
    .end local v3    # "i":I
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 283
    .restart local v3    # "i":I
    :cond_2
    invoke-virtual {p2, p0, v6, v3}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;II)F

    move-result v10

    invoke-static {v10}, Landroid/util/FloatMath;->ceil(F)F

    move-result v10

    float-to-int v8, v10

    .line 284
    if-lt v8, p1, :cond_7

    .line 285
    invoke-virtual {p0, v9, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v10

    const-string v11, " "

    invoke-virtual {v10, v11}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v5

    .line 286
    .local v5, "lastIndexOfSpace":I
    const/4 v1, 0x0

    .line 287
    .local v1, "followedChar":C
    add-int/lit8 v10, v5, 0x1

    if-ge v10, v0, :cond_3

    .line 288
    add-int/lit8 v10, v5, 0x1

    invoke-virtual {p0, v10}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 290
    :cond_3
    const/16 v10, 0x61

    if-lt v1, v10, :cond_4

    const/16 v10, 0x7a

    if-le v1, v10, :cond_8

    :cond_4
    const/16 v10, 0x41

    if-lt v1, v10, :cond_5

    const/16 v10, 0x5a

    if-le v1, v10, :cond_8

    :cond_5
    move v4, v9

    .line 292
    .local v4, "isAlphabet":Z
    :goto_2
    const/4 v10, -0x1

    if-eq v5, v10, :cond_9

    if-le v5, v6, :cond_9

    if-le v5, v2, :cond_9

    if-eqz v4, :cond_9

    .line 294
    invoke-virtual {p0, v6, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v7, v10}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 295
    move v3, v5

    .line 308
    :goto_3
    if-ge v3, v0, :cond_6

    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v10

    if-eq v10, v12, :cond_b

    .line 312
    :cond_6
    move v6, v3

    .line 282
    .end local v1    # "followedChar":C
    .end local v4    # "isAlphabet":Z
    .end local v5    # "lastIndexOfSpace":I
    :cond_7
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 290
    .restart local v1    # "followedChar":C
    .restart local v5    # "lastIndexOfSpace":I
    :cond_8
    const/4 v4, 0x1

    goto :goto_2

    .line 298
    .restart local v4    # "isAlphabet":Z
    :cond_9
    if-le v8, p1, :cond_a

    .line 299
    add-int/lit8 v10, v3, -0x1

    invoke-virtual {p0, v6, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v7, v10}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 301
    add-int/lit8 v3, v3, -0x1

    goto :goto_3

    .line 303
    :cond_a
    invoke-virtual {p0, v6, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v7, v10}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 309
    :cond_b
    add-int/lit8 v3, v3, 0x1

    goto :goto_3
.end method

.method private static getFontSizeAccordingHeight(I)I
    .locals 8
    .param p0, "height"    # I

    .prologue
    .line 376
    new-instance v4, Landroid/graphics/Paint;

    invoke-direct {v4}, Landroid/graphics/Paint;-><init>()V

    .line 378
    .local v4, "paint":Landroid/graphics/Paint;
    sget-object v5, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 379
    const/4 v3, 0x0

    .line 380
    .local v3, "incr_text_size":I
    const/4 v1, 0x0

    .line 382
    .local v1, "found_desired_size":Z
    :goto_0
    if-eqz v1, :cond_0

    .line 394
    return v3

    .line 383
    :cond_0
    add-int/lit8 v3, v3, 0x1

    .line 384
    int-to-float v5, v3

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 386
    invoke-virtual {v4}, Landroid/graphics/Paint;->getFontMetricsInt()Landroid/graphics/Paint$FontMetricsInt;

    move-result-object v0

    .line 387
    .local v0, "fm":Landroid/graphics/Paint$FontMetricsInt;
    iget v5, v0, Landroid/graphics/Paint$FontMetricsInt;->descent:I

    iget v6, v0, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    sub-int/2addr v5, v6

    iget v6, v0, Landroid/graphics/Paint$FontMetricsInt;->leading:I

    add-int/2addr v5, v6

    int-to-double v5, v5

    invoke-static {v5, v6}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v5

    double-to-int v2, v5

    .line 389
    .local v2, "h":I
    sub-int v5, p0, v2

    const/4 v6, 0x2

    if-gt v5, v6, :cond_1

    .line 390
    const/4 v1, 0x1

    .line 392
    :cond_1
    const-string v5, "font size"

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "incr size:"

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private static getPixels(Landroid/graphics/Bitmap;)[B
    .locals 4
    .param p0, "pBitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 364
    if-eqz p0, :cond_0

    .line 365
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    mul-int/2addr v2, v3

    mul-int/lit8 v2, v2, 0x4

    new-array v1, v2, [B

    .line 366
    .local v1, "pixels":[B
    invoke-static {v1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 367
    .local v0, "buf":Ljava/nio/ByteBuffer;
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 368
    invoke-virtual {p0, v0}, Landroid/graphics/Bitmap;->copyPixelsToBuffer(Ljava/nio/Buffer;)V

    .line 372
    .end local v0    # "buf":Ljava/nio/ByteBuffer;
    .end local v1    # "pixels":[B
    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private static getStringWithEllipsis(Ljava/lang/String;FF)Ljava/lang/String;
    .locals 2
    .param p0, "pString"    # Ljava/lang/String;
    .param p1, "width"    # F
    .param p2, "fontSize"    # F

    .prologue
    .line 398
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 399
    const-string v1, ""

    .line 406
    :goto_0
    return-object v1

    .line 402
    :cond_0
    new-instance v0, Landroid/text/TextPaint;

    invoke-direct {v0}, Landroid/text/TextPaint;-><init>()V

    .line 403
    .local v0, "paint":Landroid/text/TextPaint;
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    invoke-virtual {v0, v1}, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 404
    invoke-virtual {v0, p2}, Landroid/text/TextPaint;->setTextSize(F)V

    .line 406
    sget-object v1, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-static {p0, v0, p1, v1}, Landroid/text/TextUtils;->ellipsize(Ljava/lang/CharSequence;Landroid/text/TextPaint;FLandroid/text/TextUtils$TruncateAt;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method private static initNativeObject(Landroid/graphics/Bitmap;)V
    .locals 3
    .param p0, "pBitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 355
    invoke-static {p0}, Lorg/cocos2dx/lib/Cocos2dxBitmap;->getPixels(Landroid/graphics/Bitmap;)[B

    move-result-object v0

    .line 356
    .local v0, "pixels":[B
    if-nez v0, :cond_0

    .line 361
    :goto_0
    return-void

    .line 360
    :cond_0
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    invoke-static {v1, v2, v0}, Lorg/cocos2dx/lib/Cocos2dxBitmap;->nativeInitBitmapDC(II[B)V

    goto :goto_0
.end method

.method private static native nativeInitBitmapDC(II[B)V
.end method

.method private static newPaint(Ljava/lang/String;II)Landroid/graphics/Paint;
    .locals 7
    .param p0, "pFontName"    # Ljava/lang/String;
    .param p1, "pFontSize"    # I
    .param p2, "pHorizontalAlignment"    # I

    .prologue
    const/4 v6, 0x0

    .line 120
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    .line 121
    .local v1, "paint":Landroid/graphics/Paint;
    const/4 v3, -0x1

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 122
    int-to-float v3, p1

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 123
    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 126
    const-string v3, ".ttf"

    invoke-virtual {p0, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 128
    :try_start_0
    sget-object v3, Lorg/cocos2dx/lib/Cocos2dxBitmap;->sContext:Landroid/content/Context;

    invoke-static {v3, p0}, Lorg/cocos2dx/lib/Cocos2dxTypefaces;->get(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v2

    .line 129
    .local v2, "typeFace":Landroid/graphics/Typeface;
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 140
    .end local v2    # "typeFace":Landroid/graphics/Typeface;
    :goto_0
    packed-switch p2, :pswitch_data_0

    .line 149
    sget-object v3, Landroid/graphics/Paint$Align;->LEFT:Landroid/graphics/Paint$Align;

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 153
    :goto_1
    return-object v1

    .line 130
    :catch_0
    move-exception v0

    .line 131
    .local v0, "e":Ljava/lang/Exception;
    const-string v3, "Cocos2dxBitmap"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "error to create ttf type face: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 134
    invoke-static {p0, v6}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    goto :goto_0

    .line 137
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_0
    invoke-static {p0, v6}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    goto :goto_0

    .line 142
    :pswitch_0
    sget-object v3, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    goto :goto_1

    .line 145
    :pswitch_1
    sget-object v3, Landroid/graphics/Paint$Align;->RIGHT:Landroid/graphics/Paint$Align;

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    goto :goto_1

    .line 140
    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static refactorString(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p0, "pString"    # Ljava/lang/String;

    .prologue
    .line 326
    const-string v3, ""

    invoke-virtual {p0, v3}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v3

    if-nez v3, :cond_0

    .line 327
    const-string v3, " "

    .line 351
    :goto_0
    return-object v3

    .line 333
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 334
    .local v2, "strBuilder":Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .line 335
    .local v1, "start":I
    const-string v3, "\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 336
    .local v0, "index":I
    :goto_1
    const/4 v3, -0x1

    if-ne v0, v3, :cond_2

    .line 351
    :cond_1
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    .line 337
    :cond_2
    if-eqz v0, :cond_3

    add-int/lit8 v3, v0, -0x1

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v3

    const/16 v4, 0xa

    if-ne v3, v4, :cond_4

    .line 338
    :cond_3
    const-string v3, " "

    invoke-virtual {v2, v0, v3}, Ljava/lang/StringBuilder;->insert(ILjava/lang/String;)Ljava/lang/StringBuilder;

    .line 339
    add-int/lit8 v1, v0, 0x2

    .line 344
    :goto_2
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    if-gt v1, v3, :cond_1

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    if-eq v0, v3, :cond_1

    .line 348
    const-string v3, "\n"

    invoke-virtual {v2, v3, v1}, Ljava/lang/StringBuilder;->indexOf(Ljava/lang/String;I)I

    move-result v0

    goto :goto_1

    .line 341
    :cond_4
    add-int/lit8 v1, v0, 0x1

    goto :goto_2
.end method

.method public static setContext(Landroid/content/Context;)V
    .locals 0
    .param p0, "pContext"    # Landroid/content/Context;

    .prologue
    .line 72
    sput-object p0, Lorg/cocos2dx/lib/Cocos2dxBitmap;->sContext:Landroid/content/Context;

    .line 73
    return-void
.end method

.method private static splitString(Ljava/lang/String;IILandroid/graphics/Paint;)[Ljava/lang/String;
    .locals 12
    .param p0, "pString"    # Ljava/lang/String;
    .param p1, "pMaxWidth"    # I
    .param p2, "pMaxHeight"    # I
    .param p3, "pPaint"    # Landroid/graphics/Paint;

    .prologue
    .line 223
    const-string v9, "\\n"

    invoke-virtual {p0, v9}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 224
    .local v5, "lines":[Ljava/lang/String;
    const/4 v7, 0x0

    .line 225
    .local v7, "ret":[Ljava/lang/String;
    invoke-virtual {p3}, Landroid/graphics/Paint;->getFontMetricsInt()Landroid/graphics/Paint$FontMetricsInt;

    move-result-object v0

    .line 226
    .local v0, "fm":Landroid/graphics/Paint$FontMetricsInt;
    iget v9, v0, Landroid/graphics/Paint$FontMetricsInt;->descent:I

    iget v10, v0, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    sub-int/2addr v9, v10

    iget v10, v0, Landroid/graphics/Paint$FontMetricsInt;->leading:I

    add-int/2addr v9, v10

    int-to-double v9, v9

    invoke-static {v9, v10}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v9

    double-to-int v1, v9

    .line 227
    .local v1, "heightPerLine":I
    div-int v6, p2, v1

    .line 229
    .local v6, "maxLines":I
    if-eqz p1, :cond_6

    .line 230
    new-instance v8, Ljava/util/LinkedList;

    invoke-direct {v8}, Ljava/util/LinkedList;-><init>()V

    .line 231
    .local v8, "strList":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Ljava/lang/String;>;"
    array-length v10, v5

    const/4 v9, 0x0

    :goto_0
    if-lt v9, v10, :cond_2

    .line 247
    :cond_0
    if-lez v6, :cond_1

    invoke-virtual {v8}, Ljava/util/LinkedList;->size()I

    move-result v9

    if-le v9, v6, :cond_1

    .line 248
    :goto_1
    invoke-virtual {v8}, Ljava/util/LinkedList;->size()I

    move-result v9

    if-gt v9, v6, :cond_5

    .line 253
    :cond_1
    invoke-virtual {v8}, Ljava/util/LinkedList;->size()I

    move-result v9

    new-array v7, v9, [Ljava/lang/String;

    .line 254
    invoke-virtual {v8, v7}, Ljava/util/LinkedList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 267
    .end local v8    # "strList":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Ljava/lang/String;>;"
    :goto_2
    return-object v7

    .line 231
    .restart local v8    # "strList":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Ljava/lang/String;>;"
    :cond_2
    aget-object v3, v5, v9

    .line 233
    .local v3, "line":Ljava/lang/String;
    invoke-virtual {p3, v3}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v11

    invoke-static {v11}, Landroid/util/FloatMath;->ceil(F)F

    move-result v11

    float-to-int v4, v11

    .line 234
    .local v4, "lineWidth":I
    if-le v4, p1, :cond_4

    .line 235
    invoke-static {v3, p1, p3}, Lorg/cocos2dx/lib/Cocos2dxBitmap;->divideStringWithMaxWidth(Ljava/lang/String;ILandroid/graphics/Paint;)Ljava/util/LinkedList;

    move-result-object v11

    invoke-virtual {v8, v11}, Ljava/util/LinkedList;->addAll(Ljava/util/Collection;)Z

    .line 241
    :goto_3
    if-lez v6, :cond_3

    invoke-virtual {v8}, Ljava/util/LinkedList;->size()I

    move-result v11

    if-ge v11, v6, :cond_0

    .line 231
    :cond_3
    add-int/lit8 v9, v9, 0x1

    goto :goto_0

    .line 237
    :cond_4
    invoke-virtual {v8, v3}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 249
    .end local v3    # "line":Ljava/lang/String;
    .end local v4    # "lineWidth":I
    :cond_5
    invoke-virtual {v8}, Ljava/util/LinkedList;->removeLast()Ljava/lang/Object;

    goto :goto_1

    .line 255
    .end local v8    # "strList":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Ljava/lang/String;>;"
    :cond_6
    if-eqz p2, :cond_8

    array-length v9, v5

    if-le v9, v6, :cond_8

    .line 257
    new-instance v8, Ljava/util/LinkedList;

    invoke-direct {v8}, Ljava/util/LinkedList;-><init>()V

    .line 258
    .restart local v8    # "strList":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Ljava/lang/String;>;"
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_4
    if-lt v2, v6, :cond_7

    .line 261
    invoke-virtual {v8}, Ljava/util/LinkedList;->size()I

    move-result v9

    new-array v7, v9, [Ljava/lang/String;

    .line 262
    invoke-virtual {v8, v7}, Ljava/util/LinkedList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    goto :goto_2

    .line 259
    :cond_7
    aget-object v9, v5, v2

    invoke-virtual {v8, v9}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 258
    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    .line 264
    .end local v2    # "i":I
    .end local v8    # "strList":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Ljava/lang/String;>;"
    :cond_8
    move-object v7, v5

    goto :goto_2
.end method
