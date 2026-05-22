.class Le22/c55/s88/g/h;
.super Landroid/webkit/WebViewClient;


# instance fields
.field final synthetic a:Le22/c55/s88/g/g;


# direct methods
.method constructor <init>(Le22/c55/s88/g/g;)V
    .locals 0

    iput-object p1, p0, Le22/c55/s88/g/h;->a:Le22/c55/s88/g/g;

    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    return-void
.end method


# virtual methods
.method public shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 1

    invoke-virtual {p1, p2}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    const/4 v0, 0x1

    return v0
.end method
