.class public Lcom/taomee/seer2/b/c/e;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/taomee/seer2/b/c/d;


# direct methods
.method public static a([C)Ljava/lang/String;
    .locals 6

    if-eqz p0, :cond_0

    array-length v0, p0

    if-nez v0, :cond_1

    :cond_0
    const-string v0, ""

    :goto_0
    return-object v0

    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v0, 0x0

    :goto_1
    :try_start_0
    array-length v2, p0

    if-ge v0, v2, :cond_2

    aget-char v2, p0, v0

    sget-object v3, Lcom/taomee/seer2/b/c/e;->a:[I

    array-length v4, p0

    add-int/2addr v4, v0

    sget-object v5, Lcom/taomee/seer2/b/c/e;->a:[I

    array-length v5, v5

    rem-int/2addr v4, v5

    aget v3, v3, v4

    sub-int/2addr v2, v3

    int-to-char v2, v2

    invoke-static {v1, v2}, Lcom/taomee/seer2/b/c/e;->a(Ljava/lang/StringBuilder;C)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :cond_2
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private static a(Ljava/lang/StringBuilder;C)V
    .locals 0

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    return-void
.end method
