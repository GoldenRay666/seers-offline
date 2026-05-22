.class public Lcom/taomee/android/pay/UIHelper;
.super Ljava/lang/Object;
.source "UIHelper.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static dp2px(FLandroid/content/Context;)I
    .locals 5
    .param p0, "dp"    # F
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 42
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v0, v1, Landroid/util/DisplayMetrics;->density:F

    .line 43
    .local v0, "scale":F
    mul-float v1, p0, v0

    float-to-double v1, v1

    const-wide/high16 v3, 0x3fe0000000000000L    # 0.5

    add-double/2addr v1, v3

    double-to-int v1, v1

    return v1
.end method

.method public static md5(Ljava/lang/String;)Ljava/lang/String;
    .locals 11
    .param p0, "string"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x0

    .line 65
    if-nez p0, :cond_0

    .line 80
    :goto_0
    return-object v6

    .line 68
    :cond_0
    :try_start_0
    const-string v7, "MD5"

    invoke-static {v7}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v3

    .line 69
    .local v3, "md":Ljava/security/MessageDigest;
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object v7

    invoke-virtual {v3, v7}, Ljava/security/MessageDigest;->update([B)V

    .line 70
    invoke-virtual {v3}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v0

    .line 71
    .local v0, "buffer":[B
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 72
    .local v5, "sb":Ljava/lang/StringBuilder;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    array-length v7, v0

    if-lt v2, v7, :cond_1

    .line 76
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    goto :goto_0

    .line 73
    :cond_1
    const-string v7, "%02x"

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    aget-byte v10, v0, v2

    invoke-static {v10}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-static {v7, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .line 74
    .local v4, "s":Ljava/lang/String;
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    .line 72
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 77
    .end local v0    # "buffer":[B
    .end local v2    # "i":I
    .end local v3    # "md":Ljava/security/MessageDigest;
    .end local v4    # "s":Ljava/lang/String;
    .end local v5    # "sb":Ljava/lang/StringBuilder;
    :catch_0
    move-exception v1

    .line 78
    .local v1, "e":Ljava/security/NoSuchAlgorithmException;
    invoke-virtual {v1}, Ljava/security/NoSuchAlgorithmException;->printStackTrace()V

    goto :goto_0
.end method

.method public static px2dp(FLandroid/content/Context;)I
    .locals 5
    .param p0, "px"    # F
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 47
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v0, v1, Landroid/util/DisplayMetrics;->density:F

    .line 48
    .local v0, "scale":F
    div-float v1, p0, v0

    float-to-double v1, v1

    const-wide/high16 v3, 0x3fe0000000000000L    # 0.5

    add-double/2addr v1, v3

    double-to-int v1, v1

    return v1
.end method

.method public static varargs showConfirmDialog(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;[Ljava/lang/Object;)V
    .locals 8
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "title"    # Ljava/lang/CharSequence;
    .param p2, "message"    # Ljava/lang/CharSequence;
    .param p3, "buttons"    # [Ljava/lang/Object;

    .prologue
    const/4 v7, 0x2

    .line 23
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 24
    .local v0, "alertDialog":Landroid/app/AlertDialog$Builder;
    invoke-virtual {v0, p1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 25
    invoke-virtual {v0, p2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 26
    if-eqz p3, :cond_1

    .line 27
    array-length v5, p3

    if-lt v5, v7, :cond_0

    .line 28
    const/4 v5, 0x0

    aget-object v2, p3, v5

    check-cast v2, Ljava/lang/String;

    .line 29
    .local v2, "button1Title":Ljava/lang/String;
    const/4 v5, 0x1

    aget-object v1, p3, v5

    check-cast v1, Landroid/content/DialogInterface$OnClickListener;

    .line 30
    .local v1, "button1Listener":Landroid/content/DialogInterface$OnClickListener;
    invoke-virtual {v0, v2, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 32
    .end local v1    # "button1Listener":Landroid/content/DialogInterface$OnClickListener;
    .end local v2    # "button1Title":Ljava/lang/String;
    :cond_0
    array-length v5, p3

    const/4 v6, 0x4

    if-lt v5, v6, :cond_1

    .line 33
    aget-object v4, p3, v7

    check-cast v4, Ljava/lang/String;

    .line 34
    .local v4, "button2Title":Ljava/lang/String;
    const/4 v5, 0x3

    aget-object v3, p3, v5

    check-cast v3, Landroid/content/DialogInterface$OnClickListener;

    .line 35
    .local v3, "button2Listener":Landroid/content/DialogInterface$OnClickListener;
    invoke-virtual {v0, v4, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 38
    .end local v3    # "button2Listener":Landroid/content/DialogInterface$OnClickListener;
    .end local v4    # "button2Title":Ljava/lang/String;
    :cond_1
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 39
    return-void
.end method

.method public static showProgress(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZZ)Landroid/app/ProgressDialog;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "title"    # Ljava/lang/CharSequence;
    .param p2, "message"    # Ljava/lang/CharSequence;
    .param p3, "indeterminate"    # Z
    .param p4, "cancelable"    # Z

    .prologue
    .line 13
    new-instance v0, Landroid/app/ProgressDialog;

    invoke-direct {v0, p0}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    .line 14
    .local v0, "dialog":Landroid/app/ProgressDialog;
    invoke-virtual {v0, p1}, Landroid/app/ProgressDialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 15
    invoke-virtual {v0, p2}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 16
    invoke-virtual {v0, p3}, Landroid/app/ProgressDialog;->setIndeterminate(Z)V

    .line 17
    invoke-virtual {v0, p4}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    .line 18
    invoke-virtual {v0}, Landroid/app/ProgressDialog;->show()V

    .line 19
    return-object v0
.end method

.method public static substring(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "from"    # Ljava/lang/String;
    .param p1, "to"    # Ljava/lang/String;
    .param p2, "string"    # Ljava/lang/String;

    .prologue
    .line 54
    :try_start_0
    invoke-virtual {p2, p0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    .line 55
    .local v2, "start":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    add-int/2addr v2, v3

    .line 56
    invoke-virtual {p2, p1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v1

    .line 57
    .local v1, "end":I
    invoke-virtual {p2, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 61
    .end local v1    # "end":I
    .end local v2    # "start":I
    :goto_0
    return-object v3

    .line 58
    :catch_0
    move-exception v0

    .line 59
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 61
    const/4 v3, 0x0

    goto :goto_0
.end method
