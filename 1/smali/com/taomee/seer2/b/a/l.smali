.class final Lcom/taomee/seer2/b/a/l;
.super Landroid/os/Handler;


# direct methods
.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 4

    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    invoke-static {}, Lcom/taomee/seer2/b/o;->a()Lcom/taomee/seer2/b/o;

    move-result-object v0

    invoke-static {}, Lcom/taomee/seer2/b/a/k;->a()Landroid/content/Context;

    move-result-object v1

    iget v2, p1, Landroid/os/Message;->what:I

    const/4 v3, 0x2

    invoke-virtual {v0, v1, v2, v3}, Lcom/taomee/seer2/b/o;->a(Landroid/content/Context;II)V

    :goto_0
    return-void

    :pswitch_0
    invoke-static {}, Lcom/taomee/seer2/b/a/k;->a()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/taomee/seer2/b/f;->a(Landroid/content/Context;)Lcom/taomee/seer2/b/f;

    move-result-object v0

    invoke-static {}, Lcom/taomee/seer2/b/a/k;->a()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/taomee/seer2/b/c/i;->p(Landroid/content/Context;)I

    move-result v1

    invoke-static {}, Lcom/taomee/seer2/b/a/k;->a()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/taomee/seer2/b/c/i;->o(Landroid/content/Context;)I

    move-result v2

    invoke-virtual {v0, v1, v2}, Lcom/taomee/seer2/b/f;->a(II)V

    goto :goto_0

    :pswitch_data_0
    .packed-switch -0xa
        :pswitch_0
    .end packed-switch
.end method
