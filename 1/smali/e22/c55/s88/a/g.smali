.class public Le22/c55/s88/a/g;
.super Landroid/widget/BaseAdapter;

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private a:Ljava/util/List;

.field private b:Le22/c55/s88/e/a;

.field private c:Landroid/content/Context;

.field private d:Landroid/os/Handler;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/util/List;)V
    .locals 1

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Le22/c55/s88/a/g;->a:Ljava/util/List;

    new-instance v0, Le22/c55/s88/a/h;

    invoke-direct {v0, p0}, Le22/c55/s88/a/h;-><init>(Le22/c55/s88/a/g;)V

    iput-object v0, p0, Le22/c55/s88/a/g;->d:Landroid/os/Handler;

    iput-object p1, p0, Le22/c55/s88/a/g;->c:Landroid/content/Context;

    iput-object p2, p0, Le22/c55/s88/a/g;->a:Ljava/util/List;

    return-void
.end method

.method static synthetic a(Le22/c55/s88/a/g;)Landroid/content/Context;
    .locals 1

    iget-object v0, p0, Le22/c55/s88/a/g;->c:Landroid/content/Context;

    return-object v0
.end method


# virtual methods
.method public getCount()I
    .locals 1

    iget-object v0, p0, Le22/c55/s88/a/g;->a:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Le22/c55/s88/a/g;->a:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getItemId(I)J
    .locals 2

    int-to-long v0, p1

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 6

    iget-object v0, p0, Le22/c55/s88/a/g;->c:Landroid/content/Context;

    const/4 v1, 0x5

    invoke-static {v0, v1}, Le22/c55/s88/f/b;->a(Landroid/content/Context;I)Landroid/graphics/Bitmap;

    move-result-object v0

    iget-object v1, p0, Le22/c55/s88/a/g;->c:Landroid/content/Context;

    invoke-static {v1, v0}, Le22/c55/s88/f/b;->a(Landroid/content/Context;Landroid/graphics/Bitmap;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    check-cast p2, Le22/c55/s88/a/i;

    if-nez p2, :cond_0

    new-instance p2, Le22/c55/s88/a/i;

    iget-object v0, p0, Le22/c55/s88/a/g;->c:Landroid/content/Context;

    invoke-direct {p2, p0, v0}, Le22/c55/s88/a/i;-><init>(Le22/c55/s88/a/g;Landroid/content/Context;)V

    :cond_0
    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v0

    const-string v2, "mounted"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "/"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v2, Le22/c55/s88/f/e;->h:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v0, p0, Le22/c55/s88/a/g;->a:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le22/c55/s88/c/e;

    iget v0, v0, Le22/c55/s88/c/e;->e:I

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "/"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v2, Le22/c55/s88/f/e;->w:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_2

    iget-object v1, p0, Le22/c55/s88/a/g;->c:Landroid/content/Context;

    invoke-static {v1, v0}, Le22/c55/s88/f/i;->c(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    :goto_0
    invoke-static {p2}, Le22/c55/s88/a/i;->a(Le22/c55/s88/a/i;)Landroid/widget/ImageView;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    invoke-static {p2}, Le22/c55/s88/a/i;->b(Le22/c55/s88/a/i;)Landroid/widget/TextView;

    move-result-object v1

    iget-object v0, p0, Le22/c55/s88/a/g;->a:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le22/c55/s88/c/e;

    iget-object v0, v0, Le22/c55/s88/c/e;->d:Ljava/lang/String;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-static {p2}, Le22/c55/s88/a/i;->c(Le22/c55/s88/a/i;)Landroid/widget/TextView;

    move-result-object v1

    iget-object v0, p0, Le22/c55/s88/a/g;->a:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le22/c55/s88/c/e;

    iget-object v0, v0, Le22/c55/s88/c/e;->h:Ljava/lang/String;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p2, p0, p1}, Le22/c55/s88/a/i;->a(Landroid/view/View$OnClickListener;I)V

    invoke-virtual {p0}, Le22/c55/s88/a/g;->getCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    if-ne p1, v0, :cond_1

    invoke-virtual {p2}, Le22/c55/s88/a/i;->a()V

    :cond_1
    return-object p2

    :cond_2
    new-instance v2, Le22/c55/s88/e/a;

    iget-object v3, p0, Le22/c55/s88/a/g;->c:Landroid/content/Context;

    iget-object v0, p0, Le22/c55/s88/a/g;->a:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le22/c55/s88/c/e;

    invoke-static {v0}, Le22/c55/s88/f/a;->a(Le22/c55/s88/c/e;)Le22/c55/s88/e/j;

    move-result-object v0

    iget-object v4, p0, Le22/c55/s88/a/g;->d:Landroid/os/Handler;

    invoke-direct {v2, v3, v0, v4}, Le22/c55/s88/e/a;-><init>(Landroid/content/Context;Le22/c55/s88/e/j;Landroid/os/Handler;)V

    iput-object v2, p0, Le22/c55/s88/a/g;->b:Le22/c55/s88/e/a;

    new-instance v2, Le22/c55/s88/b/f;

    iget-object v0, p0, Le22/c55/s88/a/g;->a:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le22/c55/s88/c/e;

    iget-object v3, v0, Le22/c55/s88/c/e;->k:Ljava/lang/String;

    iget-object v4, p0, Le22/c55/s88/a/g;->c:Landroid/content/Context;

    sget-object v5, Le22/c55/s88/f/e;->w:Ljava/lang/String;

    iget-object v0, p0, Le22/c55/s88/a/g;->a:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le22/c55/s88/c/e;

    iget v0, v0, Le22/c55/s88/c/e;->e:I

    invoke-static {v4, v5, v0}, Le22/c55/s88/f/a;->b(Landroid/content/Context;Ljava/lang/String;I)Ljava/io/File;

    move-result-object v0

    const/4 v4, 0x0

    invoke-direct {v2, v3, v0, v4}, Le22/c55/s88/b/f;-><init>(Ljava/lang/String;Ljava/io/File;I)V

    const/4 v0, -0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v2, v0}, Le22/c55/s88/b/f;->a(Ljava/lang/Object;)V

    iget-object v0, p0, Le22/c55/s88/a/g;->c:Landroid/content/Context;

    iget-object v3, p0, Le22/c55/s88/a/g;->b:Le22/c55/s88/e/a;

    invoke-static {v0, v2, v3}, Le22/c55/s88/e/g;->a(Landroid/content/Context;Le22/c55/s88/b/f;Le22/c55/s88/b/a;)V

    :cond_3
    move-object v0, v1

    goto/16 :goto_0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 4

    iget-object v1, p0, Le22/c55/s88/a/g;->a:Ljava/util/List;

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Le22/c55/s88/a/g;->c:Landroid/content/Context;

    iget-object v2, p0, Le22/c55/s88/a/g;->a:Ljava/util/List;

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le22/c55/s88/c/e;

    invoke-static {v0}, Le22/c55/s88/f/a;->a(Le22/c55/s88/c/e;)Le22/c55/s88/e/j;

    move-result-object v0

    invoke-static {v1, v0}, Le22/c55/s88/f/a;->c(Landroid/content/Context;Le22/c55/s88/e/j;)V

    invoke-static {}, Le22/c55/s88/c/a;->a()Le22/c55/s88/c/a;

    move-result-object v1

    iget-object v2, p0, Le22/c55/s88/a/g;->c:Landroid/content/Context;

    iget-object v3, p0, Le22/c55/s88/a/g;->a:Ljava/util/List;

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le22/c55/s88/c/e;

    invoke-static {v0}, Le22/c55/s88/f/a;->a(Le22/c55/s88/c/e;)Le22/c55/s88/e/j;

    move-result-object v0

    iget v0, v0, Le22/c55/s88/e/j;->h:I

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v0, v3}, Le22/c55/s88/c/a;->a(Landroid/content/Context;II)V

    iget-object v1, p0, Le22/c55/s88/a/g;->c:Landroid/content/Context;

    iget-object v2, p0, Le22/c55/s88/a/g;->a:Ljava/util/List;

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le22/c55/s88/c/e;

    invoke-static {v1, v0}, Le22/c55/s88/f/a;->a(Landroid/content/Context;Le22/c55/s88/c/e;)Z

    :cond_0
    return-void
.end method
