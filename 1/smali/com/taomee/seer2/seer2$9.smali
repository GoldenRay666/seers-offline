.class Lcom/taomee/seer2/seer2$9;
.super Ljava/lang/Object;
.source "seer2.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/taomee/seer2/seer2;->removeProgressDialog()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 346
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 349
    sget-object v0, Lcom/taomee/seer2/seer2;->actInstance:Lcom/taomee/seer2/seer2;

    invoke-static {v0}, Lcom/taomee/seer2/seer2;->access$4(Lcom/taomee/seer2/seer2;)Landroid/app/ProgressDialog;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 350
    sget-object v0, Lcom/taomee/seer2/seer2;->actInstance:Lcom/taomee/seer2/seer2;

    invoke-static {v0}, Lcom/taomee/seer2/seer2;->access$4(Lcom/taomee/seer2/seer2;)Landroid/app/ProgressDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 351
    sget-object v0, Lcom/taomee/seer2/seer2;->actInstance:Lcom/taomee/seer2/seer2;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/taomee/seer2/seer2;->access$3(Lcom/taomee/seer2/seer2;Landroid/app/ProgressDialog;)V

    .line 353
    :cond_0
    return-void
.end method
