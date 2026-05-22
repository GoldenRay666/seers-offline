.class Lcom/taomee/seer2/seer2$8;
.super Ljava/lang/Object;
.source "seer2.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/taomee/seer2/seer2;->showProgressDialog()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 336
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 339
    sget-object v0, Lcom/taomee/seer2/seer2;->actInstance:Lcom/taomee/seer2/seer2;

    .line 340
    sget-object v1, Lcom/taomee/seer2/seer2;->actInstance:Lcom/taomee/seer2/seer2;

    const-string v2, ""

    const-string v3, ""

    .line 339
    invoke-static {v1, v2, v3}, Landroid/app/ProgressDialog;->show(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/app/ProgressDialog;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/taomee/seer2/seer2;->access$3(Lcom/taomee/seer2/seer2;Landroid/app/ProgressDialog;)V

    .line 341
    return-void
.end method
