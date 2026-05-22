.class Le22/c55/s88/j;
.super Ljava/util/TimerTask;


# instance fields
.field final synthetic a:Le22/c55/s88/Vrr;


# direct methods
.method constructor <init>(Le22/c55/s88/Vrr;)V
    .locals 0

    iput-object p1, p0, Le22/c55/s88/j;->a:Le22/c55/s88/Vrr;

    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Le22/c55/s88/j;->a:Le22/c55/s88/Vrr;

    invoke-static {v0}, Le22/c55/s88/Vrr;->b(Le22/c55/s88/Vrr;)Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Le22/c55/s88/k;

    invoke-direct {v1, p0}, Le22/c55/s88/k;-><init>(Le22/c55/s88/j;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method
