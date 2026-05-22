.class Lcom/taomee/seer2/seer2$3;
.super Ljava/lang/Object;
.source "seer2.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/taomee/seer2/seer2;->removeWebView()V
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
    iput-object p1, p0, Lcom/taomee/seer2/seer2$3;->this$0:Lcom/taomee/seer2/seer2;

    .line 244
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 246
    iget-object v0, p0, Lcom/taomee/seer2/seer2$3;->this$0:Lcom/taomee/seer2/seer2;

    invoke-static {v0}, Lcom/taomee/seer2/seer2;->access$1(Lcom/taomee/seer2/seer2;)Landroid/widget/LinearLayout;

    move-result-object v0

    iget-object v1, p0, Lcom/taomee/seer2/seer2$3;->this$0:Lcom/taomee/seer2/seer2;

    invoke-static {v1}, Lcom/taomee/seer2/seer2;->access$2(Lcom/taomee/seer2/seer2;)Landroid/webkit/WebView;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    .line 247
    iget-object v0, p0, Lcom/taomee/seer2/seer2$3;->this$0:Lcom/taomee/seer2/seer2;

    invoke-static {v0}, Lcom/taomee/seer2/seer2;->access$2(Lcom/taomee/seer2/seer2;)Landroid/webkit/WebView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/webkit/WebView;->destroy()V

    .line 248
    return-void
.end method
