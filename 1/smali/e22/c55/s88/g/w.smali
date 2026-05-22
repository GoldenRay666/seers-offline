.class Le22/c55/s88/g/w;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:Le22/c55/s88/g/s;


# direct methods
.method constructor <init>(Le22/c55/s88/g/s;)V
    .locals 0

    iput-object p1, p0, Le22/c55/s88/g/w;->a:Le22/c55/s88/g/s;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    iget-object v0, p0, Le22/c55/s88/g/w;->a:Le22/c55/s88/g/s;

    invoke-static {v0}, Le22/c55/s88/g/s;->a(Le22/c55/s88/g/s;)I

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Le22/c55/s88/g/w;->a:Le22/c55/s88/g/s;

    invoke-static {v0}, Le22/c55/s88/g/s;->c(Le22/c55/s88/g/s;)Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Le22/c55/s88/g/w;->a:Le22/c55/s88/g/s;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Le22/c55/s88/g/s;->a(Le22/c55/s88/g/s;Z)Landroid/widget/FrameLayout;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/Activity;->setContentView(Landroid/view/View;)V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Le22/c55/s88/g/w;->a:Le22/c55/s88/g/s;

    invoke-static {v0}, Le22/c55/s88/g/s;->b(Le22/c55/s88/g/s;)Le22/c55/s88/g/y;

    move-result-object v0

    invoke-virtual {v0}, Le22/c55/s88/g/y;->b()V

    goto :goto_0
.end method
