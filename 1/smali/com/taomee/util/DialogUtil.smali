.class public Lcom/taomee/util/DialogUtil;
.super Ljava/lang/Object;
.source "DialogUtil.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static showExitHintDialog()V
    .locals 2

    .prologue
    .line 7
    sget-object v0, Lcom/taomee/seer2/seer2;->actInstance:Lcom/taomee/seer2/seer2;

    new-instance v1, Lcom/taomee/util/DialogUtil$1;

    invoke-direct {v1}, Lcom/taomee/util/DialogUtil$1;-><init>()V

    invoke-virtual {v0, v1}, Lcom/taomee/seer2/seer2;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 13
    return-void
.end method
