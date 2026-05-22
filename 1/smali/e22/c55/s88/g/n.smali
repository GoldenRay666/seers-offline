.class Le22/c55/s88/g/n;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field final synthetic a:Le22/c55/s88/g/m;


# direct methods
.method constructor <init>(Le22/c55/s88/g/m;)V
    .locals 0

    iput-object p1, p0, Le22/c55/s88/g/n;->a:Le22/c55/s88/g/m;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    iget-object v0, p0, Le22/c55/s88/g/n;->a:Le22/c55/s88/g/m;

    invoke-static {v0}, Le22/c55/s88/g/m;->a(Le22/c55/s88/g/m;)Le22/c55/s88/g/o;

    move-result-object v1

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-interface {v1, v0}, Le22/c55/s88/g/o;->b(I)V

    return-void
.end method
