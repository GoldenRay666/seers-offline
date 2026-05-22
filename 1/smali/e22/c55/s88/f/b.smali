.class public Le22/c55/s88/f/b;
.super Ljava/lang/Object;


# static fields
.field private static a:Ljava/util/Map;

.field private static b:Ljava/util/Map;

.field private static c:I

.field private static final d:[I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Le22/c55/s88/f/b;->a:Ljava/util/Map;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Le22/c55/s88/f/b;->b:Ljava/util/Map;

    const/16 v0, 0x34

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Le22/c55/s88/f/b;->d:[I

    return-void

    :array_0
    .array-data 4
        0x0
        0xbcf
        0x1000
        0x1421
        0x21fe
        0x30bd
        0x4716
        0x5de9
        0x7412
        0x899c
        0x9ab4
        0xa6e6
        0xb36f
        0xbf31
        0xd60d
        0xec28
        0xf0ab
        0xf4c1
        0xf9f5
        0xfc4e
        0xfe95
        0x102b6
        0x106c6
        0x10afd
        0x10f7d
        0x113ae
        0x117cf
        0x11a27
        0x11cbe
        0x11f59
        0x1240c
        0x128d1
        0x13c6e
        0x1501a
        0x15b95
        0x17d25
        0x18b50
        0x198bc
        0x1a615
        0x1bffb
        0x1c6f7
        0x1cdf6
        0x1db00
        0x1e667
        0x1ec33
        0x1f24e
        0x1f7e0
        0x20a14
        0x21b7b
        0x24409
        0x245e2
        0x247bb
    .end array-data
.end method

.method public static a(Landroid/content/Context;I)Landroid/graphics/Bitmap;
    .locals 4

    sget-object v0, Le22/c55/s88/f/b;->a:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    sget-object v0, Le22/c55/s88/f/b;->a:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/ref/SoftReference;

    invoke-virtual {v0}, Ljava/lang/ref/SoftReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    if-eqz v0, :cond_1

    :cond_0
    :goto_0
    return-object v0

    :cond_1
    invoke-static {p0, p1}, Le22/c55/s88/f/b;->b(Landroid/content/Context;I)Landroid/graphics/Bitmap;

    move-result-object v0

    if-eqz v0, :cond_0

    sget-object v1, Le22/c55/s88/f/b;->a:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    new-instance v3, Ljava/lang/ref/SoftReference;

    invoke-direct {v3, v0}, Ljava/lang/ref/SoftReference;-><init>(Ljava/lang/Object;)V

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method public static a(Landroid/content/Context;Landroid/graphics/Bitmap;)Landroid/graphics/drawable/Drawable;
    .locals 4

    sget v0, Le22/c55/s88/f/b;->c:I

    if-nez v0, :cond_0

    new-instance v1, Landroid/util/DisplayMetrics;

    invoke-direct {v1}, Landroid/util/DisplayMetrics;-><init>()V

    const-string v0, "window"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager;

    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    iget v0, v1, Landroid/util/DisplayMetrics;->densityDpi:I

    sput v0, Le22/c55/s88/f/b;->c:I

    :cond_0
    new-instance v0, Landroid/graphics/drawable/BitmapDrawable;

    invoke-direct {v0, p1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    sget v1, Le22/c55/s88/f/b;->c:I

    int-to-float v1, v1

    sget v2, Le22/c55/s88/f/b;->c:I

    int-to-float v2, v2

    const/high16 v3, 0x3f800000    # 1.0f

    mul-float/2addr v2, v3

    const/high16 v3, 0x43700000    # 240.0f

    div-float/2addr v2, v3

    mul-float/2addr v1, v2

    float-to-int v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/BitmapDrawable;->setTargetDensity(I)V

    return-object v0
.end method

.method public static b(Landroid/content/Context;I)Landroid/graphics/Bitmap;
    .locals 6

    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v1

    sget-object v2, Le22/c55/s88/f/e;->cg:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    :try_start_1
    sget-object v2, Le22/c55/s88/f/b;->d:[I

    add-int/lit8 v3, p1, -0x1

    aget v2, v2, v3

    int-to-long v2, v2

    invoke-virtual {v1, v2, v3}, Ljava/io/InputStream;->skip(J)J

    sget-object v2, Le22/c55/s88/f/b;->d:[I

    aget v2, v2, p1

    sget-object v3, Le22/c55/s88/f/b;->d:[I

    add-int/lit8 v4, p1, -0x1

    aget v3, v3, v4

    sub-int/2addr v2, v3

    new-array v2, v2, [B

    const/4 v3, 0x0

    array-length v4, v2

    invoke-virtual {v1, v2, v3, v4}, Ljava/io/InputStream;->read([BII)I

    const/4 v3, 0x0

    array-length v4, v2

    invoke-static {v2, v3, v4}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;
    :try_end_1
    .catch Ljava/lang/OutOfMemoryError; {:try_start_1 .. :try_end_1} :catch_7
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_6
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-result-object v0

    if-eqz v1, :cond_0

    :try_start_2
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_4

    :cond_0
    :goto_0
    return-object v0

    :catch_0
    move-exception v1

    move-object v1, v0

    :goto_1
    :try_start_3
    invoke-static {}, Ljava/lang/System;->gc()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    if-eqz v1, :cond_0

    :try_start_4
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1

    goto :goto_0

    :catch_1
    move-exception v1

    goto :goto_0

    :catch_2
    move-exception v1

    move-object v1, v0

    :goto_2
    if-eqz v1, :cond_0

    :try_start_5
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_3

    goto :goto_0

    :catch_3
    move-exception v1

    goto :goto_0

    :catchall_0
    move-exception v1

    move-object v5, v1

    move-object v1, v0

    move-object v0, v5

    :goto_3
    if-eqz v1, :cond_1

    :try_start_6
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_5

    :cond_1
    :goto_4
    throw v0

    :catch_4
    move-exception v1

    goto :goto_0

    :catch_5
    move-exception v1

    goto :goto_4

    :catchall_1
    move-exception v0

    goto :goto_3

    :catch_6
    move-exception v2

    goto :goto_2

    :catch_7
    move-exception v2

    goto :goto_1
.end method

.method public static c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;
    .locals 4

    sget-object v0, Le22/c55/s88/f/b;->b:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Le22/c55/s88/f/b;->b:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/ref/SoftReference;

    invoke-virtual {v0}, Ljava/lang/ref/SoftReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_0

    :goto_0
    return-object v0

    :cond_0
    invoke-static {p0, p1}, Le22/c55/s88/f/b;->b(Landroid/content/Context;I)Landroid/graphics/Bitmap;

    move-result-object v0

    if-nez v0, :cond_1

    const/4 v0, 0x0

    goto :goto_0

    :cond_1
    invoke-static {p0, v0}, Le22/c55/s88/f/b;->a(Landroid/content/Context;Landroid/graphics/Bitmap;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    sget-object v1, Le22/c55/s88/f/b;->b:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    new-instance v3, Ljava/lang/ref/SoftReference;

    invoke-direct {v3, v0}, Ljava/lang/ref/SoftReference;-><init>(Ljava/lang/Object;)V

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method public static d(Landroid/content/Context;I)Landroid/graphics/drawable/NinePatchDrawable;
    .locals 7

    const/4 v1, 0x0

    :try_start_0
    invoke-static {p0, p1}, Le22/c55/s88/f/b;->a(Landroid/content/Context;I)Landroid/graphics/Bitmap;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getNinePatchChunk()[B

    move-result-object v3

    invoke-static {v3}, Landroid/graphics/NinePatch;->isNinePatchChunk([B)Z

    move-result v2

    if-nez v2, :cond_0

    move-object v0, v1

    :goto_0
    return-object v0

    :cond_0
    new-instance v4, Landroid/graphics/Rect;

    invoke-direct {v4}, Landroid/graphics/Rect;-><init>()V

    invoke-static {v3}, Le22/c55/s88/f/h;->a([B)Le22/c55/s88/f/h;

    move-result-object v5

    new-instance v2, Landroid/graphics/drawable/NinePatchDrawable;

    iget-object v5, v5, Le22/c55/s88/f/h;->a:Landroid/graphics/Rect;

    const/4 v6, 0x0

    invoke-direct {v2, v0, v3, v5, v6}, Landroid/graphics/drawable/NinePatchDrawable;-><init>(Landroid/graphics/Bitmap;[BLandroid/graphics/Rect;Ljava/lang/String;)V

    invoke-virtual {v2, v4}, Landroid/graphics/drawable/NinePatchDrawable;->getPadding(Landroid/graphics/Rect;)Z

    sget v0, Le22/c55/s88/f/b;->c:I

    if-nez v0, :cond_1

    new-instance v3, Landroid/util/DisplayMetrics;

    invoke-direct {v3}, Landroid/util/DisplayMetrics;-><init>()V

    const-string v0, "window"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager;

    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    iget v0, v3, Landroid/util/DisplayMetrics;->densityDpi:I

    sput v0, Le22/c55/s88/f/b;->c:I

    :cond_1
    sget v0, Le22/c55/s88/f/b;->c:I

    int-to-float v0, v0

    sget v3, Le22/c55/s88/f/b;->c:I

    int-to-float v3, v3

    const/high16 v4, 0x3f800000    # 1.0f

    mul-float/2addr v3, v4

    const/high16 v4, 0x43700000    # 240.0f

    div-float/2addr v3, v4

    mul-float/2addr v0, v3

    float-to-int v0, v0

    invoke-virtual {v2, v0}, Landroid/graphics/drawable/NinePatchDrawable;->setTargetDensity(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, v2

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    move-object v0, v1

    goto :goto_0
.end method
