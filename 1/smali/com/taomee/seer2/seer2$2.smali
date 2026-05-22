.class Lcom/taomee/seer2/seer2$2;
.super Ljava/lang/Object;
.source "seer2.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/taomee/seer2/seer2;->updateURL(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/taomee/seer2/seer2;

.field private final synthetic val$url:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/taomee/seer2/seer2;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/taomee/seer2/seer2$2;->this$0:Lcom/taomee/seer2/seer2;

    iput-object p2, p0, Lcom/taomee/seer2/seer2$2;->val$url:Ljava/lang/String;

    .line 234
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 236
    iget-object v0, p0, Lcom/taomee/seer2/seer2$2;->this$0:Lcom/taomee/seer2/seer2;

    invoke-static {v0}, Lcom/taomee/seer2/seer2;->access$2(Lcom/taomee/seer2/seer2;)Landroid/webkit/WebView;

    move-result-object v0

    iget-object v1, p0, Lcom/taomee/seer2/seer2$2;->val$url:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 237
    return-void
.end method
