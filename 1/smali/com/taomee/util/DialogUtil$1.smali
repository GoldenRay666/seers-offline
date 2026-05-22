.class Lcom/taomee/util/DialogUtil$1;
.super Ljava/lang/Object;
.source "DialogUtil.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/taomee/util/DialogUtil;->showExitHintDialog()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 10
    sget-object v0, Lcom/taomee/seer2/seer2;->actInstance:Lcom/taomee/seer2/seer2;

    invoke-virtual {v0}, Lcom/taomee/seer2/seer2;->showExitDialog()V

    .line 11
    return-void
.end method
