.class public Lcom/taomee/util/VideoUtil;
.super Ljava/lang/Object;
.source "VideoUtil.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static native nativeVideoEnded()V
.end method

.method public static playVideoJNI()V
    .locals 2

    .prologue
    .line 8
    sget-object v0, Lcom/taomee/seer2/seer2;->actInstance:Lcom/taomee/seer2/seer2;

    new-instance v1, Lcom/taomee/util/VideoUtil$1;

    invoke-direct {v1}, Lcom/taomee/util/VideoUtil$1;-><init>()V

    invoke-virtual {v0, v1}, Lcom/taomee/seer2/seer2;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 14
    return-void
.end method
