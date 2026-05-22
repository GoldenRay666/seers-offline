.class Le22/c55/s88/a/h;
.super Landroid/os/Handler;


# instance fields
.field final synthetic a:Le22/c55/s88/a/g;


# direct methods
.method constructor <init>(Le22/c55/s88/a/g;)V
    .locals 0

    iput-object p1, p0, Le22/c55/s88/a/h;->a:Le22/c55/s88/a/g;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 4

    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v0

    sget-object v1, Le22/c55/s88/f/e;->bp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    sget-object v2, Le22/c55/s88/f/e;->bq:Ljava/lang/String;

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v2, p0, Le22/c55/s88/a/h;->a:Le22/c55/s88/a/g;

    invoke-static {v2}, Le22/c55/s88/a/g;->a(Le22/c55/s88/a/g;)Landroid/content/Context;

    move-result-object v2

    const/4 v3, 0x0

    invoke-static {v2, v0, v3}, Le22/c55/s88/f/a;->a(Landroid/content/Context;Ljava/lang/String;Z)Landroid/graphics/Bitmap;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, -0x1

    if-ne v1, v0, :cond_0

    iget-object v0, p0, Le22/c55/s88/a/h;->a:Le22/c55/s88/a/g;

    invoke-virtual {v0}, Le22/c55/s88/a/g;->notifyDataSetChanged()V

    :cond_0
    return-void
.end method
