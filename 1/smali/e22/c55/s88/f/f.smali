.class public Le22/c55/s88/f/f;
.super Ljava/lang/Object;


# static fields
.field private static a:[I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0xc8

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Le22/c55/s88/f/f;->a:[I

    return-void

    :array_0
    .array-data 4
        0x4a
        0x1d
        0x27
        0x29
        0x2e
        0x46
        0x9
        0x25
        0x52
        0x4e
        0x52
        0x1a
        0x2b
        0x1f
        0x9
        0xc
        0x5d
        0x48
        0x4a
        0xc
        0x14
        0x5c
        0x21
        0x8
        0x11
        0x1e
        0x4d
        0x55
        0x43
        0x41
        0x4b
        0x17
        0x52
        0x3d
        0x1
        0x53
        0x7
        0x18
        0x54
        0x4f
        0xa
        0x47
        0x47
        0x41
        0xb
        0x36
        0x5f
        0x25
        0x4d
        0xe
        0x51
        0xa
        0x3c
        0x3a
        0x5f
        0x3d
        0x58
        0x5c
        0x47
        0x4e
        0x23
        0x5b
        0x9
        0x34
        0x2d
        0x3b
        0x29
        0x13
        0x42
        0x23
        0x0
        0x4e
        0x44
        0x44
        0x6
        0x15
        0x61
        0x21
        0x21
        0x40
        0xc
        0x4e
        0x2f
        0x7
        0x15
        0x24
        0x26
        0x14
        0x52
        0x10
        0x7
        0x2f
        0x7
        0x2c
        0x3a
        0x10
        0x28
        0x2b
        0x37
        0x23
        0x30
        0x3f
        0x2c
        0x4e
        0x20
        0x53
        0x19
        0x12
        0x4a
        0x53
        0x3e
        0x28
        0x28
        0x44
        0x12
        0x4f
        0xa
        0x22
        0x1f
        0x17
        0x4d
        0x4e
        0x18
        0x5e
        0x18
        0xd
        0x0
        0x2d
        0x58
        0x9
        0x1
        0x3b
        0x38
        0x5f
        0x55
        0x0
        0x46
        0x54
        0xf
        0x3c
        0x37
        0x31
        0x3c
        0xf
        0x44
        0x12
        0x3b
        0x3e
        0x4
        0x3c
        0x5b
        0x1d
        0x39
        0x9
        0x63
        0x40
        0x2e
        0x55
        0x11
        0x1c
        0x4e
        0x1b
        0x14
        0x55
        0x47
        0x29
        0x4
        0x5
        0x40
        0x53
        0x37
        0x23
        0x1b
        0xb
        0x1f
        0x10
        0x49
        0x60
        0x16
        0x5c
        0x47
        0x9
        0x59
        0x30
        0x63
        0x63
        0x9
        0x3f
        0x40
        0x27
        0x59
        0x1a
        0x2a
        0x2b
        0x46
        0x1d
        0x41
        0x2f
        0x18
        0x1b
    .end array-data
.end method

.method public static a(Ljava/lang/String;)Ljava/lang/String;
    .locals 6

    if-nez p0, :cond_0

    const-string v0, ""

    :goto_0
    return-object v0

    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "s"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v2

    const/4 v0, 0x0

    :goto_1
    :try_start_0
    array-length v3, v2

    if-ge v0, v3, :cond_1

    aget-char v3, v2, v0

    sget-object v4, Le22/c55/s88/f/f;->a:[I

    sget-object v5, Le22/c55/s88/f/f;->a:[I

    array-length v5, v5

    rem-int v5, v0, v5

    aget v4, v4, v5

    add-int/2addr v3, v4

    int-to-char v3, v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :cond_1
    const-string v0, "e"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static b(Ljava/lang/String;)Ljava/lang/String;
    .locals 6

    const/4 v0, 0x0

    if-nez p0, :cond_0

    const-string v0, ""

    :goto_0
    return-object v0

    :cond_0
    const-string v1, "s"

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    const-string v1, "e"

    invoke-virtual {p0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->deleteCharAt(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->deleteCharAt(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    :goto_1
    :try_start_0
    array-length v3, v1

    if-ge v0, v3, :cond_1

    aget-char v3, v1, v0

    sget-object v4, Le22/c55/s88/f/f;->a:[I

    sget-object v5, Le22/c55/s88/f/f;->a:[I

    array-length v5, v5

    rem-int v5, v0, v5

    aget v4, v4, v5

    sub-int/2addr v3, v4

    int-to-char v3, v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :cond_1
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_2
    const-string v0, ""

    goto :goto_0
.end method
