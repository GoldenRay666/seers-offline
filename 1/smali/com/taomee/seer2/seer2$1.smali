.class Lcom/taomee/seer2/seer2$1;
.super Ljava/lang/Object;
.source "seer2.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/taomee/seer2/seer2;->displayWebView(IIII)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/taomee/seer2/seer2;

.field private final synthetic val$height:I

.field private final synthetic val$width:I

.field private final synthetic val$x:I

.field private final synthetic val$y:I


# direct methods
.method constructor <init>(Lcom/taomee/seer2/seer2;IIII)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/taomee/seer2/seer2$1;->this$0:Lcom/taomee/seer2/seer2;

    iput p2, p0, Lcom/taomee/seer2/seer2$1;->val$x:I

    iput p3, p0, Lcom/taomee/seer2/seer2$1;->val$y:I

    iput p4, p0, Lcom/taomee/seer2/seer2$1;->val$width:I

    iput p5, p0, Lcom/taomee/seer2/seer2$1;->val$height:I

    .line 199
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 201
    iget-object v1, p0, Lcom/taomee/seer2/seer2$1;->this$0:Lcom/taomee/seer2/seer2;

    new-instance v2, Landroid/webkit/WebView;

    sget-object v3, Lcom/taomee/seer2/seer2;->actInstance:Lcom/taomee/seer2/seer2;

    invoke-direct {v2, v3}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    invoke-static {v1, v2}, Lcom/taomee/seer2/seer2;->access$0(Lcom/taomee/seer2/seer2;Landroid/webkit/WebView;)V

    .line 202
    iget-object v1, p0, Lcom/taomee/seer2/seer2$1;->this$0:Lcom/taomee/seer2/seer2;

    invoke-static {v1}, Lcom/taomee/seer2/seer2;->access$1(Lcom/taomee/seer2/seer2;)Landroid/widget/LinearLayout;

    move-result-object v1

    iget-object v2, p0, Lcom/taomee/seer2/seer2$1;->this$0:Lcom/taomee/seer2/seer2;

    invoke-static {v2}, Lcom/taomee/seer2/seer2;->access$2(Lcom/taomee/seer2/seer2;)Landroid/webkit/WebView;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 204
    iget-object v1, p0, Lcom/taomee/seer2/seer2$1;->this$0:Lcom/taomee/seer2/seer2;

    invoke-static {v1}, Lcom/taomee/seer2/seer2;->access$2(Lcom/taomee/seer2/seer2;)Landroid/webkit/WebView;

    move-result-object v1

    .line 205
    invoke-virtual {v1}, Landroid/webkit/WebView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    .line 204
    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 206
    .local v0, "linearParams":Landroid/widget/LinearLayout$LayoutParams;
    iget v1, p0, Lcom/taomee/seer2/seer2$1;->val$x:I

    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 207
    iget v1, p0, Lcom/taomee/seer2/seer2$1;->val$y:I

    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 208
    iget v1, p0, Lcom/taomee/seer2/seer2$1;->val$width:I

    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 209
    iget v1, p0, Lcom/taomee/seer2/seer2$1;->val$height:I

    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 210
    iget-object v1, p0, Lcom/taomee/seer2/seer2$1;->this$0:Lcom/taomee/seer2/seer2;

    invoke-static {v1}, Lcom/taomee/seer2/seer2;->access$2(Lcom/taomee/seer2/seer2;)Landroid/webkit/WebView;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/webkit/WebView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 212
    iget-object v1, p0, Lcom/taomee/seer2/seer2$1;->this$0:Lcom/taomee/seer2/seer2;

    invoke-static {v1}, Lcom/taomee/seer2/seer2;->access$2(Lcom/taomee/seer2/seer2;)Landroid/webkit/WebView;

    move-result-object v1

    invoke-virtual {v1, v4}, Landroid/webkit/WebView;->setBackgroundColor(I)V

    .line 213
    iget-object v1, p0, Lcom/taomee/seer2/seer2$1;->this$0:Lcom/taomee/seer2/seer2;

    invoke-static {v1}, Lcom/taomee/seer2/seer2;->access$2(Lcom/taomee/seer2/seer2;)Landroid/webkit/WebView;

    move-result-object v1

    invoke-virtual {v1}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v1

    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Landroid/webkit/WebSettings;->setCacheMode(I)V

    .line 214
    iget-object v1, p0, Lcom/taomee/seer2/seer2$1;->this$0:Lcom/taomee/seer2/seer2;

    invoke-static {v1}, Lcom/taomee/seer2/seer2;->access$2(Lcom/taomee/seer2/seer2;)Landroid/webkit/WebView;

    move-result-object v1

    invoke-virtual {v1}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v1

    invoke-virtual {v1, v4}, Landroid/webkit/WebSettings;->setAppCacheEnabled(Z)V

    .line 217
    iget-object v1, p0, Lcom/taomee/seer2/seer2$1;->this$0:Lcom/taomee/seer2/seer2;

    invoke-static {v1}, Lcom/taomee/seer2/seer2;->access$2(Lcom/taomee/seer2/seer2;)Landroid/webkit/WebView;

    move-result-object v1

    new-instance v2, Lcom/taomee/seer2/seer2$1$1;

    invoke-direct {v2, p0}, Lcom/taomee/seer2/seer2$1$1;-><init>(Lcom/taomee/seer2/seer2$1;)V

    invoke-virtual {v1, v2}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 227
    return-void
.end method
