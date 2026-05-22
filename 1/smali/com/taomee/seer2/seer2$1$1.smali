.class Lcom/taomee/seer2/seer2$1$1;
.super Landroid/webkit/WebViewClient;
.source "seer2.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/taomee/seer2/seer2$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/taomee/seer2/seer2$1;


# direct methods
.method constructor <init>(Lcom/taomee/seer2/seer2$1;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/taomee/seer2/seer2$1$1;->this$1:Lcom/taomee/seer2/seer2$1;

    .line 217
    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    return-void
.end method


# virtual methods
.method public shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 1
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 222
    const/4 v0, 0x0

    return v0
.end method
