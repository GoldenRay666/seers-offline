.class Le22/c55/s88/c/k;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:[Le22/c55/s88/c/e;

.field final synthetic b:Le22/c55/s88/c/j;


# direct methods
.method constructor <init>(Le22/c55/s88/c/j;[Le22/c55/s88/c/e;)V
    .locals 0

    iput-object p1, p0, Le22/c55/s88/c/k;->b:Le22/c55/s88/c/j;

    iput-object p2, p0, Le22/c55/s88/c/k;->a:[Le22/c55/s88/c/e;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Le22/c55/s88/c/k;->b:Le22/c55/s88/c/j;

    iget-object v0, v0, Le22/c55/s88/c/j;->b:Le22/c55/s88/c/i;

    invoke-static {v0}, Le22/c55/s88/c/i;->b(Le22/c55/s88/c/i;)Le22/c55/s88/c/l;

    move-result-object v0

    iget-object v1, p0, Le22/c55/s88/c/k;->a:[Le22/c55/s88/c/e;

    invoke-interface {v0, v1}, Le22/c55/s88/c/l;->a([Le22/c55/s88/c/e;)V

    return-void
.end method
