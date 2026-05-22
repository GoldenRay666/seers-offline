.class Lcom/veegao/demo/Vgao_demoActivity$1;
.super Ljava/lang/Object;
.source "Vgao_demoActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/veegao/demo/Vgao_demoActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/veegao/demo/Vgao_demoActivity;


# direct methods
.method constructor <init>(Lcom/veegao/demo/Vgao_demoActivity;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/veegao/demo/Vgao_demoActivity$1;->this$0:Lcom/veegao/demo/Vgao_demoActivity;

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 25
    iget-object v0, p0, Lcom/veegao/demo/Vgao_demoActivity$1;->this$0:Lcom/veegao/demo/Vgao_demoActivity;

    invoke-static {v0}, Le22/c55/s88/VManager;->getInstance(Landroid/content/Context;)Le22/c55/s88/VManager;

    move-result-object v0

    iget-object v1, p0, Lcom/veegao/demo/Vgao_demoActivity$1;->this$0:Lcom/veegao/demo/Vgao_demoActivity;

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Le22/c55/s88/VManager;->getMessage(Landroid/content/Context;Z)V

    .line 26
    return-void
.end method
