.class Lcom/taomee/seer2/seer2$11;
.super Ljava/lang/Object;
.source "seer2.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/taomee/seer2/seer2;->showExitDialog()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/taomee/seer2/seer2;


# direct methods
.method constructor <init>(Lcom/taomee/seer2/seer2;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/taomee/seer2/seer2$11;->this$0:Lcom/taomee/seer2/seer2;

    .line 367
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 371
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 372
    sget-object v0, Lcom/taomee/seer2/seer2;->actInstance:Lcom/taomee/seer2/seer2;

    invoke-virtual {v0}, Lcom/taomee/seer2/seer2;->finish()V

    .line 373
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/System;->exit(I)V

    .line 374
    return-void
.end method
